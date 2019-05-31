class Registro < ApplicationRecord
    validates :descripcion, presence: true, length: {minimum: 3}
end
