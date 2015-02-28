
class Snake {
    private final int speed = 10; //How far the snake moves each time, 10 as that's the width of the background squares
    private final int sLength = 10; //length of the snake
    private final int sSize = 10; //size of each square drawn
    private final int followChance = (int) random(1, 5); //changes the likihood that the snake will go in the direction of the mouse, lower = more chance
    private final color c= color(random(255),230,255,100); //the colour of the snake
    private final int arrayPos; //where in the array the snake is located, used so make sure the correct snake is being removed from the array
    
    public int[] tailX; //array holding the x position of the snake points
    public int[] tailY; //array holding the y position of the snake points
    public int xpos; //the x position of the snake square
    public int ypos; //the y position of the snake square
    
    public int age = 0; //how old the snake is
    

    public Snake(int tempxpos, int tempypos, int j) {
        arrayPos = j;
      
        xpos = tempxpos - (tempxpos%10); //ensures that the starting mouse click position is on a grid
        ypos = tempypos - (tempypos%10);

        tailX = new int[sLength]; // This should initialize the array to the length specified
        tailY = new int[sLength];

        // Fills the array with the inital position
        for (int i = 0; i < tailX.length; i++) {
            tailX[i] = xpos;
            tailY[i] = ypos;
        }
    }

    /*=======The method which displays and moves the snake=========*/ 
    public void display () {
        age++; 

        // Shifts the array values for a new value
        for (int i = 0; i < tailX.length - 1; i++) {
            tailX[i] = tailX[i + 1];
            tailY[i] = tailY[i + 1];
        }

        ageCheck();

        //drawing the snake
        for(int i = 0; i < tailX.length; i++){
            fill(c);
            rect(tailX[i], tailY[i], sSize, sSize);
        }
        
        //checking the snake isn't out of bounds on the x axis, sending it back in if it is
        if(outOfBoundsX() == false){//if it makes it this far then the snake is currently in bounds so move it
            moveX();
        }            

         if(outOfBoundsY() == false){
             moveY();
        }
    }
    
    /*Checks if the snake is out of bounds on the y axis*/
    private boolean outOfBoundsY(){
        if(ypos < 0){
            ypos = ypos + sSize;
            return true;
        } else 
        if(ypos > width){
            ypos = ypos - sSize;
            return true;
        }   
        return false;
    }
    
    /*Checks if the snake is out of bounds on the x axis*/
    private boolean outOfBoundsX(){
        if(xpos < 0){
            xpos += sSize;
            return true;
        } else 
        if(xpos > width){
            xpos -= sSize;
            return true;
        }
        return false;
    }
    
    /*Checks the age of the snake and removes once it's too old
    also controls the creation of the new snake points.*/
    private void ageCheck(){
        if(age < ageLimit){
            tailX[tailX.length - 1] = xpos;
            tailY[tailY.length - 1] = ypos;
        }
        
        if(age > ageLimit + sSize){
            snakeArray[arrayPos] = null;
        }
    }
    
    /*moves the snake in the direction of the mouse on the y axis*/
    private void moveX(){
       int chance = (int) random(1,11); //the chance which decides which direction it moves in
      
       if(mouseX > xpos){ //if the mouse is to the right of the snake then there's a greater chance it will move to the right
            if(chance <= followChance){
                xpos -= sSize;
            } else{
                xpos += sSize;
            }
        }

        if(mouseX < xpos){  //if the mouse is to the left of the snake then there's a greater chance it will move to the left
            if(chance <= followChance){
                xpos += sSize;
            } else{
                xpos -= sSize;
            }
        }
   }
    
    /*moves the snake in the direction of the mouse on the x axis*/
    private void moveY(){
       int chance = (int) random(1,11); //the chance which decides which direction it moves in
      
       if(mouseY > ypos){ //if the mouse is to the right of the snake then there's a greater chance it will move to the right
           if(chance <= 3){
               ypos -= sSize;
           } else{
               ypos += sSize;
           }
        }

        if(mouseY < ypos){  //if the mouse is to the left of the snake then there's a greater chance it will move to the left
            if(chance <= 3){
                ypos += sSize;
            } else{
                ypos -= sSize;
            }
        }
    }
}

