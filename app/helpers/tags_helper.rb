module TagsHelper
  def get_tags(imagurl)
    puts "#{imgurl}"
    uri = URI('https://api.projectoxford.ai/vision/v1.0/analyze')
    uri.query = URI.encode_www_form({
                                        # Request parameters
                                        'visualFeatures' => 'Tags',
                                        'language' => 'en'
                                    })

    request = Net::HTTP::Post.new(uri.request_uri)

    # Request headers
    request['Content-Type'] = 'application/json'
    # Request headers
    request['Ocp-Apim-Subscription-Key'] = '29319fbc62ae42699b82fb25ea255882'
    # Request body
    request.body = "{\"url\":\"#{imgurl}\"}"
    puts "body"
    puts request.body
    response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
      http.request(request)
    end
    puts response.body
    parsed_json = JSON(response.body)
    tag_str=''
    for tag in parsed_json['tags']
      tag_str+=tag['name']+','
    end
    render :text => tag_str[0,tag_str.length-1]
  end

  def get_description
    imgurl=params[:imgurl]
    uri = URI('https://api.projectoxford.ai/vision/v1.0/analyze')
    uri.query = URI.encode_www_form({
                                        # Request parameters
                                        'visualFeatures' => 'Description ',
                                        'language' => 'en'
                                    })

    request = Net::HTTP::Post.new(uri.request_uri)

    # Request headers
    request['Content-Type'] = 'application/json'
    # Request headers
    request['Ocp-Apim-Subs  cription-Key'] = '29319fbc62ae42699b82fb25ea255882'
    # Request bodyhttps://portalstoragewuprod2.azureedge.net/vision/Analysis/1-1.jpg
    request.body = "{\"url\":\"#{imgurl}\"}"
    response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
      http.request(request)
    end
    puts response.body
    parsed_json = JSON(response.body)
    render :text => parsed_json['description']['captions'][0]['text']
  end
end
