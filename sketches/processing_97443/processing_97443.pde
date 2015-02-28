
RectGravity myRectGravity;

void setup(){
size (200,200);
smooth ();
myRectGravity = new RectGravity(); 
}

void draw(){
    myRectGravity.display();

}

class RectGravity{
                     //Data
         float x;
        float y ;
    float speed ;
  float gravity ;
                     //Constructor
   RectGravity(){ 
         x = 100;
           y = 0;
       speed = 0;
   gravity = 0.1; 
  }
                     // Function

void display(){
fill (0);
noStroke ();
rectMode (CENTER);
rect (x,y,10,10);

y = y + speed ;
speed = speed + gravity;

if ( y < height){
speed = speed * -0.95;}
}
  
}
