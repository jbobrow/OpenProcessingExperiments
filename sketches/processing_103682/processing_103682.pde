
/**
<p>Don't move too fast &mdash; you might scare it. Click to forgive and forget.</p>
*/
 
int n = 20000; // número de linhas
float bd = 20; //comprimento das linhas
float sp = 0.002; // velocidade de rotação
float sl = .95; // desaceleramento
 
Cell[] all = new Cell[n];
 
class Cell{
  int x, y;
  float s = 0; // velocidade do giro
  float c = 0; // ângulo
  Cell(int x, int y) {
    this.x=x;
    this.y=y;
  }
  void sense() {
    if(pmouseX != 0 || pmouseY != 0)
    stroke(x,y,mouseX);
    
      s += sp * det(x, y, pmouseX, pmouseY, mouseX, mouseY) / (dist(x, y, mouseX, mouseY) + 1);
    s *= sl;
    c += s;
    float d = bd * s + .001;
    line(x, y, x + d * cos(c), y + d * sin(c));
  }
}
 
void setup(){
  size(400, 400, P2D);
  stroke(0, 0, 0, 20);
 
    for(int i = 0; i < n; i++){ 
 float a = i + random(mouseY, PI / 9);
    float r = ((i / (float) n) * (width / 1) * (((n-i) / (float) n) * 4.5)) + random(-3,3) + 3;
    all[i] = new Cell(int(r*sin(a)) + (width/4), int(r*cos(a)) + (height/2));
  
}
}
 
void draw() {
  background(0);
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
