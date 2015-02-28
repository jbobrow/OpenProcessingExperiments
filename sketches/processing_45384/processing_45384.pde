
//float t=random(frameCount); 
float r=random(0,255);
int L=600,l=L/600,x,y,D ;
int val = 0;
//PVector v1 = new PVector(50, 80, 100);
//PVector v2 = new PVector(40, 50, 300);
//float d= v1.dist(v2);

void setup () {
  background (0);
  noCursor();
  size (600, 600);
  // fill(r, r, r, 2);
  strokeWeight(0.01);
  smooth();
  frameRate(10);
  stroke (255);
}

float Vel;
float Vel2;

void draw() {
  //float elcolores=Vel;
  Vel=abs(mouseX-pmouseX);
  Vel2=abs(mouseY-pmouseY);

  color elcolores = color(random (0,10), random(0,200), random(0,255),2);
  // color elcolores = color(random(0,255), random(0,255), random(0,255), 60);
  fill(elcolores);
  strokeWeight(0.1+Vel/1000);
 quad(600, 0, Vel, Vel2, 600, 600, mouseX, mouseY);
  quad(width/2, height/2, Vel, Vel2, mouseX, mouseY, width/2,height/2);
  quad(
  width/2,//x1 el punto de inicio en el centro
  height/2,//y1
  mouseX*Vel,//x2
  mouseY*Vel2,//y2
  mouseX+600,//x3
  mouseY+600,//y3
  width/2,//x4
  height/2);//y4
  //  delay (50);
  //  quad(200+mouseX*t, 200+mouseY, mouseX, 20+mouseY, 69+mouseX, 63+mouseY, 30+mouseX, 76+mouseY);
  //line(mouseX, mouseY, r, r*4);
 quad(0, 600, Vel, Vel2, 600, 600, mouseX, mouseY);
  if (mousePressed) {
    if (mouseButton == LEFT) {
      background(255);
      stroke(0);
      line(width/2, height/2, mouseX, mouseY);
    } 
    else {
      stroke(255);
      background(0);
    }
    line(Vel*mouseX, Vel2*mouseY, width, height);
    quad(mouseX*Vel, mouseY*Vel2, width/2, height/2, 600, 600, width/PI ,height/PI);
}}



