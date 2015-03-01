
Setting setting;
ArrayList<PinkTrail> PinkTrails = new ArrayList<PinkTrail>();
ArrayList<GreenTrail> GreenTrails = new ArrayList<GreenTrail>();
char directionP;
char directionG;
boolean pinkGameOver = false;
boolean greenGameOver = false;
StartPage startPage;
PinkLost pinkLost;
GreenLost greenLost;
boolean gamePage = false;
boolean move = false;

void setup() {
  background (0);
  size (900, 700);
  setting = new Setting(width/2, height/2);
  startPage = new StartPage (width/2, height/2);
  pinkLost = new PinkLost (width/2, height/2);
  greenLost = new GreenLost (width/2, height/2);
  float bike1X = 600;
  float bike1Y = 345;
  PinkTrails.add(new PinkTrail(bike1X, bike1Y));
  float bike2X = 300;
  float bike2Y = 345;
  GreenTrails.add(new GreenTrail(bike2X, bike2Y));
  pinkGameOver = false;
  greenGameOver = false;
  move = false;
}

void draw() {
  background(0);
  smooth();
  pages();
  pinkDrawTrail();
  pinkTrailCollision();
  pinkGreenTrailCollision();
  greenDrawTrail();
  greenTrailCollision();
  greenPinkTrailCollision();
  if (move == true) {
    pinkMoveBike();
    greenMoveBike();
  }
}

void pinkDrawTrail() {
  for (int i = 0; i<PinkTrails.size(); i++) {
    PinkTrail tr = PinkTrails.get(i);
    tr.display();
  }
}

void greenDrawTrail() {
  for (int i = 0; i<GreenTrails.size(); i++) {
    GreenTrail gtr = GreenTrails.get(i);
    gtr.display();
  }
}

void pinkMoveBike() {
  PinkTrail bike = PinkTrails.get(0);
  switch(directionP) {
  case'w':
    PinkTrails.add(new PinkTrail(bike.x, bike.y));
    bike.x -=4;
    break;
  }
  switch(directionP) {
  case'n':
    PinkTrails.add(new PinkTrail(bike.x, bike.y));
    bike.y -=4;
    break;
  }  
  switch(directionP) {
  case'e':
    PinkTrails.add(new PinkTrail(bike.x, bike.y));
    bike.x +=4;
  }
  switch(directionP) {
  case's':
    PinkTrails.add(new PinkTrail(bike.x, bike.y));
    bike.y +=4;
    break;
  }
  switch(directionP) {
  case'g':
    bike.x +=0;
    bike.y +=0;
    break;
  }
  if (bike.x < 100 || bike.x > width-100 || bike.y < 100 || bike.y > height-110) {
    bike.x = 600;
    bike.y = 345;
  }
}

void greenMoveBike() {
  GreenTrail bike = GreenTrails.get(0);
  switch(directionG) {
  case'l':
    GreenTrails.add(new GreenTrail(bike.x, bike.y));
    bike.x -=4;
    break;
  }
  switch(directionG) {
  case'u':
    GreenTrails.add(new GreenTrail(bike.x, bike.y));
    bike.y -=4;
    break;
  }  
  switch(directionG) {
  case'r':
    GreenTrails.add(new GreenTrail(bike.x, bike.y));
    bike.x +=4;
    break;
  }
  switch(directionG) {
  case'd':
    GreenTrails.add(new GreenTrail(bike.x, bike.y));
    bike.y +=4;
    break;
  }
  switch(directionG) {
  case'g':
    bike.x +=0;
    bike.y +=0;
    break;
  }
  if (bike.x < 100 || bike.x > width-100 || bike.y < 100 || bike.y > height-110) {
    bike.x = 600;
    bike.y = 345;
  }
}

void pinkTrailCollision() {
  PinkTrail bike = PinkTrails.get(0);
  for (int i = 1; i< PinkTrails.size(); i++) {
    PinkTrail line = PinkTrails.get(i);
    if (bike.x == line.x && bike.y == line.y) {
      for (int g = 0; g<PinkTrails.size(); g++) {
        PinkTrails.remove(g);
        bike.x+=0;
        bike.y+=0;
      }
      pinkGameOver=true;  
      if (pinkGameOver=true) { 
        println("pinkDIE");
        //pinkLost.display();
      }
      // noLoop();
    }
  }
}

void greenTrailCollision() {
  GreenTrail bike = GreenTrails.get(0);
  for (int i = 1; i< GreenTrails.size(); i++) {
    GreenTrail line = GreenTrails.get(i);
    if (bike.x == line.x && bike.y == line.y) {
      for (int g = 0; g<GreenTrails.size(); g++) {
        GreenTrails.remove(g);
        bike.x+=0;
        bike.y+=0;
      }
      greenGameOver=true;  
      if (greenGameOver=true) { 
        println("greenDIE");  
        //greenLost.display();
      }
      // noLoop();
    }
  }
}

void greenPinkTrailCollision() {
  GreenTrail bike = GreenTrails.get(0);
  for (int i = 1; i< PinkTrails.size(); i++) {
    PinkTrail line = PinkTrails.get(i);
    if (bike.x == line.x && bike.y == line.y) {
      for (int g = 0; g<GreenTrails.size(); g++) {
        GreenTrails.remove(g);
        bike.x+=0;
        bike.y+=0;
      }
      greenGameOver=true;  
      if (greenGameOver=true) { 
        println("greenDIE");  
        //greenLost.display();
      }
      //noLoop();
    }
  }
}

