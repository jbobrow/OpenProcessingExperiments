
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/173298*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
int num = 500, frames = 500, edge = 50;
Orb[] orbs = new Orb[num];
float theta;

void setup() {
  size(800, 800);  
  for (int i=0; i<num; i++) {
    float d = 150;
    float x = random(width);
    float y = edge+(height-2*edge)/float(num)*i;
    orbs[i] = new Orb(x,y, random(5, 10));
    frameRate(60);
  }
}


void draw() {
  int mouse = int(mouseY/2); 
  fill(0,mouse);
  rect(0,0,int(width),int(height));
  //background(0);
  for (int i=0; i<orbs.length; i++) {
    orbs[i].run();
  }
  theta += TWO_PI/frames;
  
  //if (frameCount<=frames && frameCount%2==0) saveFrame("image-###.gif");
  
}
class Orb {

  float x, y, sz;
  float px, py, offSet, radius;
  int dir, currentOrb;
  color col;

  Orb(float _x, float _y, float _sz) {
    x = _x;
    y = _y;
    sz = _sz;
    offSet = random(TWO_PI);
    radius = random(5,10); //5 10
    dir=random(1)>.5?1:-1; //.5,-1
  }

  void run() {
    update();
    showLines();
  }

  void update() {
    float vari = map(sin(theta+offSet),-1,1,-2,-2);
    px = map(sin(theta+offSet),-1,1,edge,width-edge);
    py = y + sin(theta*dir)*radius*vari;

  }

  void showLines() {
    for (int i=0; i<orbs.length; i++) { 
      currentOrb = i;
      float distance = dist(px, py, orbs[i].px, orbs[i].py);
      if (distance>0 && distance<40) {
        stroke(255,100);
        line(px, py, orbs[i].px, orbs[i].py);
        fill(255,100);
       // ellipse(px, py, 10 , 10);
      }
    }
  }

}
