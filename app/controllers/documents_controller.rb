class DocumentsController < ApplicationController

  def generate_pdf
    @empleados = Empleados.all
    respond_to do |format|
      format.html
      format.pdf{render template: 'documents/generate_pdf.pdf.erb',page_size: 'Letter',zoom: 1,background: true,margin: {top: 0,bottom:0,left:0,right:0}}
    end
  end
end
