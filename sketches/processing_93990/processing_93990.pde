
// test obstacles for game 

float tx, ty, twd, tht, tdx, tdy, follow;
float ox, oy, owd, oht, odx, ody;
float timePhase;
int time;
int count;
float objectsize;

color objectcolor;
color targetcolor;

void setup () {

  size(400, 400);
  smooth();
  
  objectsize = 40;
  
  odx = 5;
  ody = 5;
  
  count = 0;
  
}


void draw () {
  playGame();
  
}


void obst (float x, float y, float wd, float ht) {
  
  objectcolor = color(200);
  fill(objectcolor);
  
  wd = objectsize/2;
  ht = objectsize/2;
  
  ellipseMode(CENTER);
  ellipse(x, y, wd, ht);
}




void drawObst () {

  ox = ox + odx;
  oy = oy + ody;

  if (ox > width)
  {
    odx = -odx;
  }

  if (ox < 0)
  {
    odx = -odx;
  }

  if (oy < height)
  {
    ody = -ody;
  }

  if (oy > 0)
  {
    ody = -ody;
  }

  obst (ox, oy, owd, oht);
  
}


void target (float x, float y, float wd, float ht) {
 
  targetcolor = color(0, 0, 255);
  fill (targetcolor);
 
  wd = objectsize;
  ht = objectsize;
  
  ellipse (x, y, wd, ht);
  
}

void drawTarget (){
 
  // generating variables to simmilate follow
//  tdx = mouseX - tx;
//  tdy = mouseY - ty;
//  follow = 0.1;
//  tx = tx + (tdx*follow);
//  ty = ty + (tdy*follow);

  tx = mouseX;
  ty = mouseY;
  
  // draw target
  target (tx, ty, twd, tht);
  
}

void checkHit () {
  
  float d = dist(tx, ty, ox, oy);
  
  if (d < 40) 
  {
   count ++;
   
   background (255, 0, 0);
   
   
   ox = random (0, width);
   oy = random (0, height);

   odx = random(-10, 10);
   ody = random(-10, 10);
   
    
  }
  
}

void gameData ()

{
  fill(0);
  text("Hits:   " + count, width*.4, height*.1);
  text("Time:  "  + time, width*.4, height*.15);
  
  time = millis() / 1000;
  
}

void playGame () {
  background (255);

  drawObst();
  drawTarget();
  checkHit();
  gameData();
  
}




