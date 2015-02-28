
// Konkuk University
 // Department of Dynamic Media
 // SOS iDesign
// Name: 201420102 LEE Hea Rin
 // ID: LEE Hea Rin



int x = 0;
int y = 0;
int xSpeed = 8;
int ySpeed = 3;
float mPos = 0;

void setup() {
  size (600, 600);
  smooth();
}

void draw() {
  background(113, 219, 175);
  x = x + xSpeed;
  y = y + ySpeed;
  

if ((x > width) || (x < 5)) { 


    xSpeed = xSpeed * -1; 


  } 


  if ((y > height) || (y < 0)) {  


    ySpeed = ySpeed * -1; 


  } 
  
fill(x, y, 80, 30);
quad(width-x,150,0,height,40,y,width-x,height-y);
fill(x, 0, y, 80);
rect(y,x,100,80);
fill(y,x,40,20);
quad(height-x,40,0,width,120,x,width-x,height-y);
fill(176, 124, 245);
rect(x,y,160,80);
fill(y,x,130,150);
quad(width+x, y, width+y, width+x, width-y,0,0,0);
fill(x,y,50,30);
quad(width-y,x,height-x,width-x,30,width,200,width); 
fill(y,x,110,20);
rect(width-x,width-x,0,120);
fill(136,162,240);
quad(height,y,80,width-x,70,180,20,width-x);

}    
