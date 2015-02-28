
float  xPos = 0 ;
float xDir = 3;
float yPos = 0;
float yDir = 2;
void setup() {
  size(400, 400);
  background(0);
}
void draw () {  
 
 
  if (mousePressed)
  {

    ellipse(mouseX, mouseY, 10, 10);
    fill( 0);

    noCursor ();
  }
  else { ellipse( xPos, yPos, mouseX, mouseY);
   
    
    fill( random(255), random(255), random(200), 30);

   ellipse( height/2, width/2, xPos, yPos);


    if (xPos>mouseX) {
      xDir = -3;
    }
    if (xPos < 0) {
      xDir = 1;
    }
    if (yPos>height) {
      yDir = -2;
    }
    if (yPos< 0) {
      yDir = 3;
    }

    yPos = yPos + yDir;
    xPos = xPos + xDir;
  }
}
