
Eye[] eyes = new Eye[10];// creates 10 eyes

void setup() {
  size(600, 600);
  background(255);
  frameRate(15);
  smooth();
  for (int i=0; i < eyes.length; i++) {
    eyes[i] = new Eye(int (random(0, width)), int (random(0, height)));
    //^10 eyes in spots in the array
  }
}

void draw() {
  background(255);//resets bkg
  for (int i=0; i < eyes.length; i++) { 
    //^for loop to initialize array, 20 lines of codes to one line of code 
    //^telling to display/move
    eyes[i].display();//array, object, object function
    eyes[i].move();
    eyes[i].blink();

    for (int h=0; h<eyes.length; h++) {
      if (i != h) {
        if (eyes[i].intersect(eyes[h])) {
          eyes[i].hit();
          //eyes[i].hitBlink();
          println("eye[i] is intesecting with eye[h]");
        } // end if
      } // end if
    } //end inner for
  }// end of for
}//end of draw

class Eye { 
  int r;
  int g;
  int b;
  int cx;
  int cy;
  int howMany;
  float xSpeed;
  float ySpeed;
  float rad; //radius

  Eye(int centerX, int centerY) { 
    cx= centerX;
    cy= centerY;
    r= int(random(0, 180));
    g= int(random(0, 150));
    b= int(random(0, 150));
    howMany= int(random(5, 25));
    rad= 30;

    xSpeed= random(-8, 8);
    if (xSpeed==0) { //if hit 0
      xSpeed=1; //goes to 1
    } 
    ySpeed= random(-8, 8);
    if (ySpeed==0) {
      ySpeed=1;
    }
  }

  void display() {
    for (int i = 0; i < howMany; i++) {
      stroke(0); 
      //eyelashes
      line (cx, cy, cx - 75, cy - 10); //far left
      line (cx, cy, cx - 60, cy - 35);//left
      line (cx, cy, cx - 30, cy - 50);//middle left
      line (cx, cy, cx - 0, cy - 55); //middle
      line (cx, cy, cx + 30, cy - 50); //middle right
      line (cx, cy, cx + 60, cy - 35);//right
      line (cx, cy, cx + 75, cy - 10); //far right

      //white of eye
      fill(255);
      stroke(0);
      ellipse (cx, cy, 110, 80);
      //iris
      fill(r, g, b);
      ellipse(cx, cy, 80, 80);
      //pupil
      fill(0);
      ellipse(cx, cy, 50, 50);
    }
  }
  void move() {
    cx=cx+xSpeed;
    cy=cy+ySpeed;

    if (cx>width || cx<0) {
      xSpeed *= -1;
    }

    if (cy>height || cy<0) {
      ySpeed *= -1;
    }
  }//end move

  void blink() {
    if (cx>width || cx<0 || cy>height || cy<0) {
      //lashes
      line (cx, cy, cx + 75, cy + 10); //far left
      line (cx, cy, cx + 60, cy + 35);//left
      line (cx, cy, cx + 30, cy + 50);//middle left
      line (cx, cy, cx + 0, cy + 55); //middle
      line (cx, cy, cx - 30, cy + 50); //middle right
      line (cx, cy, cx - 60, cy + 35);//right
      line (cx, cy, cx - 75, cy + 10); //far right
      //eyelid
      fill(255);
      stroke(0);
      ellipse (cx, cy, 110, 80);
    }
  }
  boolean intersect(Eye b) {
    float distance = dist(cx, cy, b.cx, b.cy); //calculate dist
    if (distance < rad + b.rad) {
      return true;
    } 
    else {
      return false;
    }
  }

  void hit() {
    ySpeed= ySpeed *= -1;
    xSpeed= xSpeed *= -1;
     /*if (distance < rad + b.rad) {
     xSpeed *= -1;
     }
     
     if (distance < rad + b.rad) {
     ySpeed *= -1;
     }*/
  }

  /*void hitblink() {
   
      if (distance < rad + b.rad) {
        //lashes
        line (cx, cy, cx + 75, cy + 10); //far left
        line (cx, cy, cx + 60, cy + 35);//left
        line (cx, cy, cx + 30, cy + 50);//middle left
        line (cx, cy, cx + 0, cy + 55); //middle
        line (cx, cy, cx - 30, cy + 50); //middle right
        line (cx, cy, cx - 60, cy + 35);//right
        line (cx, cy, cx - 75, cy + 10); //far right
        //eyelid
        fill(255);
        stroke(0);
        ellipse (cx, cy, 110, 80);
      }//if
  }// hitblink*/
}//end of class



