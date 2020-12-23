class CandidateDetailSerializer < ActiveModel::Serializer
  

  include Rails.application.routes.url_helpers
  attributes :id, :first, :last, :email, :phone, :degree, :percentage, :experience, :platform, :filename
  
  def file
      rails_blob_path(object.filename, only_path: true) if object.filename.attached?
  end
end
