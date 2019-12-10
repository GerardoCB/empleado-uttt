json.extract! empleado, :id, :strNombre, :strApellidoPaterno, :strApellidoMaterno, :dteFechaNacimiento, :created_at, :updated_at
json.url empleado_url(empleado, format: :json)
