class Draw < ApplicationRecord
    validates_uniqueness_of :email, scope: :drawtype
end
