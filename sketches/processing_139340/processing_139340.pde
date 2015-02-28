
/*

 Name: Drunken Spider
 Author: Marco Scarfagna
 Description: Wall bouncing and "generative" brush mashup. The "spider" bounces on the sides but with
 a curved path, generating interesting web-like patterns. 
 You can also turn Manual mode and draw on your own.
 
 */
float X, Y;
float dirX = 2.7;                      // X axis Speed and direction (given by + or - sign)
float dirY = 1.5;                      // Y axis Speed and direction (given by + or - sign)
float offset = 0.75;
ArrayList history;
float drunkFactor = random(0.5, 2);    // increment to twirl the spider path 
int attraction = int(random(20, 60));  // affects threshold for creation of conjunction lines
int lineDensity = 2;                   // affects number of conjunction lines drawn. Higher value = less lines
boolean manualMode = false;            // mouse drawing disabled by default. Press m to enable


void setup() {
  size(750, 500);
  X = width/2;
  Y = height/2;
  background(0);
  smooth();
  frameRate(200);                      // lower the framerate if drawing is too fast. Best at >100
  colorMode(HSB, 360, 100, 100, 100);
  history  = new ArrayList();
  println("Attraction threshold: "+attraction+" drunkFactor: "+drunkFactor);
}

void draw() {

  if (!manualMode) {
    getXY();
  } 
  else {
    if (mousePressed) {
      lineDensity = 5;
      X = mouseX+random(0.5, 2)*cos(radians(frameCount*drunkFactor%360));
      Y = mouseY+random(0.5, 2)*sin(radians(frameCount*drunkFactor%360));
    }
  }
  web();
  
  if (mousePressed) {   
   // println("Attraction threshold: "+attraction+" drunkFactor: "+drunkFactor+" dirX: "+dirX+" dirY: "+dirY+" X: "+X+" Y: "+Y); //uncomment for debug
  }
}

void getXY() {

  if ((X > 1 && X < width)) { 
    X += dirX+random(0.5, 2)*cos(radians(frameCount*drunkFactor%360));
    X = constrain(X, 0, width);
  } 
  else {
    dirX = -(dirX + (random(offset)-offset/2))%2;
    X += dirX+random(0.5, 2)*cos(radians(frameCount*drunkFactor%360));
    X = constrain(X, 0, width);
  }

  if (Y > 1 && Y < height) { 
    Y += dirY+random(0.5, 2)*sin(radians(frameCount*drunkFactor%360));
    Y = constrain(Y, 0, height);
  } 
  else {
    dirY = -(dirY + (random(offset)-offset/2))%2;
    Y += dirY+random(0.5, 2)*sin(radians(frameCount*drunkFactor%360));
    Y = constrain(Y, 0, height);
  }
}

void web() {
  for (int i = 0; i < history.size(); i=i+lineDensity) {
    PVector p = (PVector) history.get(i);
    float d = dist(X, Y, p.x, p.y);
    stroke(0, 0, 1+int(sq(11*cos(radians(i)))), d*4);
    if (d > 1) { 
      // this control is necessary to avoid 1/d with d<1 that would multiply the stroke size
      strokeWeight(1/d);
    }
    if (d < attraction) {
      if (random(10) < lineDensity)
      line(X, Y, p.x + 1, p.y + 1);
    }
  }
  history.add(new PVector(X, Y));
}

void reset() {
  background(0);
  history.clear();                 // emptying coordinates from arraylist
  drunkFactor = random(0.5, PI);   // and reassigning random value to basic variables 
  attraction = int(random(20, 50));
  println("Attraction threshold: "+attraction+" drunkFactor: "+drunkFactor); 
  
  if (manualMode) { 
    lineDensity = 5;
  } 
  else {
    lineDensity = 2;
  }
  redraw();
}

void keyReleased() {
  switch(key) {
  case 'm': // Manual mode
  case 'M':
    if (manualMode)
    {
      manualMode = false;
    }  
    else
    {
      manualMode = true;
    }
    reset();
    break;
  case 'r': // reset / redraw
  case 'R':
    reset();
    break;
  case 's': //save
  case 'S':
    println("Saved screenshot: Webs_####.png");
    saveFrame("Webs_####.png");
    break;
  }
}
