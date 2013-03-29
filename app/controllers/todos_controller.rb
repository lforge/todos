class TodosController < ApplicationController
  # GET /todos
  # GET /todos.json
  def index
    #@todos = Todo.all
    # Jude modify it to sort by 
    @todos = Todo.order('name')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @todos }
    end
  end

  # GET /todos/1
  # GET /todos/1.json
  def show
    @todo = Todo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @todo }
    end
  end

  # GET /todos/new
  # GET /todos/new.json
  def new
    @todo = Todo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @todo }
    end
  end

  # GET /todos/1/edit
  def edit
    @todo = Todo.find(params[:id])
  end

  # POST /todos
  # POST /todos.json
  def create
    @todo = Todo.new(params[:todo])

    respond_to do |format|
      if @todo.save
        
        v_toDoName = @todo.name
        
        #format.html { redirect_to @todo, notice: 'Todo was successfully created.' }
        # Jude Lam modify it to render action index instead.
        format.html { redirect_to todos_url, notice: 'Todo ' + v_toDoName + ' was successfully created.' }
        format.json { render json: @todo, status: :created, location: @todo }
      else
        format.html { render action: "new" }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /todos/1
  # PUT /todos/1.json
  def update
    @todo = Todo.find(params[:id])

    respond_to do |format|
      if @todo.update_attributes(params[:todo])
        v_toDoName = @todo.name
        
        ##format.html { redirect_to @todo, notice: 'Todo ' + v_toDoName + ' was successfully updated.' }
        #Jude Lam modify this to redirect to index and add the v_toDoName.
        format.html { redirect_to todos_url, notice: 'Todo ' + v_toDoName + ' was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todos/1
  # DELETE /todos/1.json
  def destroy
    @todo = Todo.find(params[:id])
    v_toDoName = @todo.name
    
    @todo.destroy

    respond_to do |format|
      format.html { redirect_to todos_url, notice: 'Todo ' + v_toDoName + ' was successfully deleted.' }
      format.json { head :no_content }
    end
  end
end # end of Class end
