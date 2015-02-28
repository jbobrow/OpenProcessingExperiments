
void setup() {
  size(400, 400);
  noStroke();
  spacing = 100;
  grav = 0; 
  seed = random(10000);
  ypos = n*height;
  for (int i = 0; i < trail.length; i++) {
    trail[i] = -50;
  }
  c = 1;
}

boolean go = true;

float x = 100;
float move;
float spacing;
float seed;
float n;
float timer;

boolean goDown;
float ypos;
float grav;

int score;

float[] trail = new float[50];

float c;

void draw() {
  c=(c+1)%255;
  //colorMode(HSB);
  colorMode(RGB);
  //fill(c, 255, 255, 30);
  //fill(0, 20);
  //rect(0, 0, width, height);  
  //background(c, 255, 255);
  background(0);

  if (go == true) {
    move();
    terrain();
  }
  else {
    textSize(35);
    textAlign(CENTER);
    fill(255, 0, 0);
    text("GAME OVER", width/2, height/3);
    text("SCORE : " + score, width/2, height*2/3);
    textSize(15);
    fill(255);
    text("- PRESS  ANY  KEY  TO  RESTART -", width/2, height/2);
  }
  if (get (50, (int)ypos) == color(0, 150, 0) || ypos >= height || ypos <= 0) {
    go = false;
  }
}

void mousePressed() {
  goDown = true;
}

void mouseReleased() {
  goDown = false;
}

void keyReleased() {
  if (go == false) {
    go = true;
    grav = 0;
    seed = random(10000);
    score = 0;
    spacing = 100;
    ypos = n*height;
    for (int i = 0; i < trail.length; i++) {
      trail[i] = -50;
    }
  }
}

void terrain() {
  noiseSeed((long)seed);
  for (int i = 0; i < width; i++) {
    n = noise((x + i)*.002, .002);
    stroke(0, 150, 0);
    //stroke(c, 255, 150);
    line(i, n*height + spacing, i, height);  
    line(i, 0, i, n*height - spacing);
  }
  textSize(20);
  textAlign(CENTER);
  fill(255);
  text("score : " + score, width/4, height*8/9);
}

void move() {  
  score++;
  x+=6;
  spacing-=.02;
  timer++;

  noStroke();

  fill(0, 0, 255);

  for (int i = 0; i < 12.5; i++) { 
    if (i != 12) {
      trail[i] = trail[i+1];
    }
    else {
      trail[i] = ypos;
    }
    ellipse(i*4, trail[i], 7, 7);
  }


  ypos+=grav;
  if (goDown == false) {
    grav+=.15;
  }
  else {
    grav-=.15;
  }
}



