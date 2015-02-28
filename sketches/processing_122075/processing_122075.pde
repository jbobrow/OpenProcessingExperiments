
void setup () {
  size(500,500);
background(#050101);   
  

}
float  lineLength = 20;
float  angleRate = random(-9999);
float boundary = 550;
void draw() {
  float r = random(5);
 int center = (500/2);
 int vertical = (500/2);
 float angle = radians(frameCount*angleRate);
 lineLength++;
 float lx = lineLength*cos(angle);
 float ly = lineLength*sin(angle);
 float lr = (ly + r);
 stroke(color(random(0,255),random(0,255),random(0,255)));
line(center+lx, vertical+ly, center , vertical);
ellipse (center, vertical, 50, 50);
}

if (ly,lx > boundary) {
noLoop();




}
