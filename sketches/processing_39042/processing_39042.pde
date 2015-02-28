
PImage man;
PImage men;
PImage crystal;
int rad = 70;
float px, py;
float vx, vy;
float diam = 250;


void setup() {
  size (500, 500);
  smooth();
  px = width/2;
  py = height/2;
  vx = random (-10, 10);
  vy = random (-10, 10);
  man = loadImage ("man.png");
  men = loadImage ("men.png");
  crystal = loadImage("crystal.png");
}

void draw () {
  noStroke();
  if (millis() < 5000 || millis() == 5000) {
    noFill();
    stroke (0);
    strokeWeight (1);
    rect (124, 149, (5000/20), 51);
    noStroke();
    fill (random (0, 255), random (0, 255), random (0, 255));
    rect (125, 150, millis()/20, 50);
    fill (0);
    textSize (16);
    text ("Loading...", 125, 125);
  } 
  else {
   if ((millis()%2) == 0) {
      fill (random (0, 255), random (0, 255), random (0, 255), 100);
      ellipse (250, 250, rad, rad);
      rad +=5;
    }

    fill (random (0, 255), random (0, 255), random (0, 255), 10);
    image (crystal, 0, -20);
    image (crystal, 110, -20);
    image (crystal, 80, 70);
    
     px+=vx;
    py+=vy;
    if ((px< (diam/2))|| (px > width - (diam/2))) {
      vx = -vx;
    }
    if ((py<(diam/2))|| (py > width- (diam/2))) {
      vy = -vy;
    }
    noStroke();
    fill (random (200, 255), 70);
    ellipse (px, py, diam, diam);
    ellipse (py, px, diam, diam);
    
    fill (random (0, 255), random (0, 255), random (0, 255), 10);
    rect (0, 0, 500, 500);
    image (men, -20, 100);
    rect (0, 0, 500, 500);
    image (man, 120, 100);
  }
}


