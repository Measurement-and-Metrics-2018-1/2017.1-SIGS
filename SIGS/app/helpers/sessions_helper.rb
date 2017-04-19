module SessionsHelper

  def sign_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def permission
    coordinator = Coordinator.find_by(user_id: session[:user_id])
    department_assistant = DepartmentAssistant.find_by(user_id: session[:user_id])
    administrative_assistant = AdministrativeAssistant.find_by(user_id: session[:user_id])
    if coordinator
      @level = 1
  elsif department_assistant
      @level = 2
  elsif administrative_assistant
      @level = 3
    end
    @permission ||= @level
  end

  def logged_in?
      if current_user.nil?
        flash.now[:notice] =  'Você precisa estar logado'
        render 'sessions/new'
      end
  end

  def sign_out
    session.delete(:user_id)
    @current_user = nil
    @permission = nil
    @level = nil
  end
end