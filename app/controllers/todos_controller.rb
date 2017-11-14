class TodosController < ApplicationController

  def index
    @x = params[:flag]
    
    if @x == "0"
     @todos = Todo.all
    elsif @x == "1"
      @todos = Todo.where(done: false)
    elsif @x == "2"
      @todos = Todo.where(done: true)
    else
      @todos = Todo.where(done: false)
    end       
  end
  
  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.done = true
    if @todo.save
      redirect_to(todos_path)
    else
      render :new
    end
  end


  def show
    @todo = Todo.find(params[:id])     
  end
  
  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      redirect_to todos_path
    else
      render :edit
    end
  end
  
  
  def check
    
    @todo = Todo.find(params[:id])
    
    if @todo.done == false
      @type = "1"
    elsif @todo.done == true
      @type = "2"
    else
      @type = "0"
    end
    
    @todo.done = !@todo.done;
    @todo.save
    

    redirect_to todos_path(@todo, flag: @type)
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to todos_path
  end


  private

  def todo_params
    params.require(:todo).permit(:title, :notes, :due_date, :done)
  end

  
  

end
