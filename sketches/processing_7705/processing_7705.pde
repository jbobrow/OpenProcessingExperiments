
float c = 0;

void setup() {
  size(400,400);
}

void draw() {
  background(200);
  c += 0.025;
  float m = map(mouseX,0,width,0,.01);
  for (float i=0;i<360;i=i+0.25) {
      float r = mouseY * noise((i*m)+c);
      line(width,height/2,width+r*cos(map(i,0,360,0,TWO_PI)),(height/2)+r*sin(map(i,0,360,0,TWO_PI)));
   } 
}

