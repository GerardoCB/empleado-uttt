class Empleado < ApplicationRecord
  validates :strNombre, format: {with: /\A[a-zA-Z, ]+\z/,message: "El campo Nombre solo admite letras y espacios" },:presence => {message: "Nombre no puede estar vacío" }, length:{
    maximum:50,
  too_long: "El campo nombre solo admite un máximo de %{count} carácteres"}
  validates :strApellidoPaterno, format: {with: /\A[a-zA-Z, ]+\z/,message: "El campo Apellido Paterno solo admite letras y espacios" },:presence => { message: "Apellido Paterno no puede estar vacío" }, length:{
    maximum:50,
  too_long: "El campo Apellido Paterno solo admite un máximo de %{count} carácteres"}
  validates :strApellidoMaterno, format: {with: /\A[a-zA-Z, ]+\z/,message: "El campo Apellido Materno solo admite letras y espacios" } ,:presence => { message: "Apellido Materno no puede estar vacío" }, length:{
    maximum:50,
  too_long: "El campo Apellido Materno solo admite un máximo de %{count} carácteres"}
end
