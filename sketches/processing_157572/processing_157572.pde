
int directionX = 0, directionY = 0;
float x=720, y=397, speed=10;


void setup(){
  size(1440, 794); 
  background(255);
  fill(0);
  rect(0,0,1440,110);
  fill(255);
   PFont f = createFont("Arial", 48);
  textAlign(CENTER);
  textFont(f);
  textSize(24);
  text("Use 'WASD' to move & 'Shift' to stop", 720, 30);
 text("Move mouse to change colour", 720, 60); 
  text("Press 'Q' to snap your creation!", 720, 90);
 
}

void draw(){
  fill(random(255), mouseY, mouseX);
  noStroke();
  rect(x, y, 25, 25);
  x=x+speed*directionX;
  y=y+speed*directionY; 
    
    //sets boundary for square
    if ((x>width-12.5) || (x<12.5))
  {   
    directionX=-directionX;
  }
  if ((y>height-12.5) || (y<130))
  {   
    directionY=-directionY;
  }
   
   if(keyPressed == true && key == 'q'){
  println("Saving image...");
  saveFrame("output-####.jpg"); 
}
}

void keyPressed()
{
  //stops square
  if (key == CODED)
  {
    if (keyCode == SHIFT)
    {
      //if (directionY<0) { 
      directionY=0;
      directionX=0;
      //}
    }
  }
  
  //moves square
  if (keyPressed) {
    if (key == 'a' || key == 'A') {
      directionX=-1;
      directionY=0;
    }
    else if (key == 'd' || key == 'D') {
      //if (directionX<0) {  
      directionX=1;
      directionY=0;
      //}
    }
    else if (key == 's' || key == 'S') {
      directionX=0;
      directionY=1;
    }
    else if (key == 'w' || key == 'W') {
      directionX=0;
      directionY=-1;
    }
 }
}



