json.extract! candidate_detail, :id, :first, :last, :email, :phone, :degree, :marks, :experience, :platform, :created_at, :updated_at
json.url candidate_detail_url(candidate_detail, format: :json)
