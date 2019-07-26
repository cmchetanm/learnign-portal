class TopicSerializer < ActiveModel::Serializer
  attributes :id, :title, :chapters

  def chapters 
    ActiveModel::Serializer::CollectionSerializer.new(object.chapters, serializer: ChapterSerializer , user: @instance_options[:user])
  end
end
