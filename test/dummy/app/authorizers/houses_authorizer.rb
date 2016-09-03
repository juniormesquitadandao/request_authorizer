# Authorize reference controller actions when return:
#   Present values different hash:
#     ex.:
#       true
#       'nil'
#       'false'
#       0
#       '0'
#       [0]
#   Empty requested params:
#     ex. to requested params {}:
#       { id: [1, 2] }
#       { id: ['1', '2'] }
#       { id: ['one', 'two'] }
#   A hash with key:values including requested params key:value:
#     ex. to requested params {id: 1, other: 3}:
#       { id: [1, 2] }
#       { id: ['1', '2'] }
#     ex. to requested params {id: 'one', other: 'three'}:
#       { id: ['one', 'two'] }
#   A hash with keys different requested params keys:
#     ex. to requested params {other: 3}:
#       { id: [1, 2] }
#       { id: ['1', '2'] }
#     ex. to requested params {other: 'three'}:
#       { id: ['one', 'two'] }

# Unauthorize reference controller actions when return:
#   Blank values different hash:
#     ex.:
#       nil
#       false
#       ''
#       ' '
#       []
#   A hash with key:values excluding requested params key:value:
#     ex. to requested params {id: 3, other: 3}:
#       { id: [1, 2] }
#       { id: ['1', '2'] }
#     ex. to requested params {id: 'three', other: 'three'}:
#       { id: ['one', 'two'] }
class HousesAuthorizer < ApplicationAuthorizer

  def index
    true
  end

  def show
    if authenticated.user_group?
      { id: authenticated.house_ids }
    else
      authenticated.admin_group?
    end
  end

  def new
    authenticated.user_group?
  end

  def edit
    if authenticated.user_group?
      { id: authenticated.house_ids }
    else
      authenticated.admin_group?
    end
  end

  def create
    authenticated.user_group?
  end

  def update
    if authenticated.user_group?
      { id: authenticated.house_ids }
    else
      authenticated.admin_group?
    end
  end

  def destroy
    if authenticated.user_group?
      { id: authenticated.house_ids }
    else
      authenticated.admin_group?
    end
  end

end
