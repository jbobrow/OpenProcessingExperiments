
// The ball will stop bouncing after it reaches the bottom the screen,
// you will have to re-start the program to make the ball bounce again, or else 
// the ball will just go down to the screen and no bouncing will ever happen again, 
// just re-start the program, after the ball stop bouncing and retracts to the start coordinates.
int x = 0;
int dir = 1;
int maxHeight = 450; // Stops the ball before it gets off the screen
boolean mouseRelease = true; // This makes 
void setup(){
  loop();
  size(450,450);
  background(0);
}
void draw(){
  background(0);
  bouncing_ball();
  if(mouseRelease){ // When the left-click is released then the will retract back to it's original coordinates
     x = x -3;
     if(x <= 0){
       x = 0;
     }
  }else { 
    x = x + dir*3;
    if(x >= 450 - 90){
      dir = -1;
      maxHeight = maxHeight*3/4; 
    } else if(x <= 450 - maxHeight){
    dir =  1;
     }else if(maxHeight <= 125){
       dir = 0;
     }
  }
}
void bouncing_ball(){ // Creates a ball with a shiny point, almost like a real ball
  ellipse(65, 65+x, 65, 65);
  ellipse(75, 50+x, 13, 10);
}
void mousePressed(){ // When mouse is clicked it moves, and does not retracts back to the starting coordinate
  mouseRelease = false;
}
void mouseReleased(){ // When mouse is released it stops, and retracts back to the starting coordinate
  mouseRelease = true;
}

