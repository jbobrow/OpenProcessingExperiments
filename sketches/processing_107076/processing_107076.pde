
class Ant {
  float x;
  float y;
  float angle;
  int index;
  boolean off;
  color myCol;
  int count;
  public Ant(float x, float y, float angle, int index, color myCol, int count) {
    this.x = x;
    this.y = y;
    this.angle = angle;
    this.index = index;
    this.myCol = myCol;
    this.count = count;
  }
  public void update() {
    count++;
    if(red(get((int)x, (int)y)) != 255)
      off = true;
    if(!off) {
      stroke(myCol);
      point(x, y);
      x += cos(angle);
      y += sin(angle);
      if(random(100)>97) {
        color newCol = myCol;
        float newAngle = PI/2 + angle;
        if(random(100)>50) {
          newAngle = -PI/2 + angle;
        }
        Ants.add(new Ant(x+cos(newAngle), y+sin(newAngle), newAngle, Ants.size(), newCol, count));
      }
    }
  }
}
ArrayList<Ant> Ants = new ArrayList<Ant>();
void setup() {
  size(768, 512, P2D);
  background(255);
  smooth();
  stroke(0);
}
void draw() {
  for(int i = 0; i < Ants.size(); i++) {
    Ants.get(i).update();
  }
}
void mousePressed() {
  Ants.add(new Ant(mouseX, mouseY, -PI/2, Ants.size(), color(0, 0, 0), 0));
}
void keyPressed() {
  background(255);
  Ants.clear();
}
int r(color c){return (c>>16)&255;}
int g(color c){return (c>>8)&255;}
int b(color c){return c&255;}

