require 'test_helper'
require 'bunny'

describe Top::Bunny::Sensu do
  before do
    @sensu = Top::Bunny::Sensu.new(hostname: 'sensu', user: 'sensu',
                                   password: 'sensu', vhost: 'sensu',
                                   client: 'test01')
    @hostname = @sensu.hostname
    @user = @sensu.user
    @password = @sensu.password
    @vhost = @sensu.vhost
    @client = @sensu.client
  end

  it 'should return correct client from msgdata' do
    check_msg = @sensu.msgdata(check_name: 'my-check',
                               message: 'test check', level: 0)
    assert_equal('test01', check_msg[:client])
  end

  it 'should return correct check name from msgdata' do
    check_msg = @sensu.msgdata(check_name: 'my-check',
                               message: 'test check', level: 0)
    assert_equal('my-check', check_msg[:check][:name])
  end

  it 'should return correct message from msgdata' do
    check_msg = @sensu.msgdata(check_name: 'my-check',
                               message: 'test check', level: 0)
    assert_equal('test check', check_msg[:check][:output])
  end

  it 'should return correct level from msgdata' do
    check_msg = @sensu.msgdata(check_name: 'my-check',
                               message: 'test check', level: 0)
    assert_equal(0, check_msg[:check][:status])
  end
end
