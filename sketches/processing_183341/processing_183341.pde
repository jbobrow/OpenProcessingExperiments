
float x;
float y;
float angle;
float deltaAngle;
color c;
 
void setup() {
  size (600,400);
y = random(height);
x = -width*.25;
  angle=0;
  deltaAngle=0.05;
  c=color(0,  228,  228,15);
  rectMode(CENTER);
  background(#68838B);
  smooth();
}
 
void draw() {
  c = color(y,200,150);
  fill(c);
    if (x<width) {
      x++;
      angle+=deltaAngle;
    }
    else {
      y = random(height);
      x = -width*.25;
      deltaAngle=random(-0.1,0.1);
      c=color(random(150,255),0,0);
    }
  pushMatrix(); 
  translate(x,y);
  rotate(angle);
  float size = map(0,0,width/2,0.5,1);
  rect(0,0,width*0.4*size,height*0.25*size);
  popMatrix();
   
}

