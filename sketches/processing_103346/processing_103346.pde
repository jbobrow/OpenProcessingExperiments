
void setup() { //the setup for the entire program
   size(600, 500); //screen size
   background(0); //background color
   frameRate(60); //the rate at which the frame updates
 }
 int dx = 2; //x changes by two
 int dy = 3; //y changes by 3
 
 int x = 50; //x starts at 50
 int y = 50; //y starts at 50
 
 
    void draw(){ //command to draw below
   fill(255); //color for the ellipse
    ellipse(x, y, 25, 25); //dimensions and coordinates for ellipse
    
  

   x= x + dx; //coordinates for x
   y = y + dy; //coordinates for y
   
   if (x<0 || x>475){ //if x is less than 0 or greater than 475 it is plugged into the equation below
     dx = -1 * dx;
   }
   if (y<0 || y>475){ //if y is less than 0 or greater than 475 it is plugged into the equation below
     dy = -1 * dy; // then dy equals -1 times dy
   }
   if(mousePressed == true) {
   x= mouseX;
   y= mouseY;
   background((0), (0), (0));
   }
  }
