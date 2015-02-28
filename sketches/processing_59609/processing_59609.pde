
int sx, sy, time, squaresize, gen, currentColor, cellRed, cellGreen, cellBlue, stoptime =10000, phase;
float speed, randscaleval;
int[][][] world;

PFont fontA;

void setup() 
{ 

  fontA = loadFont("Georgia-Italic-20.vlw");
  textFont(fontA, 20);

  gen=20;
  squaresize = 4;
  size(1280, 640);
  //size(640, 480);

  frameRate(25);
  sx = width/squaresize;
  sy = height/squaresize;
  time = 0;
  speed = 1.5;
  world = new int[sx][sy][5]; //0, 1 for current and next generation state// 2, 3, 4 for R, G, B new color
  noStroke();
  smooth();

  //starting point : set everything to dead except a vertical line at the middle of the screen
  for (int x = 0; x < sx; x++) { 
    for (int y = 0; y < sy; y++) { 
      world[(int)x][(int)y][0] = 0;
      world[(int)x][(int)y][1] = -2;
    }
  }

  color startcolor = newColor();
  int R = (int)red(startcolor);
  int G = (int)green(startcolor);
  int B = (int)blue(startcolor);

  for (int i = 0; i < sy; i++) {
    world[(int)sx/2][(int)i][1] = 1;
    world[(int)sx/2][(int)i][2] = R;
    world[(int)sx/2][(int)i][3] = G;
    world[(int)sx/2][(int)i][4] = B;
  }
} 

int alphaVal() {
  return (int)(constrain((gettime() * 255 / gen * speed), 0, 255));
}

int gettime() {
  return time % gen;
}

float randscale() {
  return random (10, 30);
}

color newColor() {
  int R = (int)random(255);
  int G = (int)random(255);
  int B = (int)random(255);
  return color(R, G, B);
}

// Birth and death cycle 
void getnextgen() {
  int cRed, cGreen, cBlue;
  currentColor = newColor();
  cRed = (int)red(currentColor);
  cGreen = (int)green(currentColor);
  cBlue = (int)blue(currentColor);

  for (int x = 0; x < sx-1; x++) { 
    for (int y = 0; y < sy-1; y++) { 
      int count = neighbors(x, y); 
      if (world[x][y][0] == 0) {
        if (count == 3) { //borns
          world[x][y][1] = 1;
          world[x][y][2] = cRed;
          world[x][y][3] = cGreen;
          world[x][y][4] = cBlue;
        } 
        else {//remains dead
          world[x][y][1] = -2;
        }
      }

      if (world[x][y][0] == 1) { 
        if (count < 2 || count > 3) {//dies
          world[x][y][1] = -1;
        }
        else {//survives
          world[x][y][1] = 0;
        }
      }
    }
  }
} 

void gameOfLifeDrawing() {
  //Drawing the games of life
  for (int x = 0; x < sx-1; x++) { 
    for (int y = 0; y < sy-1; y++) { 
      if (gettime() == (gen - 1) ) { //update the cell's status
        if (world[x][y][0] == 1 && (world[x][y][1] == 0 || world[x][y][1] == 1)) { //survives
          fill(world[x][y][2], world[x][y][3], world[x][y][4]);
          world[x][y][0] = 1;
        }
        if (world[x][y][0] == 1 && world[x][y][1] == -1) { //dies
          noFill();
          world[x][y][0] = 0;
        } 
        if (world[x][y][0] == 0 && world[x][y][1] == -2) { //remains dead
          noFill();
          world[x][y][0] = 0;
        }
        if (world[x][y][0] == 0 && world[x][y][1] == 1) { //borns
          fill(world[x][y][2], world[x][y][3], world[x][y][4]);
          world[x][y][0] = 1;
        }
      }   

      else { //24 frames transition without updating the cell's status
        if (world[x][y][0] == 1 && (world[x][y][1] == 0 || world[x][y][1] == 1)) { //survives
          fill(world[x][y][2], world[x][y][3], world[x][y][4]);
        }
        if (world[x][y][0] == 1 && world[x][y][1] == -1) { //dies
          fill(world[x][y][2], world[x][y][3], world[x][y][4], (255 - alphaVal()));
        }
        if (world[x][y][0] == 0 && world[x][y][1] == -2) { //remains dead
          noFill();
        }
        if (world[x][y][0] == 0 && world[x][y][1] == 1) { //borns
          fill(world[x][y][2], world[x][y][3], world[x][y][4], alphaVal());
        }
      }
      //the 4 games of life
      rect(x*squaresize - width/2 - squaresize / 2, y*squaresize - squaresize /2, squaresize, squaresize);
      rect(x*squaresize - width/2  - squaresize / 2, -y*squaresize - squaresize/2, squaresize, squaresize);
      rect(y*squaresize - squaresize / 2, x*squaresize - width/2 - squaresize / 2, squaresize, squaresize);
      rect(-y*squaresize- squaresize / 2, x*squaresize - width/2- squaresize / 2, squaresize, squaresize);
    }
  }
}

