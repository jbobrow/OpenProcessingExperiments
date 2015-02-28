
float x;
float y;
int xi;
int yi;

float speed = 0;
float gravity =0.1;

int count = 0;

void setup() {
 size(500,500); 
 background (0);
 smooth();
fill(26,167,17);
rect(0,480,500,500);
frameRate(25);






   

   

 
}

void draw() {

if (mousePressed == true) 
  {
  background(0);
  mouseReleased(); 
  

   
  }
 
 
 else if (mousePressed == false) {
   background(0);
   fill(255);
   ellipse(x,y,xi,yi);
   y = y + speed;
   speed = speed + gravity;
 

   if (y>height){
    
   gravity = - 0.6;
  
   }
   

   
   
 
 
 
 
 }


fill(26,167,17);
   rect(0,480,500,500);
}

 

 

// fine main 

void mousePressed()
 {
   x = mouseX;
   y = mouseY;
 }
  
  
 void mouseReleased()
 {
   xi = mouseX;
   yi = mouseY;
   drawCircle();
   
 }
  
void drawCircle() {
  
 stroke(0);
 fill(255);
 ellipseMode(CENTER);
 ellipse(x,y,xi,yi);
}




