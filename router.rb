# frozen_string_literal: true

module Router
  class << self
    attr_accessor :route
  end

  @route = Proc.new do |env|
    req_path = env['REQUEST_PATH']
    case req_path
    when '/'
      [200, {'content-type' => 'text/plain'}, ['home page']]
    when %r{\A/public/(.*)\z}
      [200, {'content-type' => 'text/plain'}, [File.read('public/' + $1)]]

    # when %r{\A/style/(.*).css\z}
    #   nil
    # when %r{\A/scripts/(.*).js\z}
    #   nil
    # when %r{\A/images/(.*).png\z}  # TODO include other formats
    #   nil

    else
        [404, {'content-type' => 'text/plain'}, ['Not found']]
    end
  end
end