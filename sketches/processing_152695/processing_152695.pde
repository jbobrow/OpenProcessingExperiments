
float rads=0; // ROTATIONAL VARIABLE
float d=15; // DIAMETER CIRCLES OR SPIRAL SIZE
void setup(){
  size(400,400);
}
void draw(){
  background(0);
  fill(255);
  smooth();
  ellipse(width/2,height/2,400,400);
  translate(width/2,height/2);
  rotate(rads);
  rads-=0.5; // ROTATIONAL SPEED AND DIRECTION
  for(float a=0;a<30*PI;a+=0.05){
    float R; // VARIABLE AMPLITUDE
    R=5*a; // EQUATION SPIRAL OF ARQUIMEDES
    fill(0);
    ellipse(cos(a)*R,sin(a)*R,d,d);
  }
}

