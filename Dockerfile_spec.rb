require "serverspec"
require "docker"

describe "Dockerfile" do
  before(:all) do
    if ENV['IMAGEID']
      image = Docker::Image.get(ENV['IMAGEID'])
    else
      image = Docker::Image.build_from_dir('.')
    end

    set :os, family: :debian
    set :backend, :docker
    set :docker_image, image.id
  end

  describe port(8000) do
    it "pyload should be listening" do
      wait_retry 30 do
        should be_listening
      end
    end
  end

end

def wait_retry(time, increment = 1, elapsed_time = 0, &block)
  begin
    yield
  rescue Exception => e
    if elapsed_time >= time
      raise e
    else
      sleep increment
      wait_retry(time, increment, elapsed_time + increment, &block)
    end
  end
end
