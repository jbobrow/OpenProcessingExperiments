
 int x = 20;
 int y = 20;
 int xVel = 0;
 int yVel = 0;
 int len = 0;
 int maxLen = 0;
 PImage img;
 
 void setup() {
      size(600,600);
      fill(0);
      frameRate(5);
       img = loadImage("smile.jpg");
 }
 
 void draw() {
   if (len == 0)
        background(255,255,255);
      if (len < maxLen)
        len += 1;
      else
        len = 0;
   counter();
   markers();
 }
 
 void counter() {
 fill(204, 102, 0);
 rect(x, y, 20, 20);
 x += xVel;
 y += yVel;
 
 if(x<0) {
 x=600;
 }
 
  if(x>600) {
 x=0;
 }
 
  if(y<0) {
 y=600;
 }
 
  if(y>600) {
 y=0;
 }
 
   if(x==100 && (y==200)) {
     image(img, mouseX - 100, mouseY - 80);
String s = "To do this you have to load an image to the sketch, then have the image appear when the orange square lands on a specific x and y coordinate. By making the x coordinate of the image 'mouseX' and the y 'mouseY' the image follows the mouse around the screen";
fill(50);
text(s, 10, 100, 600, 600);
 }
 
    if(x==200 && (y==400)) {      
scale(1.35);
String s = "When you land on this square the size of the sketch changes and the black squares appear larger. This is done by using the 'scale' function";
fill(50);
text(s, 10, 10, 400, 400);
 }
 
     if(x==400 && (y==300)) {      
 if (mousePressed == true) {
    fill(0);
  } else {
    fill(204, 102, 0);
  }
  rect(250, 250, 100, 100);
String s = "A giant square appears on the screen which changes colour when you click and hold the mouse. This is done by using the mousePressed function";
fill(50);
text(s, 100, 100, 400, 400);
 }
 }
  
 void markers() {
    fill(0);
 rect(100, 200, 20, 20);
 
     fill(0);
 rect(200, 400, 20, 20);
 
     fill(0);
 rect(400, 300, 20, 20);
 
 }
 
 void keyPressed() {
   if (key == CODED) {
   if(keyCode == UP) {
     xVel = 0;
     yVel =  yVel-20;
      
       } else if (keyCode == DOWN) {
         xVel = 0;
         yVel =  yVel+20;
        
          
       }
       if(keyCode == LEFT) {
         yVel = 0;
         xVel = xVel-20;
       } else if (keyCode == RIGHT) {
         yVel = 0;
         xVel = xVel+20;
          
       }
   }
 }


