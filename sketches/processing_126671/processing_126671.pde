
float tx = 25;  // de halve breedte van een tegel
float ty = tx / 2;  // de halve hoogte van een tegel
int vn = 19;  // aantal tegels op de v-as
int wn = 19;  // aantal tegels op de w-as
int level = 0;  // bepaalt het level ( menu's zitten er ook bij )
int moeilijkheid = 0;  // bepaalt de moeilijkheid
int tekst = 0;  // bepaalt de welke tekst er getoond wordt (0 =  niets)
int beginx = 12; // begincoördinaat x
int beginy = 8; // begincoördinaat y
int avv = beginx; // personagecoördinaat x 
int avw = beginy; // personagecoördinaat y
PFont font;
PImage patroon;
PImage personage;
PImage boom;
PImage steen;
PImage gras;
PImage gras2;
PImage pokeball;
PImage achtergrond;
PImage level1;
PImage level2;
boolean[][] walls = new boolean[vn][wn];

void setup() {
  size(1024, 768);
  font = createFont("arial", 9);
  achtergrond = loadImage("pokemon red.jpg");
  pokeball = loadImage("pokeball.png");
  gras = loadImage("Gras.png");
  gras2 = loadImage("Gras2.png");
  level1 = loadImage("level-01.png");
  level2 = loadImage("level-02.png");
  steen = loadImage("Steen.png");
  boom = loadImage("boom.png");
  personage = loadImage("Front.png");
  initWalls ();
}

