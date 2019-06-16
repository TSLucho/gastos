class RegistrosController < ApplicationController
    def index
        @registro = Registro.all.order('created_at DESC')     
    end
    def show
        @registro = Registro.find(params[:id])
    end
    def new
        @registro = Registro.new
    end
    def create
        @registro = Registro.new(parametros_registro)
            if @registro.save
                redirect_to registros_path
            else
                render :new
            end
    end
    private
        def parametros_registro
            params.require(:registro).permit(:gasto, :descripcion, :destino, :user_id)
        end
end
