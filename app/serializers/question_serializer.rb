class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :title, :subjects

  def subjects
    object.subjects.map do |subject|
      {
        id: subject.id,
        title: subject.title,
        topics: subject.topics.map do |topic|
          {
            id: topic.id,
            title: topic.title,
            chapters: topic.chapters.map do |chapter|
              {
                id: chapter.id,
                title: chapter.title,
                questions: @instance_options[:questions].where(chapter_id: chapter.id).map do |question|
                  {
                    id: question.id,
                    title: question.title,
                    options: question.options.map do |option|
                      {
                        id: option.id,
                        title: option.title
                      }
                    end
                  }
                end
              }
            end
          } 
        end
      }
    end
  end
end
