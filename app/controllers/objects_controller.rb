class ObjectsController < ApplicationController
  def index
    @bucket_name = params[:bucket_id]
    @prefix = params[:prefix]
    @bucket = OSS.client.get_bucket(@bucket_name)
    @objects = @bucket.list_objects(:prefix => @prefix, :delimiter => '/')
  end

  def download
    puts ">>>>>>>>>>>>>>>>>>>>>>>"
    @bucket_name = params[:bucket_id]
    @bucket = OSS.client.get_bucket(@bucket_name)
    @object_name = params[:id]
    #@object = @bucket.get_object(@object_name, :file => '/home/zn/work')
    @object = @bucket.object_url(@object_name)
    puts "#{@object}>>>>>>>>>"
    send_file "http://pic4.nipic.com/20091217/3885730_124701000519_2.jpg" , :filename => "bbb.jpg", :type => "application/force-download", :x_sendfile=>true
  end
end
