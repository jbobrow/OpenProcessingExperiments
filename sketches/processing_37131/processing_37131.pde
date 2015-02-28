

boolean mouseIsDown = false;
int myDiameter = 10;
float posX =10;
float posY =500;

 
void setup() {
  size(700, 700);
  background(0,0, 0);
  //noStroke();
  frameRate(40);
}
 
void draw() {
 

  
float strokeW = abs(mouseX - pmouseX);
strokeWeight(strokeW);


   
 
  //draw line only if mouse is down
  if (mouseIsDown == true) //same as if(mouseIsDown)
  {
    
   stroke(random (243, 256), random(256), random(256),63); 
    line(mouseX, mouseY, pmouseX, pmouseY);
 
   noStroke();
      fill(random(255), random (255), random(243,255)); 
  triangle (mouseX, mouseY, pmouseX, pmouseY, posX, posY);
 ellipse(mouseX, mouseY, myDiameter, myDiameter); 
 
  } 
  
  
   
   float dx = mouseX - posX;
  float dy = mouseY - posY;
  
  posX +=dx/3;
    posY +=dy/3;  
    
     
     if (posX > 700)
     {
       strokeWeight (0);
       stroke (2);
       rect (0,0, width, height);
       fill(0,0,0);
     }
     
  if (posX <50)
  {
    PFont font;

font = loadFont("TimesNewRomanPS-BoldMT-120.vlw"); 
textFont(font, 80); 
text("LET'S PLAY!", 90, 350);
fill(random (256), random (200, 256), random (256));
  }
 
}
 
 
//this function is called every time you press a mouse button
void mousePressed() {
  mouseIsDown = true;
}
 
//this function is called every time you release a mouse button
void mouseReleased() {
  mouseIsDown = false;
}
