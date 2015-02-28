
//for sound
import ddf.minim.*;

Minim minim;
AudioSample hurting;
AudioSample win_sound;
AudioSample lose;

int sound = 0;
int sound_win = 0;
int sound_lose = 0;

PFont font;
PImage bg;
PImage hurt_r, hurt_l, hurt_t, hurt_b;
PImage star_image;

//for position
float x = 280, y = 300;
float x_r = 320, y_r = 300;

float x_star = random(10, 580), y_star = random(10, 580);
float x_star_2 = random(10, 580), y_star_2 = random(10, 580);
float x_star_3 = random(10, 580), y_star_3 = random(10, 580);

//for ball speed
float x_speed = random(4, 6), y_speed = random(4, 6);
float x_r_speed = random(4, 6), y_r_speed = random(4, 6);

//for counter
int start = 0;
int w_s = 0, r_s = 0;
int star = 0;
int star_2 = 0;
int star_3 = 0;

//for life
int life = 10;

//for bg color
int alert = 0;
float red = 0;
float r = random (100, 256);
float b = random (100, 256);
float g = random (100, 256);

//for win
int win = 0;

void setup() {
  size(600, 600);
  font = loadFont("CourierNewPS-BoldMT-25.vlw");
  bg = loadImage("black-texture.jpg");
  hurt_r = loadImage("hurt-r.png");
  hurt_l = loadImage("hurt-l.png");
  hurt_t = loadImage("hurt-t.png");
  hurt_b = loadImage("hurt-b.png");
  star_image = loadImage("star.png");

  new Minim(this).loadFile("bg.wav").loop();
  minim = new Minim(this);
  hurting = minim.loadSample("hurt.mp3");
  lose = minim.loadSample("lose.mp3");
  win_sound = minim.loadSample("win.mp3");
}

