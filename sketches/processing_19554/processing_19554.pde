
float x= 0.0;
float y= 0.0; 
void setup() {
  frameRate(15);
  size(250, 250);
  background(#000000);
  fill(#FFFFFF);
  noStroke();
  smooth();
}

void draw() {
  
  //2 circles 
    fill(#FF0379, 200);
    ellipse(10, x, y, 4);
    fill(#0393FF, 200);
    ellipse(240, x, y, 4);
//if mouse is pressed it starts back with clean background + (0,0)
 if(mousePressed){ 
   background(0);
    x = 0.0;
    y = 0.0;
  }
}
//when you move your mouse it add +1 to x and y
void mouseMoved() {
 y = y + 5;
 x = x + 1;
}





  
  

