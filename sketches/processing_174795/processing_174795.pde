
float circleX=100;
float circleY=100;
float speed = 3.2;

void setup() {
  size (200, 200);
}
void draw(){
  background (255);
  stroke(0);
  fill(175);
  ellipse(circleX,circleY,40,40);

circleX= circleX + speed;
if(circleX > width || circleX < 0)

  speed=speed*-1;
 }
