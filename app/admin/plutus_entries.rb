ActiveAdmin.register Plutus::Entry do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :description, :date, :commercial_document_id, :commercial_document_type, :guid
  #
  # or
  #
  # permit_params do
  #   permitted = [:description, :date, :commercial_document_id, :commercial_document_type, :guid]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    selectable_column
    id_column
    column 'Description' do |entry|
      entry.description
    end
    column :date
    column :guid
    column :from_account
    column :to_account
    actions
  end

  form do |f|
    f.inputs do
      f.input :description
      f.input :date
      f.input :guid
    end
    f.actions
  end

end