int neighbors(int x, int y) 
{ 
  return world[(x + 1) % sx][y][0] + 
    world[x][(y + 1) % sy][0] + 
    world[(x + sx - 1) % sx][y][0] + 
    world[x][(y + sy - 1) % sy][0] + 
    world[(x + 1) % sx][(y + 1) % sy][0] + 
    world[(x + sx - 1) % sx][(y + 1) % sy][0] + 
    world[(x + sx - 1) % sx][(y + sy - 1) % sy][0] + 
    world[(x + 1) % sx][(y + sy - 1) % sy][0];
} 

void draw() 
{ 
  background(0); 
  time++;//comment to iterate with space bar
  if (gettime() == 0) {
    getnextgen();
    randscaleval = randscale();
  }

  pushMatrix();
  //move matrix origin to the center of the screen
  translate(width/2, height/2);

  //general scale
  scale(0.5);

  //zoom IN/OUT (relative scale)
  float relscale=1, minscale=0.5, maxscale=10, rotspeed=0;
  int phase1 = 982, phase2 = 2874, phase3 = 3295, phase4 = 3650, phase5 = 3937, phase6 = 4300, phase7=4900;
  ;

  if (time < phase1) {//intro
    phase=0;
    relscale =  800 - time*1.5 ;
    gen = 200;
    rotspeed = radians(sq(time) / phase1%360);
  }

  else if (time >= phase1 && time <phase2) {//1
    phase=1;
    gen = 100;
    relscale = 1;
    float nbrdetours = 0.25;
    rotspeed = radians(((((360*nbrdetours*(time-phase1)) / (phase2 - phase1))) %360));
  }

  else if (time >= phase2 && time <phase3) {//2
    phase=2;
    relscale = (10.0/500)*(time-phase2) + 1;
  }

  else if (time >= phase3 && time <phase4) {//3
    phase=3;
    relscale =  (gettime() * maxscale) / (randscaleval * 2.5) ;
    gen = 100;
    rotspeed =0;
  }

  else if (time >= phase4 && time <phase5) {//4
    phase=4;
    gen = 25;
    if (time % (gen*4) < gen) {  
      relscale = random(minscale, minscale + time/1000);
    }
    if (time % (gen*4) >= gen && time % (gen*4) < gen*1.5) {  
      relscale = gettime() * ((maxscale - minscale) / gen / 1.5) + minscale;
    }
    else {
      relscale = maxscale - 1 - gettime() * ((maxscale - minscale) / gen / 1.5) + minscale;
    }
    rotspeed = radians(time%360);
  }

  else if (time >= phase5 && time <phase6) {//phase 5
    phase=5;
    if ((time-phase5)%150 <= 25) {
      relscale = random(0.3, 25);
    }
  }

  else if (time >= phase6 && time < stoptime) {//6
    phase=6;
    gen = 100;
    relscale = 1;
    rotspeed = radians(((time/15.0)-(phase6/15%360))%360);
    if ((rotspeed%(2*PI) == PI/2 || rotspeed%(2*PI) == 0) && time > phase7) {
      stoptime = time;
    }
  }

  else {//outro
    phase=7;
    rotspeed = 0;
  }

  //Matrix relative scaling
  scale(relscale);

  //Matrix continuous rotation
  rotate(rotspeed);

  //Draw games
  gameOfLifeDrawing();

  popMatrix();

 /* fill(255);
  text("elapsed = "+stoptime+"''", 20, 30);
  text("time = "+time, 20, 60);
  text("scale = "+relscale, 20, 90);
  text("phase = "+phase, 20, 120);*/
}

void keyPressed() {
  int keyIndex = -1;
  if (keyIndex == -1) {
    time++;
  }
}


