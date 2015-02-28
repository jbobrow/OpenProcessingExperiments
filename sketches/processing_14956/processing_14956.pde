
//by Hanna Oh
//based on code by Kyle McDonald. Thank you!
int n = 3000; // number of cells
float bd = 50; // base line length
float sp = 0.04; // rotation speed step
float sl = .17; // slow down rate
 
Cell[] all = new Cell[n];
 
class Cell{
  int x, y;
  float s = 0; // spin velocity
  float c = 0; // current angle
  Cell(int x, int y) {
    this.x=x;
    this.y=y;
  }
  void sense() {
    if(pmouseX != 0 || pmouseY != 0)
      s += sp * det(x, y, pmouseX, pmouseY, mouseX, mouseY) / (dist(x, y, mouseX, mouseY) + 1);
    s *= sl;
    c += s;
    float d = bd * s + .001;
    line(x, y, x + d * cos(c), y + d * sin(c));
  }
}
 
void setup(){
  size(500, 500, P2D);
  rect(1, 1, 1, 150);
  stroke(random(45),random(85),random(180));
  for(int i = 0; i < n; i++){
    float a = i + random(0, PI / 3);
    float r = ((i / (float) n) * (width / 1) * (((n-i) / (float) n) * 2.3)) + random(-3,3) + 3;
    all[i] = new Cell(int(r*cos(a)) + (width/1), int(r*sin(a)) + (height/2));
  }
}
 
void draw() {
  background(50,45,50);
  for(int i = 0; i < n; i++)
    all[i].sense();
}
 
void mousePressed() {
  for(int i=0;i<n;i++)
    all[i].c = 0;
}
 
float det(int x1, int y1, int x2, int y2, int x3, int y3) {
  return (float) ((x2-x1)*(y3-y1) - (x3-x1)*(y2-y1));
}

                
                
