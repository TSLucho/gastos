class ProductosController < ApplicationController

    # Función que nos muestra el Index de nuestra vista, en este caso de Productos
    def index
        @producto = Producto.all
    end

    # Función que nos muestra un Producto en especifico por su ID
    def show
        @producto = Producto.find(params[:id])
    end

    # Función que nos muestra la vista donde se crean nuevos Productos
    def new
        @producto = Producto.new
    end

    # Función donde podemos editar Productos especificos por si ID
    def edit
        @producto = Producto.find(params[:id])
    end

    # Función para almacenar la información recibida por el controlado New
    def create
        #Que este condigo de abajo puedos observar los datos que estamos enviado desde el formulario
        # render plain: params[:producto].inspect

        @producto = Producto.new(paramatros_producto)

        # Con este condigo de abajo estaríamos redireccionando a la Función de Show
        # @producto.save
        # redirect_to @producto
        # Con este condigo de abajo estamos Redireccionando a la Función Index
            if @producto.save
                redirect_to productos_path
            else
                render :new
            end
    end

    # Función para Actualizar Productos desde la vista de Editar
    def update
        @producto = Producto.find(params[:id])
            if @producto.update(paramatros_producto)
                redirect_to @producto
            else
                render :edit
            end
    end

    # Función para Eliminar un Producto
    def destroy
        @producto = Producto.find(params[:id])
            @producto.destroy
            redirect_to productos_path
    end
    
    # Esto es una función privada que nos permite el almacenamiento en la Base de Datos
    private
        def paramatros_producto
            params.require(:producto).permit(:nombre, :descripcion, :cantidad, :precio)
        end
end
