
Block[][] blocks = new Block[20][20];

void setup() {
  size(800, 800);
  colorMode(HSB);
  rectMode(CENTER);
  for (int i = 0; i < 20; i++)
  for (int j = 0; j < 20; j++)
    blocks[i][j] = new Block((i*40)+20,(j*40)+20,140, 50, 20, 3);
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
    Bcolor.x ++;
    Bcolor.y += random(3);
    Bcolor.z += random(3);
    position.y+= random(-.2,.2);
    if (Bcolor.y > 255 || Bcolor.y <0) {
      Bcolor.y = 10;
      attract=attract*1.5;
    }
    if (Bcolor.x > 255) {
      Bcolor.x = 1;
      position.x = position.x + random(-2,2);
    }
    if (size>80) {
      size=1;
    }
    if (attract>60) {
      attract=1;
    }
  }
  
  void display() {
    noStroke();
    fill (Bcolor.x, Bcolor.y, Bcolor.z, 150);
    rect (position.x, position.y, attract, attract);
        if (random(100)>99.9) {
      stroke(1);
      text(round(Bcolor.x),position.x,position.y);
    }
  }
}
