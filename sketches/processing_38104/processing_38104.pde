
int SZ = 50;
PImage spriteSheet;
PImage sprite[];
boolean bShowSheet;
guy g[];

//===============================================================================

void setup() {
  size(800,600);
  smooth();
  imageMode(CENTER);
  fill(255,180);
  
  //load sheet
  spriteSheet = loadImage("spriteSheetTest.png");
  
  //divy up sheet into sprite frames
  sprite = new PImage[30];
  int cnt = 0;
  for (int y = 0; y < 5; y++)
    for (int x = 0; x < 6; x++)
      sprite[cnt++] = spriteSheet.get(x*SZ, y*SZ, SZ, SZ);
      
  //setup guy objects
  g = new guy[10];
  for(int i = 0; i < 10; i++)
    g[i] = new guy();
  
  //start off not showing sheet
  bShowSheet = false;
}

//===============================================================================

void draw() {
  background(64);
  
  for(int i = 0; i < 10; i++)
    g[i].check();
    
  if (bShowSheet) {
    rect(width/2 - spriteSheet.width/2, height/2 - spriteSheet.height/2, spriteSheet.width, spriteSheet.height);
    image(spriteSheet, width/2, height/2);
  }
}

//===============================================================================

void mouseReleased() {
  bShowSheet = !bShowSheet;
}

//===============================================================================

class guy {
  PVector pos, dir;
  int heartbeat;
  float spd;
  //---------------------
  guy() {
    pos = new PVector(int(random(width)), int(random(height)));
    dir = new PVector(random(2), random(2));
    heartbeat = int(random(30));
    spd = random(2) + 1.0;
  }
  //---------------------
  void check() {
    //check other guys
    for (int i=0; i<10; i++)
      if (g[i] != this)
        if (pos.dist(g[i].pos) < 100) {
          PVector dir2 = PVector.sub(pos, g[i].pos);
          dir2.normalize();
          dir2.mult(spd);
          dir2.div(8);
          dir.add(dir2);
        }
    //check mouse
    PVector m = new PVector(mouseX, mouseY);
    if (pos.dist(m) > 20) {
      PVector dir2 = PVector.sub(m, pos);
      dir2.normalize();
      dir2.mult(spd);
      dir2.div(20);
      dir.add(dir2);
    }
    //draw guy
    dir.normalize();
    dir.mult(spd);
    pos.add(dir);
    pushMatrix();
      translate(pos.x, pos.y);
      rotate(atan2(dir.y, dir.x) - HALF_PI);
      image(sprite[heartbeat++], 0, 0);
    popMatrix();
    if (heartbeat >= 30) heartbeat = 0;
  }
}

