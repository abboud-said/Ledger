ActiveAdmin.register Plutus::Account do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :guid, :currency, :tenant_id, :type
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :type, :contra, :tenant_id, :guid, :currency]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  #

  filter :name
  filter :guid
  filter :currency
  filter :owner

=begin
  controller do
    def create
      puts "*******************************************"
      binding.break
    end
  end
=end

  index do
    selectable_column
    id_column
    column 'Guid' do |acc|
      acc.guid
    end
    column :name
    column :type do |acc|
      Plutus::Account.types_human_readable[acc.type]
    end
    column :currency
    column :owner
    column :amount do |acc|
      acc.balance
    end
    actions
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :type, as: :select, collection: Plutus::Account.types
      f.input :name
      f.input :guid
      f.input :currency
      f.input :owner
    end
    f.actions
  end

  show do
    attributes_table do
      row :type
      row :name
      row :guid
      row :currency
      row :owner
    end
  end
  
end
