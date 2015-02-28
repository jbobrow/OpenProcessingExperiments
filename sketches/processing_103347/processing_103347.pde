
void setup(){ //setup for the enitire program 
   size(600, 500); //screen size
   background(0); //background color
   frameRate(60); //the rate at which the frame updates
 }
 
 int dx = 2; //x changes by 2
 int dy = 3; //y changes by 3
 
 int x = 50; //x starts at 50
 int y = 50; //y starts at 50
 
 void draw() { //gives the command to show the following
   fill(255); //fill color of the ellipse
   ellipse(x, y, 25, 25); //shape and location of the circle
   
   x = x + dx; //coordinates for the location of x
   y = y + dy; //coordinates for the location of y
   
   if(x<0 || x>475) { //if x is less than 0 or greater than 475
     dx=-1 * dx; //
   }
   
   if(y<0 || y>475){ //if y is less than 0 or greater than 475
     dy=-1 * dy; //
   }
 if(mousePressed==true) {
     x=mouseX;
     y=mouseY;
     }
 }
