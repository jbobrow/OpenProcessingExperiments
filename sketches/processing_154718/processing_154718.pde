
/*
 * Creative Coding
 * Week 6, excercise
 * my variation: Michal Huller
 */

float ratio = sqrt(5);  // size ratio of circles
int division = 5; // number of circles inside each circle
int totLevels = 4;
color bg;
boolean saveF = false;
int stt = 60;

void setup() {
  size(460, 460);
  noStroke();
  colorMode(HSB, 360, 100, 100);
  bg = color(320, 80, 10);
  background(bg);
}

void draw() {
  pushStyle();
  fill(bg, 18);
  rect(0, 0, width, height);
  popStyle();
  translate(width/2, height/2); // move to the middle of the screen
  drawCircle(height/2, totLevels); // draw the recursive circle
  if (saveF && frameCount < 60 && frameCount %2 == 0) saveFrame("anim2/rc####.gif");
}

/*
 * drawCircle
 * recursive function that draws a circle
 * then draws 'division' circles inside that circle
 *
 */
void drawCircle(float radius, int level) {                   
  float tt = (stt + 200 * level/(totLevels - 2))% 360;
  float wi = (totLevels - 1)*level/2;
  stroke(tt, 90, 90, 200);
  //stroke(tt,20,tt, 200);
  strokeWeight(pow(wi/2, 2));

  // draw the circle
  if (level < totLevels - 1)
    line(0, 0, radius*2, radius*2);
  wi *= 2;
  fill (int(tt+180)% 360, 100, 100, 180);
  strokeWeight(wi/2);
  ellipse(0, 0, wi, wi);
  ellipse(radius*2, radius*2, wi, wi);
  //ellipse(0, 0, radius*2, radius*2);     
  if (level > 1) {
    level = level - 1;

    // draw the inner circles
    for (int i = 0; i < division; ++i) { 
      pushMatrix();
      float mult = (level % 2 == 1) ? -1 : 1;
      rotate(mult * frameCount / (20.0 * level) + TWO_PI/division * i);
      translate(radius - radius/ratio, 0);
      drawCircle(radius/ratio, level);
      popMatrix();
    }
  }
}

void mouseReleased() {
  stt = int(random(360));
}

void keyPressed() {
  if (key == 'p' || key == 'P')
    saveFrame ("snapshots/str######.png");
    
  if (key == 'd' || key == 'D') {
    division = int(random(3,8));
    ratio = sqrt(division);
  }
  
}


