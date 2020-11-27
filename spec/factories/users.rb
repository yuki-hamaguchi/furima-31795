FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { 'test@example' }
    password              { '111aaa' }
    password_confirmation { password }
    last_name             { '田中' }
    first_name            { '太朗' }
    last_name_kana        { 'タナカ' }
    first_name_kana       { 'タロウ' }
    birth_date            { '1950-01-01' }
  end
end
