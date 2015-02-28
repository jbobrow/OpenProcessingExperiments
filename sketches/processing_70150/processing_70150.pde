
int rad = 50;
int x = 0;
   float angle = 0;


void setup(){
 size(800, 200);
}


void draw(){
  background(255);


  
   x+=6;
   angle += radians(10);
   float y = height/2 + cos(angle) * rad;
   ellipse(x,y,10,10);
   
    
  }


