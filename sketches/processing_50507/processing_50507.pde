
ArrayList allDrops;

Cloud cloudA = new Cloud(300, 50, 50, -1);
Cloud cloudB = new Cloud(200,60,70, 1);

void setup() {
  size(500, 450);
  smooth();
  frameRate(40);
  allDrops = new ArrayList();
}

void draw() {
  background(250);

  addDrop();

  // render all the raindrops
  for (int j=0; j<allDrops.size();j++) {
    Raindrop drop = (Raindrop) allDrops.get(j);
    drop.update();
  }
  
    cloudA.update();
    cloudB.update();
}



void addDrop() {

  int dropX=int(random(0, 500));
  int dropY=int(random(-100, 100));
  int dropSpeed=int(random(1, 2));
  Raindrop drop = new Raindrop(dropX, dropY, 10);
  allDrops.add(drop);
}


class Cloud {
  int x, y, r;
  float xSpeed;

  Cloud(int x_, int y_, int r_, float xSpeed_) {
    x=x_;
    y=y_;
    r=r_;
    xSpeed= xSpeed_;
  }
  
  void update(){
   display();
  drift(); 
  }

  void display() {
    noStroke();
    fill(200,200,200,240);
    ellipse(x, y, r, r);  
    ellipse(x-(r/2), y, r*.8, r*.8);
  }
  
  void drift(){
   x+=xSpeed; 
   if (x>width || x < 0) xSpeed=xSpeed*-1;
  }
  
}
class Raindrop {
  int x, y, len;
float ySpeed = 4.5;

  Raindrop(int x_, int y_, int len_) {
    x=x_;
    y=y_;
    len = len_;
  }

void update(){
 display();
fall(); 
  
}

  void display() {
    stroke(0);
    line(x, y, x, y+len);
  }
  
  void fall(){
   y+=ySpeed; 
  }
  
}

                
