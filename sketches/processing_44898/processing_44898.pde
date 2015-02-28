
float r=random(255);
float Vel;

void setup () {
  background (0);
   noCursor();
  size (600, 600);
  fill(r, 200, 255, 1);
  strokeWeight(0.005);
  smooth();
  frameRate(20);
  stroke (255);
}


void draw() {
  Vel=abs(pmouseX-pmouseY*TWO_PI);
  color elcolores = color(random (0,25), random(0,200), random(0,255), 10);
  fill(elcolores);
  quad(
  height/2, //x1 el punto de inicio en el centro
  width/2,//y1
  mouseX+mouseX*(sin(r)),//x2
  mouseY+random(0,600),//y2
  mouseX,//x3
  mouseY,//y3
  mouseX+(mouseX*r),//x4
  mouseY+random(mouseY*Vel));//y4
 }              
