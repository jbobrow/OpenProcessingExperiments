
int d = 100;
int xPos = 5;
int yPos = 5;

int directionX = 1;
int directionY = 1;

PFont font;
String txt = "Rotating a square around the Z axis. To get the results you expect, send the rotate function angle parameters that are values between 0 and PI*2 (TWO_PI which is roughly 6.28). If you prefer to think about angles as degrees (0-360), you can use the radians() method to convert your values";


void setup(){
  size (400, 400);
  
  font = loadFont("HelveticaNeue-20.vlw");
  textFont(font);

}

 void draw(){ 
   background(180);
   
   textSize(20);
   fill(90, 0, 0);

    text("This is a moving headline", xPos, 40);
     xPos = xPos + 2;
  
  if(xPos > width) {
    xPos = 0;
  }
  
      text("This is a moving headline", xPos, 40);
     yPos = yPos + 2;
  
  if(yPos > height) {
    yPos = 20;
  }
  
  
   textSize(12);
    fill(90, 0, 0);
    
    //if put interlinea texLeading (mouseY/30) si ingrandisce e rimpicciolisce col mouse
 textSize(20);
   fill(200, 0, 0);
   text("This is a static headline", 20, 40);
  
  
   textSize(12);
    fill(90, 0, 0);
    
    //if put interlinea texLeading (mouseY/30) si ingrandisce e rimpicciolisce col mouse
   textLeading(18);
   text(txt, xPos, yPos + 60, 150, 300); 
   
   text(txt, xPos + 170, yPos + 60, 150, 300);
  
}