void draw() {
  image(achtergrond, 0, 0, width, height);
  stroke(0, 190);
  if (level == 0) {
    PFont font = loadFont("Arial.vlw");
    textFont(font);
    textAlign(CENTER);
    fill(0);
    text("Druk op Enter om te beginnen", width/2, 410);
    redraw();
  }
  if (level == 1) {
    strokeWeight(3);
    PFont font = loadFont("Arial.vlw");
    textFont(font);
    textAlign(CENTER);
    fill(255);
    rect(width * 1 / 4 - 200, height * 7 / 16, 400, height * 3 / 32);  
    rect(width * 3 / 4 - 150, height * 7 / 16, 300, height * 3 / 32); 
    fill(0);
    text("Gemakkelijk", width * 1 / 4, height / 2 + 5);
    text("Moeilijk", width * 3 / 4, height / 2 + 5);
    redraw();
  }
  if (level == 2) {
    strokeWeight(5);
    fill(255);
    rect(width / 16, height * 5 / 16, width * 6 / 16, height * 6 / 16); 
    image(level1, width / 16, height * 5 / 16, width * 6 / 16, height * 6 / 16);
    rect(width * 9 / 16, height * 5 / 16, width * 6 / 16, height * 6 / 16); 
    image(level2, width * 9 / 16, height * 5 / 16, width * 6 / 16, height * 6 / 16);
    fill(0);
    text("Level 1", width / 4 + 1, height/ 2 + 19);
    text("Level 1", width / 4 - 1, height/ 2 + 19);
    text("Level 1", width / 4 + 1, height/ 2 + 21);
    text("Level 1", width / 4 - 1, height/ 2 + 21);
    text("Level 2", width * 3 / 4 + 1, height/ 2 + 19);
    text("Level 2", width * 3 / 4 - 1, height/ 2 + 19);
    text("Level 2", width * 3 / 4 + 1, height/ 2 + 21);
    text("Level 2", width * 3 / 4 - 1, height/ 2 + 21);
    fill(255);
    text("Level 1", width / 4, height/ 2 + 20);
    text("Level 2", width * 3 / 4, height/ 2 + 20);
    redraw();
  }
  if (level >= 3) {
    noCursor();
  }
  if (avv == 13 && avw == 7 && tekst == 1 && level == 4) {
    PFont font = loadFont("Arial.vlw");
    textFont(font);
    textAlign(CENTER);
    strokeWeight(5);
    stroke(0);
    fill(255);
    rect(width / 2 - 500, 100, 1000, 70); 
    fill(0);
    text("Probeer eens naar beneden te gaan", width/2, 150);
    redraw();
  }
  translate(width / 2, 200);
  for (int v = 0; v < vn; v++) {
    pushMatrix();
    for (int w = 0; w < wn; w++) {
      drawTile(v, w);
      translate(tx, ty);
    }
    popMatrix();
    translate(-tx, ty);
  }
  if (level == 99) {
    translate(-37.5, -ty*35);
    background (0);
    PFont font = loadFont("Arial.vlw");
    textFont(font);
    textAlign(CENTER);
    fill(255);
    rect(width / 2 - 400, height / 2 - 137.5, 800, 245); 
    fill(0);
    text("Gefeliciteerd! Je hebt", width / 2, height / 2 - 90);
    text("Red terug op het pad gezet.", width / 2, height / 2 - 30);
    text("Druk op Enter om", width / 2, height / 2 + 30);
    text("het spel af te sluiten.", width / 2, height / 2 + 90);
    redraw();
  }
}
void drawTile(int v, int w) {      
  if (level >= 3) {
    if (v == 0 && w == 0) {
      int btx = int(tx * (vn + 1));
      int bty = int(ty * (wn + 1));
      pushMatrix();
      if (level == 3) {
        translate(0, -17);
      }
      else {
        translate(-25, 0);
      }
      stroke(0);
      strokeWeight(1);
      fill(150);
      if (level == 3) {
        quad(0, 0, btx, bty, 0, 2 * bty, -btx, bty);
        quad(btx, bty, btx, bty + 10, 0, 2 * bty + 10, 0, 2 * bty);
        quad(0, 2 * bty, 0, 2 * bty + 10, -btx, bty + 10, -btx, bty);
      }        
      else {
        quad(0, 0, btx, bty - 17, 0, 2 * bty, -btx + 25, bty);
        quad(btx, bty - 17, btx, bty - 3, 0, 2 * bty + 10, 0, 2 * bty);
        quad(0, 2 * bty, 0, 2 * bty + 10, -btx + 25, bty + 10, -btx + 25, bty);
      }
      popMatrix();
    } 
    if (walls[v][w] == true) {
      image(gras, -24, 0, 48, 24);
      if (level == 3) {
        if ((w == 2 && v == 10 ) || (w == 2 && v == 16 ) || (w == 4 && v == 4 ) || (w == 4 && v == 12 ) || (w == 4 && v == 14 )
          || (w == 6 && v == 6 ) || (w == 6 && v == 8 ) || (w == 10 && v == 7) || (w == 14 && v == 5) || (w == 14 && v == 11)
          || (w == 16 && v == 12) || (w == 16 && v == 16 ) || (w == 18 && v == 14 ) || (w == 18 && v == 16 )) {
          image(steen, -20, -15, 40, 30);
        }
        else {
          image(boom, -24, -17, 48, 34);
        }
      }
      if (level == 4) {
        if ((w == 6 && v == 14 ) || (w == 8 && v == 14 ) || (w == 9 && v == 10 ) || (w == 17 && v == 0 ) || (w == 17 && v == 2 )) {
          image(steen, -20, -15, 40, 30);
        }
        else {
          image(boom, -24, -17, 48, 34);
        }
      }
    }
    else if (v == avv && w == avw) {
      image(gras2, -24, 0, 48, 24);
      image(personage, -17, -17, 34, 34);
    }
    else { 
      image(gras2, -24, 0, 48, 24);
    }
    if (level == 3) {
      if ((v == 1 && w == 1) || (v == 15 && w == 16) || (v == 15 && w == 9) || (v == 13 && w == 1)) {
        image(pokeball, -14, -11, 24, 24);
      }
    }
  }
}

void initWalls() {
  if (level >= 3) {
    for (int v = 0; v < vn; v++) {
      for (int w = 0; w < wn; w++) {
        if (red(patroon.get(vn - v - 1, w)) == 0) {
          walls[v][w] = true;
        }
        else {
          walls[v][w] = false;
        }
      }
    }
  }
}

