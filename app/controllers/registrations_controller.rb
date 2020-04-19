# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  skip_before_action :require_no_authentication

  def create
    super do
      if current_user.try(:admin)
        if not ["district_admin", "panchayat_admin", "phone_caller"].include?(resource.role)
          resource.role = "traveller"
          resource.save
        end
      elsif current_user.try(:district_admin)
        if not ["panchayat_admin", "phone_caller"].include?(resource.role)
          resource.role = "traveller"
          resource.save
        end
      end

      sign_in resource
      redirect_to root_path
    end
  end

  private

  def redirect_unless_admin
    unless current_user.try(:admin?) || current_user.try(:district_admin?)
      flash[:alert] = "Access Denied! Only Admins are Allowed Access"
      redirect_to root_path
    end
  end

  def sign_up(resource_name, resource)
    true
  end

  def after_sign_up_path_for(resource)
    new_user_registration_path
  end
end
