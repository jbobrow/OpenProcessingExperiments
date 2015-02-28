
PFont words = createFont("LetterGothicStd-Slanted", 12);
int page = 1;
float x = 300, y = 400, vx = 10;
double vy = 0;
int jumpLim = 8;
boolean jump = false;
final double g = .7;
boolean goLeft, goRight;
ArrayList p;
int create = 0;
int platLim = 5;
int doorX = 300, doorY = 30;
int enemeyNum = 5;
Enemies [] e = new Enemies[enemeyNum];

void setup() {
  size(800, 500);
  p = new ArrayList();
  frameRate(40);
  smooth();
  for (int i = 0;i<enemeyNum;i++) {
    e[i] = new Enemies(10+(int)(random(width-20)), 10+(int)(random(height-20)), 0, 0, 1);
  }
}

void draw() {
  background(#A7A9AA);
  varSetting();
  door();
  platcreateStuff();
  characterStuff();
  environment();
  display();
  for (int i = 0;i<enemeyNum;i++) {
    e[i].drawEnemies();
  }
}

void environment() {
  stroke(0);
  fill(#5F3205);
  rect(-5, 490, width+10, 20);
}

void varSetting() {
  if (page == 1) {
    doorX = 765;
    doorY = 30;
  }
}

void display() {
   fill(#107101);
  textFont(words, 10);
  text("FPS: " + (int)(frameRate), 700, 10);
  fill(0);
  textFont(words, 15);
  textLeading(20);
  textAlign(LEFT);
  text("Health: \nPlatforms left: " + (platLim-p.size()), 5, 15);
  fill(#00FF00);
  rect(70,4,13,13);
    rect(90,4,13,13);
  rect(110,4,13,13);
  rect(130,4,13,13);
  rect(150,4,13,13);

}


void door() {
  if (x+25>doorX-20 && x<doorX+20 && y+25>doorY && y<doorY+30) {
  }
  strokeWeight(3);
  stroke(#7E570E);
  fill(0);
  ellipse(doorX, doorY, 40, 40);  
  rect(doorX-20, doorY, 40, 30);
  stroke(0);
  strokeWeight(3);
  line(doorX-17, doorY, doorX+17.5, doorY);
}

void platcreateStuff() {
  if (dragObject != -1) {
    ((Platforms) p.get(dragObject)).x = mouseX;
    ((Platforms) p.get(dragObject)).y = mouseY;
  }
  for (int i = 0;i<p.size();i++) {
    Platforms pl = (Platforms) p.get(i);
    ((Platforms) p.get(i)).drawPlatforms();
    if (x<=pl.x + pl.w && x + 25>= pl.x && y+25/2+25/4<= pl.y+5 &&y + 25>= pl.y && jump == false)
    {
      if (y > 0) {
        vy = 0;
        y = pl.y-25;
      }
    }
  }
  if (create == 1) {
    if (p.size()<platLim) {
      p.add(new Platforms(mouseX, mouseY));
      create = 2;
    }
  }
  if (p.size()>0) {
    int i = p.size();
    Platforms pl = (Platforms) p.get(i-1);
    if (create == 2) {
      pl.x = mouseX;
      pl.y = mouseY;
    }
  }
}

void characterStuff() {
  if (jump) {
    vy = -jumpLim;
    jump = false;
  }
  y+=vy;
  vy+=g;
  if (vy > jumpLim) { 
    vy = jumpLim;
  }
  if (y >= height-35) {
    y = height-35;
    vy = 0;
  }
  if (goRight)
    x+=vx;
  if (goLeft)
    x-=vx;
  strokeWeight(2);
  stroke(0);
  fill(0, 0, 255);
  rect(x, y, 25, 25);
}

class Enemies {
  float x2, y2, vx2, vy2;
  float gunX, gunY, gunT;
  int type2;
  color c;
  Bullet[] bullets = new Bullet[4];
  int shootVar;

  Enemies(float x2, float y2, float vx2, float vy2, int type2) {
    this.x2 = x2;
    this.y2 = y2;
    this.vx2 = vx2;
    this.vy2 = vy2;
    this.type2 = type2;
    for (int i = 0; i < 4; i++)
      bullets[i] = new Bullet();
  }

  void drawEnemies() {
    gunX = x2 + 20*cos(gunT);
    gunY = y2 + 20*sin(gunT);
    if (dist(x+12.5, y+12.5, x2, y2)<100+12.5) {
          gunT = -atan2(y2- (y+12.5), (x+12.5)-x2);
      c = #FF0000;
      shootVar++;
      if (shootVar == 20) {
        shootVar = (int)random(20);
        shoot();
      }
    }
    else {
      c = #00FF00;
    }
    for (int i = 0; i < 4; i++) {
      if (bullets[i].go == 1) 
        bullets[i].drawAndMoveMe();
    }

    strokeWeight(2);
    stroke(0);
    fill(c);
    ellipse(x2, y2, 20, 20);
    strokeWeight(3);
    stroke(#3E3D3D);
    if (type2 == 1)
      line(x2, y2, gunX, gunY);
  }
  void shoot() {
    gunT +=.1*(random(5) - 2);
    for (int i = 0; i < 4; i++) {
      if (bullets[i].go == 0) {
        bullets[i].setBL(gunX, gunY, gunT, 7);
        bullets[i].go = 1;
        break;
      }
    }
  }
}

class Bullet {
  float x, y, vx, vy;
  int v, go;

  void setBL(float x, float y, float ang, float v) {
    vx = v*cos(ang);
    vy = v*sin(ang);
    this.x = x - vx;
    this.y = y - vy;
    this.vx = vx;
    this.vy = vy;
    go = 1;
  }

  void drawAndMoveMe() {
    x += vx;
    y += vy;

    if (x > width + 10 || x < -10 || y < -10 || y > height + 10)
      go = 0;
    ellipse(x, y, 4, 4);
  }
}

class Platforms {
  float x, y, w;
  color c = color(random(256), random(256), random(256));

  Platforms(float x, float y) {
    w = 40;
    this.x = x;
    this.y = y;
  }

  void drawPlatforms() {
    stroke(0);
    strokeWeight(2);
    fill(c);
    rect(x, y, 50, 5);
  }
}

void window() {
}


int dragObject = -1;
void mousePressed() {
  dragObject = -1;
  for (int i = 0;i<p.size();i++) {
    Platforms pl = (Platforms) p.get(i);
    if (mouseX>=(pl.x-5) && mouseX<=(pl.x+55) && mouseY>=(pl.y-5) && mouseY<=(pl.y+10)) {
      dragObject = i;
      break;
    }
  }
  if (dragObject == -1)
    create = 1;
}

void mouseReleased() {
  create = 0;
  dragObject = -1;
}

void keyPressed() {
  if (keyCode == 32 && jump == false) {
    if (y >= height-35 && jump == false) {
      jump = true;
    }
    for (int c = 0;c<p.size();c++) {
      Platforms pl = (Platforms) p.get(c);
      if (x<= pl.x + pl.w && x + 25>= x && y+25/2+25/4<= pl.y+5 &&y + 25>= y && jump == false) {
        jump = true;
      }
    }
  }
  if (keyCode == 65) {
    goLeft = true;
  }
  if (keyCode == 68) {
    goRight = true;
  }
}

void keyReleased() {
  if (keyCode == 65) {
    goLeft = false;
  }
  if (keyCode == 68) {
    goRight = false;
  }
}



