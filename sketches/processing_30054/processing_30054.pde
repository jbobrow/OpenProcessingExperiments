
//A class filled with funky circles

class Circle {
  
  //makes sure that the circle will appear where
  //the mouse is being clicked
  int posX = mouseX;
  int posY = mouseY;
  
  int velocity = 10;
  
  Circle() {
  }
  
  //Displays the circle
  //and fills them with random colors
  void display() {
    noStroke();
    fill(random(0,255),random(0,255),random(0,255));
    ellipse(posX,posY, 50, 50);
  }
  
  //Moves the circles by adding velocity to X
  //or subtracting it for making the circles stop and turn around by
  //the border
  void move() {

   posX += velocity;
     
   if (posX > width || posX < 0) {
     velocity = -velocity;
   }
  }
}

