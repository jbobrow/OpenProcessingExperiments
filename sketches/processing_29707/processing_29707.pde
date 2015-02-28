
float theta = 0.05;

void setup() {
    size(400,400,P3D);
 }

void draw() {
  background(55);
  translate(100,20,0);
  rotateY(theta);
  drawCircle(width/2,height/2,100);
  theta += 0.01;
}

void drawCircle(float x, float y, float radius) {
  fill ( random(0,256),random(0,256),random(0,256));
  ellipse(x,y, radius, radius);
  if(radius > 10) {
    drawCircle(x + mouseX/2, y, radius/2);
    drawCircle(x - mouseY/2, y, radius/2);
    drawCircle( y+ radius/2, x, radius/2);
    drawCircle( y- radius/2, x, radius/2);
     }
}
                
