
float y = 559.0;
float radius = 15.0;
 float velocity = 4.3;
float gravity = -0.99;
float acceleration=.98;
void setup() {
  size(600, 600);
  smooth();
  noStroke();
  ellipseMode(RADIUS);
}

void draw() {
  fill(0, random(25,50));
  rect(0, 0, width, height);

  for(int i=0; i<600; i+=40){
    fill((i),random(250),random(250));
  ellipse((20 +i),y,(radius),radius+velocity/10);}
  velocity += acceleration+ gravity;
  y -= velocity;
  radius += gravity+ acceleration;
  if (y < 0) {
    y = 559;}
  

 if(y>600){
  velocity=9;
  radius=15;
   
 }
}