void pinkGreenTrailCollision() {
  PinkTrail bike = PinkTrails.get(0);
  for (int i = 1; i< GreenTrails.size(); i++) {
    GreenTrail line = GreenTrails.get(i);
    if (bike.x == line.x && bike.y == line.y) {
      for (int g = 0; g<PinkTrails.size(); g++) {
        PinkTrails.remove(g);
        bike.x+=0;
        bike.y+=0;
      }
      pinkGameOver=true;  
      if (pinkGameOver=true) { 
        println("pinkDIE");
        //pinkLost.display();
      }
      // noLoop();
    }
  }
}


void keyTyped() {
  move = true;
  PinkTrail bike = PinkTrails.get(0);
  if (key == 'j')directionP = 'w';
  if (key == 'i')directionP = 'n';
  if (key == 'l')directionP = 'e';
  if (key == 'k')directionP = 's';
  if (mousePressed) directionP = 'g';
  GreenTrail bike2 = GreenTrails.get(0);
  if (key == 'a')directionG = 'l';
  if (key == 'w')directionG = 'u';
  if (key == 'd')directionG = 'r';
  if (key == 's')directionG = 'd';
  if (mousePressed) directionG = 'g';
}

void pages() {
  if (keyCode == ENTER) { 
    gamePage = true;
  }
  if (!gamePage) {
    startPage.display();
  }
  if (gamePage) {
    setting.display();
  } 
  if (pinkGameOver == true) { 
    pinkLost.display();
    noLoop();
  }
  if (greenGameOver== true) {
    greenLost.display();
    noLoop();
  }
}


void mousePressed() {
  for (int g = 0; g<PinkTrails.size(); g++) {
    PinkTrails.clear();
  }
  for (int g = 0; g<GreenTrails.size(); g++) {
    GreenTrails.clear();
  }
  setup ();
  loop();
}

class GreenTrail {
  float x, y;


  GreenTrail(float tx, float ty) {
    x = tx;
    y = ty;
   
  }

  void display() {
   stroke(#55F7CD);
    rect(x,y,2,2);
  }
}
class PinkTrail {
  float x, y;

  PinkTrail(float tx, float ty) {
    x = tx;
    y = ty;
  }

  void display() {
    stroke(#B92CE5);
    rect(x,y,2,2);
  }
}

class Setting {
  float xpos;
  float ypos;
  PFont mono;

  Setting(float xpos, float ypos) {
  }

  void display() {
    smooth();
    stroke(200, 50);
    strokeWeight(3);
    for (int x = 100; x <= 800; x+=35) {
      line(x, 100, x, 590);
    }
    for (int y = 100; y <= 620; y+=35) {
      line(100, y, 800, y);
    }
    stroke(#55F7CD);
    noFill();
    ellipse(275, 50, 125, 75);
    rectMode(CENTER);
    rect(120, 50, 15, 30);
    rect(150, 50, 15, 60);
    rect(180, 50, 15, 90);
    stroke(#B92CE5);
    ellipse(625, 50, 125, 75);
    rect(720, 50, 15, 90);
    rect(750, 50, 15, 60);
    rect(780, 50, 15, 30);
    mono = loadFont("Monospaced-48.vlw");
    textFont(mono);
    textSize(50);
    text("SCORE", 380, 60);
    fill(230);
    text("W", 100, 630);
    text("A", 70, 655);
    text("S", 130, 655);
    text("D", 102, 680);
    text("I", 800, 630);
    text("J", 770, 655);
    text("L", 830, 655);
    text("K", 800, 680); 
  }
}

class StartPage {
  float xpos;
  float ypos;
  PFont mono;

 StartPage(float xpos, float ypos) {
  }

  void display() {
    stroke(0);
    fill(0);
   rect(0,0,1800,1400);
    stroke(#55F7CD);
    noFill();
    mono = loadFont("Monospaced-48.vlw");
    textFont(mono);
    textSize(50);
    fill(230);
    text("TRON", 380, 60);
    text("Push (ENTER) to start", 150, 630);

  }
}

class GreenLost {
  float xpos;
  float ypos;
  PFont mono;

  GreenLost(float xpos, float ypos) {
  }

  void display() {
  stroke(0);
    fill(0);
   rect(0,0,1800,1400);
      stroke(#55F7CD);
    noFill();

    mono = loadFont("Monospaced-48.vlw");
    textFont(mono);
    textSize(50);
     fill(230);
    text("Green Lost", 330, 60);
    text("Click To Play Again", 200, 400);
    fill(#B92CE5);
    textSize(75);
    text("PINK WINS!!!", 250, 630);
  }
}

class PinkLost {
  float xpos;
  float ypos;
  PFont mono;

 PinkLost(float xpos, float ypos) {
  }
  void display() {
    stroke(0);
    fill(0);
    rect(0,0,1800,1400);
    stroke(#55F7CD);
    noFill();
    mono = loadFont("Monospaced-48.vlw");
    textFont(mono);
    textSize(50);
     fill(230);
    text("Pink Lost", 330, 60);
    text("Click To Play Again", 200, 400);
   fill(#55F7CD);
   textSize(75);
    text("GREEN WINS!!!", 250, 630);

  }
}



