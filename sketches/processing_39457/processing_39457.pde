
//Zena Koo
//Intro to Computational Media - F11
//ITP, NYU
//Week 3 assignment //September 26, 2011


int x=200;
int y=150;
int radius=50;
int mid=250;
int w=30;
int h=69;

void setup() {
  size(500, 500);
  smooth();
  background(#1E7BD6); //skin pigment wwblue
}
void draw() {
  background(#1E7BD6);
  ellipseMode(RADIUS);

  //eyes
  fill(255);
  stroke(9);
  ellipse(x, y, radius, radius); //left eye outer
  ellipse(x+100, y, radius, radius); //right eye outer
  fill(0, 0, 255); //blue pupil
  strokeWeight(2);
  ellipse(x, y, radius/3, radius/3); //pupil left
  ellipse(x+100, y, radius/3, radius/3); //pupil right

  //nose
  fill(#B41680); //magenta-ish color of nose
  stroke(0);
  ellipse(mid, mid, w, h);

  //mouth
  fill(#DE7DD7);
  stroke(15, #DE7DD7);
  arc(x+30, 310, 80, 95, QUARTER_PI, PI+QUARTER_PI);
  strokeWeight(2);

  //if 

  if (keyPressed) {
    background(#1E7BD6); //resets the background

    if ((key == 'w') || (key == 'W')) { //w for wink

      fill(255);
      strokeWeight(2);
      stroke (0);
      ellipse(x+100, y, radius, radius); //right eye outer
      fill(16, 111, 19); //pupil turns green
      strokeWeight(2);
      stroke(0);
      ellipse(x+100, y, radius/3, radius/3); //pupil right

      strokeWeight(11);
      stroke(#626393); // slate grey/blue eyelid color
      line(x-60, y, x+40, y);   //the winking eye, left
      strokeWeight(2);
      //nose
      fill(#B41680); //magenta-ish color of nose
      stroke(0);
      ellipse(mid, mid, w, h);
      strokeWeight(2);

      //mouth
      fill(#DE7DD7);
      stroke(15, #DE7DD7); //pink mouth color
      arc(x+30, 310, 80, 95, QUARTER_PI, PI+QUARTER_PI);        

      strokeWeight(9);
    }
  }
  if (keyPressed) {

    if ((key == 'b') || (key == 'B')) { //b for blink
      strokeWeight(11);  //line thickness
      stroke(#626393); // slate grey/blue eyelid color
      line(x-60, y, x+40, y);     //the blinking eyes left
      line(x+70, y, x+170, y);   //the blinking eyes right
      strokeWeight(2);

      //nose
      fill(#B41680); //magenta-ish color of nose
      stroke(0);
      ellipse(mid, mid, w, h);

      //mouth
      fill(#DE7DD7);
      stroke(15, #DE7DD7);
      arc(x+30, 310, 80, 95, QUARTER_PI, PI+QUARTER_PI);        

      strokeWeight(9);
    }
  }

  if (mousePressed) {
    //nose
    fill(random(1, 255)); 
    strokeWeight(2);
    stroke(0);
    ellipse(mid, mid, w, h);
  }
}

/*
     fill(255);
 ellipse(x, y, radius, radius); //left eye outer
 ellipse(x+100, y, radius, radius); //right eye outer
 fill(0,0,255); //blue pupil
 ellipse(x, y, radius/3, radius/3); //pupil left
 ellipse(x+100, y, radius/3, radius/3); //pupil right
 */

