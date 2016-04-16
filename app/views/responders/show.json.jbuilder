ret_responder = @responder.attributes
ret_responder[:type] =  @responder[:rescue_type]
json.extract! ret_responder, :type, 'name', 'capacity'
