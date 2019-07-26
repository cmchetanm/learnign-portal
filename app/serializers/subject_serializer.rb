class SubjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :topics

  def topics 
    ActiveModel::Serializer::CollectionSerializer.new(object.topics, serializer: TopicSerializer, user: @instance_options[:user])
  end
end
