class BandsController < ApplicationController
  before_action :set_band, only: %i[ show update destroy ]

  # GET /bands
  def index
    @bands = Band.all

    @users = User.find(1)
    @static_user = @users.dup
    

    out = []
    10.times { |i| out << i }
    # puts(out)

    { a: 1, b: 2, c: 3 }

    fruits = { coconut: 1, apple: 2, banana: 3 }

    #assign value to array
    fruits[:orange] = 4 
    #retrive the hash value 
    puts(fruits[:orange])

    #fatch value 
    puts(fruits.fetch(:coconutt,0))
    puts(@static_user.name )
    # render json: @bands
    # ExampleWorker.perform_async(@static_user.name)
    # ExampleWorker.perform_later("Soni")

    puts("****************** sorting by value **********************")
    sorting = { c: 3, b: 7, a: 2 }.sort_by(&:last)
    puts(sorting)


  puts("************************merge to hash map ****************")
  
  defaults    = { a: 1, b: 2, c: 3 }
  preferences = { c: 4 }
  margervalue = defaults.merge!(preferences)
  puts(margervalue.keys)
  puts(margervalue.values)
  puts(margervalue)

  puts("******************* check key is present or not *********************")

  h = { ice_cream: 1, chocolate: 2, beer: 3 }
  puts(h.key?(:ice_cream))
  # true
  puts(h.key?(:tomato))

  puts("******************* find duplicates inside array *********************")
  
  puts("aaabcd"
  .each_char
  .with_object(Hash.new(0)) { |ch, hash| hash[ch] += 1 })

  puts("******************* stack *********************")

  stack = [1,2,3,4,5]

  puts((4..stack.size).map { 
    stack.pop })
  puts("******************* loop *********************")

  numbers = [1, 3, 5, 7]
  numbers.each { 
    |n| 
    puts n 
  }

  puts("******************* yield  *********************")

  make_salad { |ingredient| puts "Adding #{ingredient} to salad!" }


  puts("******************* range in *********************")

  (10...15).each do |n| 
    print n, ' ' 
 end

  puts("******************* end *********************")






  render json: @users

    # BuyTimeWorker.perform_async()
    # render json: { data: "team" }



    dictionary = {
  opportunity: [
    "a set of circumstances that makes it possible to do something",
    "a situation or condition favorable for attainment of a goal"
  ],
  creativity: [
    "the use of imagination or original ideas to create something new",
    "the ability to create",
    "the process where new ideas emerge from combining existing ideas in new ways"
  ]
}


puts(dictionary[:creativity][1])
  end

  # GET /bands/1
  def show
    render json: @band
  end

  def make_salad
    yield "lettuce"
    yield "carrots"
    yield "olive oil"
  end

  # POST /bands
  def create
    @band = Band.new(band_params)


    if @band.save
      render json: @band, status: :created, location: @band
    else
      render json: @band.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bands/1
  def update
    if @band.update(band_params)
      render json: @band
    else
      render json: @band.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bands/1
  def destroy
    @band.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_band
      @band = Band.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def band_params
      params.require(:band).permit(:name)
    end
end
