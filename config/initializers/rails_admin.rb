

RailsAdmin.config do |config|

  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)



  ## == Cancan ==
   config.authorize_with :cancan


  config.model 'Article' do
    label '글'
    label_plural '글'
  end

  config.model 'Comment' do
    label '댓글'
    label_plural '댓글'
  end

  config.model 'Role' do
    label '신분'
    label_plural '신분'
  end

  config.model 'User' do
    label '회원'
    label_plural '회원'
  end

  config.included_models = %w(Article Comment Role) #rails_admin에 표현하기
  config.excluded_models = %w(User) #rails_admin에 표현안하기

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
