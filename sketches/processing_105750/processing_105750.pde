
//Jessica Harsono
//8/6/13

void setup(){ //runs once and sets up 
  size(600,500); //sets screen size  
  frameRate(60); //how fast the object repeats itself
}
 
int dx = 5; //x velocity
int dy = 3; //y velocity
 
int x = 50; //x starting point
int y = 50; //y starting point
 
void draw(){
  background(0); //background color
  if(mousePressed) {
    x = mouseX;
    y = mouseY;
  }
    fill(255); //fill color of object
    ellipse(x,y,25,25); //shape of object (circle)
 
    x = x + dx;
    y = y + dy;
 
    if ( x< 0 || x > 475){ //if the object's x position is less than 0 or more than 475, 
       dx = -1 * dx; //then the object's x velocity is multiplied by -1
    }
  
  
 
    if ( y < 0 || y > 475){ //if the object's y position is less than 0 or more than 475,
       dy = -1 * dy;  //then the object's y velocity is multiplied by -1
    }
 
}
