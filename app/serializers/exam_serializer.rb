class ExamSerializer < ActiveModel::Serializer
  attributes :id, :title, :subjects

  def subjects
    ActiveModel::Serializer::CollectionSerializer.new(object.subjects, serializer: SubjectSerializer, user: @instance_options[:user])
  end
  
end
