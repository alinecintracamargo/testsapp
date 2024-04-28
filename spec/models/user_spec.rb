require 'rails_helper'

describe User do
  it "é válido quando nome, último nome e email estão presentes" do
   user = User.new( firstname: 'Bruce',
    lastname: 'Dickinson',
    email: 'bruce@ironmaiden.com' )
    expect(user).to be_valid
  end

  it "é invalido sem o primeiro nome" do
    user = User.new(firstname: nil)
    user.valid?
    expect(user.errors[:firstname]).to include("can't be blank")

  end
   it "é inválido caso já exista um e-mail igual" do
    user = User.create( firstname: 'Steve',
     lastname: 'Harris', email: 'contato@ironmaiden.com' )
    user = User.new( firstname: 'Bruce',
     lastname: 'Dickinson', email: 'contato@ironmaiden.com' )
    user.valid?
    expect(user.errors[:email]).to include('has already been taken')

  end
end

# describe User do
