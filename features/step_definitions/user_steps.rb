Given /^(?:|I )am is a valid user (.+)$/ do |user_name|
  @user = User.create!({
             :email => "#{user_name.downcase}@a.com",
             :login => "#{user_name.downcase}",
             :name => "#{user_name}",
             :password => "password",
             :password_confirmation => "password"
           })
end

Given /^(?:|I )am login as user (.+)$/ do |user|
    Given "I am is a valid user Bob"
    sign_in(@user)
end

