class EmpleadosController < ApplicationController
  before_action :set_empleado, only: [:show, :edit, :update, :destroy]

  # GET /empleados
  # GET /empleados.json
  def index
    begin
      @empleados = Empleado.all
    rescue Exception => e
      NotificacionMailer.aviso(e.message,e.backtrace.inspect).deliver
    end
  end

  # GET /empleados/1
  # GET /empleados/1.json
  def show
  end

  # GET /empleados/new
  def new
    begin
    @empleado = Empleado.new
  rescue Exception => e
    NotificacionMailer.aviso(e.message,e.backtrace.inspect).deliver
  end
  end

  # GET /empleados/1/edit
  def edit
  end

  # POST /empleados
  # POST /empleados.json
  def create
    begin
    @empleado = Empleado.new(empleado_params)

    respond_to do |format|
      if @empleado.save
        format.html { redirect_to @empleado, notice: 'Empleado se creo con exito.' }
        format.json { render :show, status: :created, location: @empleado }
        NotificacionMailer.aviso("Hola","Prueba").deliver
      else
        format.html { render :new }
        format.json { render json: @empleado.errors, status: :unprocessable_entity }
      end
    end
  rescue Exception => e
    NotificacionMailer.aviso(e.message,e.backtrace.inspect).deliver
  end
  end

  # PATCH/PUT /empleados/1
  # PATCH/PUT /empleados/1.json
  def update
    begin
    respond_to do |format|
      if @empleado.update(empleado_params)
        format.html { redirect_to @empleado, notice: 'Empleado se actualizo con exito.' }
        format.json { render :show, status: :ok, location: @empleado }
      else
        format.html { render :edit }
        format.json { render json: @empleado.errors, status: :unprocessable_entity }
      end
    end
  rescue Exception => e
    NotificacionMailer.aviso(e.message,e.backtrace.inspect).deliver
  end
  end

  # DELETE /empleados/1
  # DELETE /empleados/1.json
  def destroy
    begin
    @empleado.destroy
    respond_to do |format|
      format.html { redirect_to empleados_url, notice: 'Empleado se elimino con exito.' }
      format.json { head :no_content }
    end
  rescue Exception => e
    NotificacionMailer.aviso(e.message,e.backtrace.inspect).deliver
  end
  end

  def generate_pdf
    @empleados = Empleado.all
    respond_to do |format|
      format.html
      format.pdf { render template: 'documents/generate_pdf.pdf',page_size: 'Letter',zoom: 1,background: true,margin: {top: 0,bottom:0,left:0,right:0}}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empleado
      begin
      @empleado = Empleado.find(params[:id])
    rescue Exception => e
      NotificacionMailer.aviso(e.message,e.backtrace.inspect).deliver
    end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def empleado_params
      begin
      params.require(:empleado).permit(:strNombre, :strApellidoPaterno, :strApellidoMaterno, :dteFechaNacimiento)
    rescue Exception => e
      NotificacionMailer.aviso(e.message,e.backtrace.inspect).deliver
    end
    end

end
