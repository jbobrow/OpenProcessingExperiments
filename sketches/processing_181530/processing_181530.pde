
  int radius = 10, directionX = 1, directionY = 0;
float x=50, y=50, speed=2;

//PImage img;
void setup()
{
  size(800, 800);
  smooth();
//   img = loadImage("oke.gif");
  noStroke();
  imageMode(CENTER);
  background(0);
}
void draw()
{
  
  // changing Position
  x=x+speed*directionX;
  y=y+speed*directionY; 
  // check boundaries
  if ((x>width-radius) || (x<radius)){   
    directionX=-directionX;
  }
  
  if ((y>height-radius) || (y<radius)) {   
    directionY=-directionY;
  } 
  fill(random(150),random(100,200),random(200));
rect(x,y,20,20);
//  image(img, x, y);

if (keyPressed) {
    if  (key == "s" || key == "S"){
    noLoop();
}
}
}


void keyPressed(){
  if (key == CODED){
   
    if (keyCode == LEFT){ 
      directionX=-1;
      directionY=0;
    
    }
    else if (keyCode == RIGHT){
      directionX=1;
      directionY=0;
    }
    else if (keyCode == UP){
      directionY=-1;
      directionX=0;
 }
    else if (keyCode == DOWN){
      directionY=1;
      directionX=0;
    }
}

}

