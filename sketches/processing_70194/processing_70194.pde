
int rad = 70;
int x = 10;
float angle = 0;
float speedX = 7;


void setup(){
 size(600, 600);
}


void draw(){
  background(255);
  
  x += speedX;
  
  if(x >  590 || x < 10) {
    speedX*=-1;
  }
  
   angle += radians(7);
   float y = height/2 + cos(angle) * rad;
   ellipse(x,y,20,20);
   fill(220,100,220);
   
     
  }
