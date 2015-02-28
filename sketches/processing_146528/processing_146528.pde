
Block[][] blocks = new Block[20][20];

void setup() {
  size(800, 800);
  frameRate(10000000);
  colorMode(HSB);
  rectMode(CENTER);
  for (int i = 0; i < 20; i++)
  for (int j = 0; j < 20; j++)
    blocks[i][j] = new Block((i*40)-20,(j*40)-20,random(255), random(255), random(100)+155, 10);
}

void draw(){
  fill(100,100,100,10);
  rect(0,0,width*2,height*2);
  for (int i = 0; i < 20; i++)
  for (int j = 0; j < 20; j++)
  {
    blocks[i][j].update();
    blocks[i][j].display();
  }
}

class Block {
  PVector position;
  PVector velocity;
  PVector Bcolor;
  float size;
  float attract;
  
  Block(float x, float y, float r, float g, float b, float q) {
    position = new PVector(x, y);
    Bcolor = new PVector(r,g,b);
    attract = q;
  }
  
  void update() {
    Bcolor.x += random(-3,3);
    Bcolor.y += random(-3,3);
    position.y+= random(-.5,.5);
    if (Bcolor.y > 255 || Bcolor.y <0) {
      Bcolor.y = 150;
      attract=attract*1.5;
    }
    if (Bcolor.x > 255 || Bcolor.x <0) {
      Bcolor.x = 150;
      position.x-=8;
    }
  }
  
  void display() {
    noStroke();
    fill (Bcolor.x, Bcolor.y, Bcolor.z, 150);
    rect (position.x, position.y, attract, attract);
        if (random(100)>99.9) {
      stroke(1);
      text(Bcolor.x,position.x,position.y);
    }
  }
}
