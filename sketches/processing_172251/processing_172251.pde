
float xpos = random(0, width);
float ypos = random(0, height);
Block1[][] fullboard = new Block1[100][100];
float y, x;
void setup() {
 size(800, 500);
  background(0);
  buildings = new ArrayList();
  colorMode(HSB, 360, 100, 100, 255);
  for (int i = 0; i < height/100; i++) {
    for (int j = 0; j <  width/100; j++) {
      fullboard[i][j] = new Block1(false);
    }
  }
  
}
 
void draw() {
  
    fill(frameCount*.03%360, 100, 70, random(0, 210));
  if (height-yposBuilding < 0) {
   translate(0, 0);
   for (int i = 0; i < buildings.size(); i++) {
      Block b = (Block) buildings.get(0);
      b.update();
      b.build(height - yposBuilding);
      yposBuilding -= random(1, 10);  
      buildings.remove(i);
   }
  } else {
  buildings.add(new Block());
   translate(0, 0);
   for (int i = 0; i < buildings.size(); i++) {
      Block b = (Block) buildings.get(i);
      b.build(height - yposBuilding);
   }
   yposBuilding += random(1, 10);
  }
    y = 0;
  for (int i = 0; i < height/100; i++) {
    x = 0;
    for (int j = 0; j <  width/100; j++) {
      pushMatrix();
        translate(x, y);
        fullboard[i][j].update();
        fullboard[i][j].build();
      popMatrix();
      x += 100;    
    }
    y+=100;
  }
  
}

class Block1 {
  float widthB;
  float heightB;
  boolean colorWhite = true;
  float scaleVal = .9;
  float rotateAngle = 180;
  float angle = random(0, 360);
  float opacity = random(55, 120);
  
  Block1(boolean colorWhite) {
    this.widthB = random(100, 150);
    this.colorWhite = colorWhite;
  }
  
  void update() {
    int[] op = {255, 0};
    scaleVal = scaleVal - random(-.10, .10);
    
    if (random(0, 10010)%130 == 0) {
        scaleVal = random(.6, 1.3);
    }

    opacity =op[int(random(op.length))];    

    angle = angle + random(.09);
  }
  
  void build() {
    pushMatrix();
    fill(0, opacity);
    translate(x, y);
    rotate(radians(angle));
    scale(scaleVal);
    rect(0, 0, this.widthB, this.widthB);
    popMatrix();
  }
}


ArrayList buildings;

float yposBuilding = 10;

class Block {
  float bWidth;
  float bHeight;
  float xpos = random(1, width-1);
  float spacing = random(1, 20);
  float opacity = 125;
  public Block() {
    this.bWidth = random(1, 20);
    this.bHeight = random(1, 100);
  }
  
  void update() {
    stroke(0);
    strokeWeight(random(1, 10));
  }
  
  void build(float ypos) {
    pushMatrix();
    translate(0, ypos);
    rect(xpos, 0, this.bWidth, this.bHeight);
    popMatrix();
  }
  
  void fall() {
  
  }
}
