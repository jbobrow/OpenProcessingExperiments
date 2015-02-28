
/** Sandgrains © 2012/10/18 by Peter Bosshard Schneider<br />
 * Sandgrains are falling from the sky on a horizontal plane<br />
 * If a certain weight is reached the plane breaks and the sand is falling again.<br />
 * After a certain amount of grains have passed the hole, the plain gets repair.<br />
 * This is a tweak of the sand-sketch from oct. 2010 <br />
 * Press 'p' to toggle paused/not paused<br />
 * Press 'r' to reset<br />
 */

color sandClr = color(255, 255, 153);                // default sand color
color bgClr = color(0);                              // background color
color stopClr = color(255, 0, 0);                    // color of the plane
color limitClr = color(0, 102, 153, 153);            // color to detect the weight limit
int koerner;                                         // number of grains
int currkoerner;                                     // current number of grains
SandGrain[] SandKoerner;                             // array of sandgrain objects
int[] gewicht;                                       // array of weights across the horizontal plain
int[] bruchstelle;                                   // array of holes in the plain
int ly;
int bruch;
int maxfluss;
int starttime, duration;
boolean paused = false;


void setup() {
  size(500, 500, P2D);
  //size(200, 200, P2D);
  //size(screenWidth,screenHeight,P2D); 
  background(0);
  noLoop();
  frameRate(120);
  reset();
}

void reset() {
  starttime = millis();
  duration = 0;
  currkoerner = 0;
  koerner = (width*height)/4;
  SandKoerner = new SandGrain[koerner]; 
  SandKoerner[currkoerner] = new SandGrain(width/2, 0);
  gewicht = new int[width];
  bruchstelle = new int[width];
  maxfluss = height;
  ly = height/10;
  bruch = height/20;
  for (int i=0;i<gewicht.length;i++) {
    gewicht[i] = 0;
    bruchstelle[i]=maxfluss;
  }
  loop();
}

void draw() {
  background(0);
  loadPixels();
  if ((currkoerner%int(koerner/10) == 0)&&(currkoerner<koerner/3.0))ly += height/10;
  if (currkoerner == koerner-2) ly=height;
  if (currkoerner == koerner/10) {
    duration = (millis()-starttime);
    println("Dropped " + currkoerner + " sandgrains in " + duration + " milliseconds.");
  }
  for (int i=0;i<gewicht.length;i++) {
    if (((gewicht[i] == bruch)&&(bruchstelle[i]>0))||((gewicht[i]<bruch)&&(bruchstelle[i]<maxfluss)&&(bruchstelle[i]>0))) {
      set(i, ly, bgClr);
      bruchstelle[i]--;
    }
    else {
      set(i, ly, stopClr);
      bruchstelle[i]=maxfluss;
    }
  }
  updatePixels();


  if (currkoerner<koerner-1) {
    currkoerner++;
    SandKoerner[currkoerner] = new SandGrain((width/2)-int(random(width/2))+int(random(width/2)), 0);
    float bright = random(50)+200;
    SandKoerner[currkoerner].setColor(color(bright, bright-10, bright-100));
  }
  loadPixels();
  for (int i=0;i<currkoerner;i++) {
    SandGrain currKorn = SandKoerner[i];
    if (get(currKorn.getX(), currKorn.getY()+1) == bgClr) {
      currKorn.setY(currKorn.getY()+1);
      set(currKorn.getX(), currKorn.getY(), currKorn.getColor());
    }
    else if (get(currKorn.getX()-1, currKorn.getY()+1) == bgClr) {

      currKorn.setY(currKorn.getY()+1);
      currKorn.setX(currKorn.getX()-1);
      set(currKorn.getX(), currKorn.getY(), currKorn.getColor());
    }
    else if (get(currKorn.getX()+1, currKorn.getY()+1) == bgClr) {

      currKorn.setY(currKorn.getY()+1);
      currKorn.setX(currKorn.getX()+1);
      set(currKorn.getX(), currKorn.getY(), currKorn.getColor());
    }
    else {
      set(currKorn.getX(), currKorn.getY(), currKorn.getColor());
    }
    updatePixels();
  }
  for (int j=0;j<width;j++) {
    int g=0;
    for (int i=0;i<=bruch;i++) {
      if (get(j, ly-i) != bgClr) {
        g++;
      }
    }
    gewicht[j]=g;
  }
  // draw limit line and gap indicator over display
  if (currkoerner <= koerner-2) {
    stroke(limitClr);
    line(0, ly-bruch, width, ly-bruch);
    for (int i=0;i<bruchstelle.length;i++) {
      if (bruchstelle[i]<height) { // only draw this if a gap is indicated
        line(i, 0, i, bruchstelle[i]);
      }
    }
  }
}

void keyReleased() {
  switch(key) {
  case 'p':
    paused = !paused;
    if (paused) {
      noLoop();
    }
    else {
      loop();
    }
    break;
  case 'r':
    reset();
    break;
  }
}

public class SandGrain {
  int currx;
  int curry;
  color sandColor = color(255, 200, 51);

  public SandGrain(int stx, int sty) {
    currx = stx;
    curry = sty;
  }

  int getX() {
    return currx;
  }
  int getY() {
    return curry;
  } 

  void setX(int sx) {
    currx = sx;
  }

  void setY(int sy) {
    curry = sy;
  }

  void setColor(color clr) {
    this.sandColor = clr;
  }

  color getColor() {
    return this.sandColor;
  }
}


