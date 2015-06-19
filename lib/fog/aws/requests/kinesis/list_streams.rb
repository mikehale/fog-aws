module Fog
  module AWS
    class Kinesis
      class Real
        # List availabe streams
        #
        # ==== Options
        # * ExclusiveStartStreamName<~String>: The name of the stream to start the list with.
        # * Limit<~Number>: The maximum number of streams to list.
        # ==== Returns
        # * response<~Excon::Response>:
        #
        # ==== See Also
        # https://docs.aws.amazon.com/kinesis/latest/APIReference/API_ListStreams.html
        #
        def list_streams(options={})
          response = request({
                               'X-Amz-Target' => 'Kinesis_20131202.ListStreams',
                               :body          => {},
                             }.merge(options))
          response.body = Fog::JSON.decode(response.body) unless response.body.nil?
          response
        end
      end

      class Mock
        def list_streams(options={})
          raise Fog::Mock::NotImplementedError
        end
      end
    end
  end
end