
float player_x = 0;
float player_y = 380;
float g = 255;
float r = 1;
float c = 1;
float sky = 255;
float skyMult = 0.1;
float b = 0;
int h = 255;
float rectAlpha = 0;

void setup() {
  size(400, 400);
  frameRate(60);
  PFont font;
  font = loadFont("BatikRegular-48.vlw");
  textFont(font, 24);
  noStroke();
}

void draw() {
  background(0, 0, sky);
  fill(255);
  text("Health:", 10, 20);
  sky = sky - skyMult;
  fill(100);
  triangle(200, 400, 210, 390, 220, 400);
  triangle(220, 400, 230, 390, 240, 400);
  triangle(240, 400, 250, 390, 260, 400);
  triangle(260, 400, 270, 390, 280, 400);
  triangle(280, 400, 290, 390, 300, 400);
  fill(0, 100, 0);
  rect(300, 390, 100, 10);
  fill(0, 100, 0);
  rect(0, 390, 200, 10);
  fill(r, g, b);
  text(h, 120, 20);
  rect(player_x, player_y, 10, 10);
  fill(255);
  rect(50, 370, 20, 20);
  fill(255, 0, 0);
  rect(52, 378, 16, 4);
  fill(255, 0, 0);
  rect(58, 372, 4, 16);
  fill(0, 0, 0, rectAlpha);
  rect(0, 0, width, height);
  if(sky < 0) {
    skyMult = skyMult * -1;
  }
  if(keyPressed) {
    if(key == 'a' || key == 'A') {
      player_x--;
    }
  }
  if(keyPressed) {
    if(key == 'd' || key == 'D') {
      player_x++;
    }
  }
  if(player_x < 0) {
    player_x = 0;
  }
  if(player_x > 390) {
    player_x = 390;
  }
  if(player_y > 380) {
    player_y = 380;
  }
  if(player_x > 200 && player_x < 290) {
    g = g - 1;
    r = r + c;
    h = h - 1;
  }
  if(h > 1) {
    if(player_x > 50 && player_x < 60) {
      h = 255;
      g = 255;
      b = 0;
      r = 1;
    }
  }
  if(r > 255) {
    r = 0;
    c = c * -1;
  }
  if(r < 1) {
    rectAlpha = rectAlpha + 1;
    fill(255, 0, 0, rectAlpha);
    text("Unfortunate...", 100, 100);
    b = sky;
  }
}