void draw() {  
  // for image
  tint(r, b, g);
  image(bg, 0, 0, width, height);
  noTint();
  image(hurt_t, 155, 0, 295, 20);
  image(hurt_b, 155, height - 20, 295, 20);
  image(hurt_l, 0, 155, 20, 295);
  image(hurt_r, width - 20, 155, 20, 295);

  //alert
  fill(256, 0, 0, red);
  rect (0, 0, width, height);

  if (alert == 1) { 
    red = red - 30;
  }

  if (red <= 0) {
    alert = 0;
  }

  if (sound == 1) {
    hurting.trigger();
  }
  sound = 0;

  if (sound_win == 1) {
    win_sound.trigger();
  }

  if (sound_lose == 1) {
    lose.trigger();
  }

  //red circle
  fill(255, 0, 0);
  ellipse(563, 40, 75, 75);
  fill(0);
  textFont(font, 25);
  text("RED", width - 37, 48);

  //white circle
  fill(255);
  ellipse(40, height - 38, 75, 75);
  fill(0);
  textFont(font, 20);
  text("WHITE", 39, height - 30);

  //star
  if (star == 0) {
    stroke(0);
    tint(255, 255, 0);
    image(star_image, x_star, y_star, 20, 20);
  }
  if (star_2 == 0) {
    stroke(0);
    tint(255, 255, 0);
    image(star_image, x_star_2, y_star_2, 20, 20);
  }
  if (star_3 == 0) {
    stroke(0);
    tint(255, 255, 0);
    image(star_image, x_star_3, y_star_3, 20, 20);
  }

  if ((star == 0) && (x >= x_star && x <= x_star + 20 && y >= y_star && y <= y_star + 20) || (x_r >= x_star && x_r <= x_star + 20 && y_r >= y_star && y_r <= y_star + 20)) {
    star = 1;
  }
  if ((star_2 == 0) && (x >= x_star_2 && x <= x_star_2 + 20 && y >= y_star_2 && y <= y_star_2 + 20) || (x_r >= x_star_2 && x_r <= x_star_2 + 20 && y_r >= y_star_2 && y_r <= y_star_2 + 20)) {
    star_2 = 1;
  }
  if ((star_3 == 0) && (x >= x_star_3 && x <= x_star_3 + 20 && y >= y_star_3 && y <= y_star_3 + 20) || (x_r >= x_star_3 && x_r <= x_star_3 + 20 && y_r >= y_star_3 && y_r <= y_star_3 + 20)) {
    star_3 = 1;
  }

  // White ball
  stroke(0);
  fill(255);
  ellipse(x, y, 10, 10);

  if (start == 1) {
    x = x + x_speed;
    y = y + y_speed;
  }

  // for bouncing
  if (x <= 5 || x >= width - 5) {
    x_speed = -x_speed;
  }
  if (y <= 5 || y >= height - 5) {
    y_speed = -y_speed;
  }

  //for -life
  if ((x <= 5 && y >= 155 && y <= height - 150) || (x >= width - 5 && y >= 155 && y <= height - 150)) {
    life = life - 1;
    alert = 1;
    red = 256;
    sound = sound + 1;
  }
  if ((y <= 5 && x >= 155 && x <= width - 150) || (y >= height - 5 && x >= 155 && x <= width - 150)) {
    life = life - 1;
    alert = 1;
    red = 256;
    sound = sound + 1;
  }

  // X-1
  // for the top bar_x
  noStroke();
  rect(mouseX + 40, 80, 600, 5);
  rect(mouseX - 640, 80, 600, 5);

  if ((x >= mouseX + 40 && x <= mouseX + 600 && y >= 75 && y <= 90) || (x >= mouseX - 600 && x <= mouseX - 40 && y >= 75  && y <= 90)) {
    y_speed = -y_speed;
  }
  // for the bottom bar_x
  rect(mouseX + 40, height - 80, 600, 5);
  rect(mouseX - 640, height - 80, 600, 5);

  if ((x >= mouseX + 40 && x <= mouseX + 600 && y >= height - 85 && y <= height - 70) || (x >= mouseX - 600 && x <= mouseX - 40 && y >= height - 85  && y <= height - 70)) {
    y_speed = -y_speed;
  }
  // for the top bar_x (inside)
  rect(mouseX + 340, 150, 600, 5);
  rect(mouseX - 640, 150, 900, 5);

  if ((x >= mouseX + 340 && x <= mouseX + 600 && y >= 145 && y <= 160) || (x >= mouseX - 640 && x <= mouseX + 260 && y >= 145  && y <= 160)) {
    y_speed = -y_speed;
  }
  // for the bottom bar_x (inside)
  rect(mouseX - 260, height - 150, 1000, 5);
  rect(mouseX - 940, height - 150, 600, 5);

  if ((x >= mouseX - 260 && x <= mouseX + 740 && y >= height - 155 && y <= height - 140) || (x >= mouseX - 940 && x <= mouseX - 340 && y >= height - 155  && y <= height - 140)) {
    y_speed = -y_speed;
  }

  // Y-1
  // for the left bar_y
  rect(80, mouseY + 40, 5, 600);
  rect(80, mouseY - 640, 5, 600);

  if ((y >= mouseY + 40 && y <= mouseY + 600 && x >= 75 && x <= 90) || (y >= mouseY - 600 && y <= mouseY - 40 && x >= 75  && x <= 90)) {
    x_speed = -x_speed;
  }
  // for the right bar_y
  rect(width - 80, mouseY + 40, 5, 600);
  rect(width - 80, mouseY - 640, 5, 600);

  if ((y >= mouseY + 40 && y <= mouseY + 600 && x >= width - 85 && x <= width - 70) || (y >= mouseY - 600 && y <= mouseY - 40 && x >= width - 85  && x <= width - 70)) {
    x_speed = -x_speed;
  }
  // for the left bar_x (inside)
  rect(150, mouseY + 340, 5, 600);
  rect(150, mouseY - 640, 5, 900);

  if ((y >= mouseY + 340 && y <= mouseY + 600 && x >= 145 && x <= 160) || (y >= mouseY - 640 && y <= mouseY + 260 && x >= 145  && x <= 160)) {
    x_speed = -x_speed;
  }
  // for the right bar_x (inside)
  rect(height - 150, mouseY - 260, 5, 1000);
  rect(height - 150, mouseY - 940, 5, 600);

  if ((y >= mouseY - 260 && y <= mouseY + 740 && x >= width - 155 && x <= width - 140) || (y >= mouseY - 940 && y <= mouseY - 340 && x >= width - 155  && x <= width - 140)) {
    x_speed = -x_speed;
  }

  // Red ball
  stroke(0);
  fill(255, 0, 0);
  ellipse(x_r, y_r, 10, 10);

  if (start == 1) {
    x_r = x_r + x_r_speed;
    y_r = y_r + y_r_speed;
  }

  // for bouncing
  if (x_r <= 5 || x_r >= width - 5) {
    x_r_speed = -x_r_speed;
  } 
  if (y_r <= 5 || y_r >= height - 5) {
    y_r_speed = -y_r_speed;
  }

  //for -life
  if ((x_r <= 5 && y_r >= 155 && y_r <= height - 150) || (x_r >= width - 5 && y_r >= 155 && y_r <= height - 150)) {
    life = life - 1;
    alert = 1;
    red = 256;
    sound = sound + 1;
  }

  if ((y_r <= 5 && x_r >= 155 && x_r <= width - 150) || (y_r >= height - 5 && x_r >= 155 && x_r <= width - 150)) {
    life = life - 1;
    alert = 1;
    red = 256;
    sound = sound + 1;
  }
  // X-2
  // for the top bar_x
  noStroke();
  if ((x_r >= mouseX + 40 && x_r <= mouseX + 600 && y_r >= 75 && y_r <= 90) || (x_r >= mouseX - 600 && x_r <= mouseX - 40 && y_r >= 75  && y_r <= 90)) {
    y_r_speed = -y_r_speed;
  }

  // for the bottom bar_x
  if ((x_r >= mouseX + 40 && x_r <= mouseX + 600 && y_r >= height - 85 && y_r <= height - 70) || (x_r >= mouseX - 600 && x_r <= mouseX - 40 && y_r >= height - 85  && y_r <= height - 70)) {
    y_r_speed = -y_r_speed;
  }

  // for the top bar_x (inside)
  if ((x_r >= mouseX + 340 && x_r <= mouseX + 600 && y_r >= 145 && y_r <= 160) || (x_r >= mouseX - 640 && x_r <= mouseX + 260 && y_r >= 145  && y_r <= 160)) {
    y_r_speed = -y_r_speed;
  }

  // for the bottom bar_x (inside)
  if ((x_r >= mouseX - 260 && x_r <= mouseX + 740 && y_r >= height - 155 && y_r <= height - 140) || (x_r >= mouseX - 940 && x_r <= mouseX - 340 && y_r >= height - 155  && y_r <= height - 140)) {
    y_r_speed = -y_r_speed;
  }

  // Y-1
  // for the left bar_y
  if ((y_r >= mouseY + 40 && y_r <= mouseY + 600 && x_r >= 75 && x_r <= 90) || (y_r >= mouseY - 600 && y_r <= mouseY - 40 && x_r >= 75  && x_r <= 90)) {
    x_r_speed = -x_r_speed;
  }

  // for the right bar_y
  if ((y_r >= mouseY + 40 && y_r <= mouseY + 600 && x_r >= width - 85 && x_r <= width - 70) || (y_r >= mouseY - 600 && y_r <= mouseY - 40 && x_r >= width - 85  && x_r <= width - 70)) {
    x_r_speed = -x_r_speed;
  }

  // for the left bar_x (inside)
  if ((y_r >= mouseY + 340 && y_r <= mouseY + 600 && x_r >= 145 && x_r <= 160) || (y_r >= mouseY - 640 && y_r <= mouseY + 260 && x_r >= 145  && x_r <= 160)) {
    x_r_speed = -x_r_speed;
  }
  // for the right bar_x (inside)
  if ((y_r >= mouseY - 260 && y_r <= mouseY + 740 && x_r >= width - 155 && x_r <= width - 140) || (y_r >= mouseY - 940 && y_r <= mouseY - 340 && x_r >= width - 155  && x_r <= width - 140)) {
    x_r_speed = -x_r_speed;
  }


  // for stars and life
  textAlign(CENTER);
  fill(255);
  textFont(font, 25);
  text("Star(s)", 300, 220);
  tint( 1, 1, 1);
  image(star_image, 250, 235);
  image(star_image, 290, 235);
  image(star_image, 330, 235);
  noTint();
  if (star == 1) {
    image(star_image, 250, 235);
  }
  if (star_2 == 1) {
    image(star_image, 290, 235);
  }
  if (star_3 == 1) {
    image(star_image, 330, 235);
  }

  fill(255);
  textFont(font, 25);
  text("Life : " + life, 300, 280);
  textFont(font, 15);
  text("press any key to", 300, 325);
  text("START and PASUE the game", 300, 345);

  //for win
  if (x >= 0 && x <= 80 && y >= height - 75 && y <= height) {
    w_s = 1;
  }
  else {
    w_s = 0;
  }

  if (x_r >= width - 75 && x_r <= width && y_r >= 0 && y_r <= 80) {
    r_s = 1;
  }
  else {
    r_s = 0;
  }

  if (w_s == 1 && r_s == 1 && mouseX >= 120 && mouseX <= width - 120 && mouseY >= 120 && mouseY <= height - 120) {
    win = 1;
  }

  if (win == 1) {
    fill(255, 0, 0);
    rect(0, 290, 600, 60);
    textAlign(CENTER);
    textFont(font, 25);
    fill(255);
    text("You win!!", 300, 320);
    textFont(font, 15);
    text("press any key to RESTART the game", 300, 340);
    start = 0;
    sound_win = sound_win + 1;
  }

  if ( life <= 0) {
    start = 0;
    life = 1;
    fill(0);
    rect(0, 290, 600, 60);
    textAlign(CENTER);
    textFont(font, 25);
    fill(255, 0, 0);
    text("GAME OVER!!", 300, 320);
    textFont(font, 15);
    text("press any key to RESTART the game", 300, 340);
    sound = -1;
    sound_lose = sound_lose + 1;
  }
}

void keyPressed() {
  if (start == 0) {
    start = 1;
  }
  else {
    start = 0;
  }

  if ((life == 1) || (win == 1)) {
    win = 0;
    life = 10;
    x = 280;
    y = 300;
    x_r = 320;
    y_r = 300;
    star = 0;
    star_2 = 0;
    star_3 = 0;
  }
}


