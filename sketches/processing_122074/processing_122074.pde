
float x,y;
float x_velocity, y_velocity;
float gravity;
float radius;
PShape s;

void setup(){
  size(400,300);
  x = width/2;
  y = 50;
  x_velocity = 2;
  y_velocity = 6 ;
  gravity = .2;
  radius = 10;
  s = loadShape("man.svg");
}


void draw(){
 background(171,234,252);
 y_velocity += gravity;
 x += x_velocity;
 y += y_velocity; 
 
 if ( y>(height-radius) ) 
 {
   y = height - radius;
   y_velocity *= -1.0;
 }
 if (x < radius)
 {
   x = radius;
   x_velocity *= -0.5;
 }
 if ( x>(width-radius) )
   {
     x = width-radius;
     x_velocity *= -0.5;
   } 
 //Calculate (x,y) position of ball
 ball(x,y);

}

void ball(float x, float y){
 pushMatrix();
 translate(x,y);
 // draw ball here
// ellipseMode(RADIUS);
// fill(240,247,35);
 //stroke(255);
 shapeMode(CENTER);
 shape(s,0,0,50,100);
 popMatrix();
}