void mouseClicked() {  
  if (level == 1 ) {
    if (mouseX >= width * 1 / 4 - 200 && mouseX <= width * 1 / 4 + 200 && mouseY >= height * 7 / 16 && mouseY <= height * 17 / 32) {
      moeilijkheid = 0;
      level = 2;
      redraw();
    } 
    else if (mouseX >= width * 3 / 4 - 150 && mouseX <= width * 3 / 4 + 150 && mouseY >= height * 7 / 16 && mouseY <= height * 17 / 32) {
      moeilijkheid = 1;
      level = 2;
      redraw();
    }
  }
  else if (level == 2) {
    if (mouseX >= width / 16 && mouseX <= width * 7 / 16 && mouseY >= height * 5 / 16 && mouseY <= height * 11 / 16) {
      level = 3;
      patroon = loadImage("patroon-02.png");
      for (int v = 0; v<vn; v++) {
        for (int w = 0; w<wn; w++) {
          if (red(patroon.get(vn - v - 1, w))==0) {
            walls[v][w] = true;
          }
          else {
            walls[v][w] = false;
          }
        }
      }
      avv = beginx;
      avw = beginy;
      redraw();
    }
    else if (mouseX >= width * 9 / 16 && mouseX <= width * 15 / 16 && mouseY >= height * 5 / 16 && mouseY <= height * 11 / 16) {
      level = 4;
      wn = 18;
      patroon = loadImage("patroon-03.png");
      for (int v = 0; v < vn; v++) {
        for (int w = 0; w < wn; w++) {
          if (red(patroon.get(vn - v - 1, w)) == 0) {
            walls[v][w] = true;
          }
          else {
            walls[v][w] = false;
          }
        }
      }
      beginx = 9;
      beginy = 9;
      avv = beginx;
      avw = beginy;
      redraw();
    }
  }
}

boolean validTile(int v, int w) {
  if (level == 3) {
    if (v == 1 && w == 1) {
      avv = 15;
      avw = 7;
      redraw();
      return false;
    }
    if (v == 13 && w == 1) {
      avv = 8;
      avw = 13;
      redraw();
      return false;
    }
    if (v == 15 && w == 9) {
      avv = 5;
      avw = 13;
      redraw();
      return false;
    }
    if (v == 15 && w == 16) {
      avv = 10;
      avw = 11;
      redraw();
      return false;
    }
    if (v == 15 && w == 19) {
      level = 4;
      wn = 18;

      patroon = loadImage("patroon-03.png");
      for (v = 0; v < vn; v++) {
        for (w = 0; w < 19; w++) {
          if (red(patroon.get(vn - v - 1, w)) == 0) {
            walls[v][w] = true;
          }
          else {
            walls[v][w] = false;
          }
        }
      }
      beginx = 9;
      beginy = 9;
      avv = beginx;
      avw = beginy;
      redraw();
      return false;
    }
    if ((w < 19 && w >= 0) && (v < 19 && v >= 0) && walls[v][w] == false ) {
      tekst = 0;
      return true;
    }
    else {
      if (moeilijkheid == 1) {
        avw = beginy;
        avv = beginx;
      }
      redraw();
      return false;
    }
  }

  if (level == 4) {
    if (v == 5 && w == 7) {
      avv = 13;
      avw = 7;
      tekst = 1;
      redraw();
      return false;
    }
    if (tekst == 1 && v == 14 && w == 7) {
      avv = 15;
      avw = 7;
      tekst = 0;
      redraw();
      return false;
    }
    if (v == 1 && w == 18) {
      level = 99;
      wn = 19;
      patroon = loadImage("patroon-02.png");
      for (v = 0; v < vn; v++) {
        for (w = 0; w < wn; w++) {
          if (red(patroon.get(vn - v - 1, w)) == 0) {
            walls[v][w] = true;
          }
          else {
            walls[v][w] = false;
          }
        }
      }
      beginx = 12;
      beginy = 8;
      avv = beginx;
      avw = beginy;
      tekst = 2;
      redraw();
      return false;
    }
    else if ((w < 19 && w >= 0) && (v < 19 && v >= 0) && walls[v][w] == false ) {
      tekst = 0;
      return true;
    }
    else {
      if (moeilijkheid == 1) {
        avw = beginy;
        avv = beginx;
      }
      redraw();
      return false;
    }
  }
  return true;
}

void keyReleased() { 
  if (key == ENTER && level == 0) {
    level = 1;
    redraw();
  } 
  if (key == ENTER && level == 99) {
    exit ();
    redraw();
  }
  if (key == CODED && level < 99) {
    if (keyCode == DOWN) {
      if (validTile(avv + 1, avw)) {
        avv++;
        personage = loadImage("Front.png");
        redraw();
      }
    }
    else if (keyCode == UP) {
      if (validTile(avv - 1, avw)) {
        avv--;
        personage = loadImage("Back.png");
        redraw();
      }
    }
    else if (keyCode == LEFT) {
      if (validTile(avv, avw - 1)) {
        avw--;
        personage = loadImage("Right.png");
        redraw();
      }
    }
    else if (keyCode == RIGHT) {
      if (validTile(avv, avw + 1)) {
        personage = loadImage("Left.png");
        avw++;
        redraw();
      }
    }
  }
}



