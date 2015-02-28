

void setup() {
  background(255);
  size(300,500);
  smooth();
  stroke(0);
}

float x=150, y=250;
float speed=0, gravity=0.8;
float bs=50;
float life =200;

 // balls = new ArryaList();
 void draw() {
   background(255);
   //fill(255);
       
   if(mousePressed) {
     x = mouseX;
     y = mouseY;
     // fill(255);
   }
  
   speed = speed +gravity;
   ellipse(x, y-bs/2, bs, bs);
   fill(0,life);
    y= y+speed;
    
   if (y>height) {
     speed = speed *-gravity;
     y=height;
   }
  
//speed = speed * 0.8;
 }
  
  

