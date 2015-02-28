
Star [] en = new Star[1000];
Star [] po = new Star[500];

   int score = 0;
   int t = 1000;
   float ypos = 150;
   float xpos = 250; 
   float speed = 1;

void setup() {

  width=700;
  size(700,500);
  //Enemies
      for (int i = 0; i < en.length; i++){
      en[i] = new Star(1);
      }
      for (int i = 0; i < po.length; i++){
      po[i] = new Star(2);
      }
}


void draw() {
background(0);
enemyFlow();
pointFlow();
kvadratik();
}






void enemyFlow(){
  
  int i = 0;
   for(t=800; millis() > t; t=t+790){
      en[i].appear(255,0);
      en[i].collisionR();
      i++;
  }
  } 
  


void pointFlow(){
  float r2=random(0,500);
    int i = 0;
   for(t=5000; millis() > t; t=t+5000){
      po[i].appear(0,255);
      i++;
  } 
  
}



  void kvadratik(){
rectMode(CENTER);
   rect(xpos,ypos,30,30);
   if(keyPressed) {
    if (key == 'w' || key == 'W') {
      ypos=ypos-1.5;
    } else if (key == 's' || key == 'S') {
      ypos=ypos+1.5;
    }
   }
   
   if(ypos>height){
    ypos=0;
   } else if(ypos+30<0){
     ypos=height;
   }
}


class Star {

  float xloc = width;
  float yloc;
  float rcol;
  float gcol;
  float randomizer;

  Star(float tempYloc) {
    randomizer = tempYloc;

    if (randomizer == 1) {
      yloc=random(0, 500);
    } 
    else if (randomizer == 2) {
      yloc=random(0, 500);
    }
  }

  void appear(float tempRcol, float tempGcol) {
    rcol=tempRcol;
    gcol = tempGcol;

    //Green Collision
    if (rectBall(xpos, ypos, 30, 30, xloc, yloc, 10)==true && rcol == 0) {
      score++;
      yloc = -20;
    
    }


    fill(rcol, gcol, 0);
    ellipseMode(CENTER);
    ellipse(xloc, yloc, 10, 10) ;
    xloc=xloc-speed;
    fill(255);

    text("Score:" +score, 20, 20);
  }






  void collisionR() {
    if (rectBall(xpos, ypos, 30, 30, xloc, yloc, 10)==true) {

      fill(255);
      text("You Lost", width/2, height/2);
      fill(0);
      noLoop();
    }
  }

  boolean rectBall(float rx, float ry, float rw, float rh, float bx, float by, float d) {

    // first test the edges (this is necessary if the rectangle is larger
    // than the ball) - do this with the Pythagorean theorem

    // if ball entire width position is between rect L/R sides
    if (bx+d/2 >= rx-rw/2 && bx-d/2 <= rx+rw/2 && abs(ry-by) <= d/2) {
      return true;
    } 
    // if not, check if ball's entire height is between top/bottom of the rect
    else if (by+d/2 >= ry-rh/2 && by-d/2 <= ry+rh/2 && abs(rx-bx) <= d/2) {
      return true;
    } 

    // if that doesn't return a hit, find closest corner
    // this is really just a point, so we can test if we've hit it 
    // upper-left
    float xDist = (rx-rw/2) - bx;  // same as ball/ball, but first value defines point, not center
    float yDist = (ry-rh/2) - by;
    float shortestDist = sqrt((xDist*xDist) + (yDist * yDist));

    // upper-right
    xDist = (rx+rw/2) - bx;
    yDist = (ry-rh/2) - by;
    float distanceUR = sqrt((xDist*xDist) + (yDist * yDist));
    if (distanceUR < shortestDist) {  // if this new distance is shorter...
      shortestDist = distanceUR;      // ... update
    }

    // lower-right
    xDist = (rx+rw/2) - bx;
    yDist = (ry+rh/2) - by;
    float distanceLR = sqrt((xDist*xDist) + (yDist * yDist));
    if (distanceLR < shortestDist) {
      shortestDist = distanceLR;
    }

    // lower-left
    xDist = (rx-rw/2) - bx;
    yDist = (ry+rh/2) - by;
    float distanceLL = sqrt((xDist*xDist) + (yDist * yDist));
    if (distanceLL < shortestDist) {
      shortestDist = distanceLL;
    }

    // test for collision
    if (shortestDist < d/2) {  // if less than radius
      return true;             // return true
    }
    else {                     // otherwise, return false
      return false;
    }
  }
}

