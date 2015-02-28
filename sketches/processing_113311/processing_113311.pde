
float x;
float y;

int r;
int g;
int b;

boolean colorchange; 

void setup(){
  size (450,450);
  background (255);
  r = 201;
  g = 33;
  b = 59;
  colorchange = false; 
}

void draw() {
  noStroke ();
  fill (0);
    x=mouseX;
  y=mouseY;
  fill (r,g,b);
  
if(mousePressed){
   quad(190, 155, 430, 100, 345, 315, 150, 380);
   r = r -3;
   g = g -2;
   b--;
   quad (x,y,x/2,y/2,x/4,y/4,x/8,y/8);
   quad (x,y,x/3,y/3,x/6,y/6,x/9,y/9);
   rect (x,y,x/4,y/4);
   quad(38, 31, 86, 20, 69, 63, 30, 76);
   quad(16, 15.5, 43, 10, 34.5, 31.5, 15, 38);
   triangle (210,40,270,40,240,100);
   triangle (60,150,116,40,172,150);
   
 
 }
   if (b<=0){
      r = 201;
      g = 33;
      b = 59;
   }
}





   
 


