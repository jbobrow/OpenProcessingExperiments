
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/141749*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/139860*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/139848*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */


Timer timer;
Critter[] critters= new Critter[500];
int totalCritters=0;


void setup() {
  size (800, 800);
  colorMode(HSB, 360, 100, 100);
}


void draw() {
  background(267, 18, 30);
  frameRate=10;

  critters[totalCritters]= new Critter(random(width), 810);
  if (frameCount % (10*10) == 0) { // every second add one to the critters
    totalCritters++;
  }

  if (totalCritters>=critters.length) {
    totalCritters=0;
  }

  /*for (int i=0; i<totalCritters; i++) {
   critters[i].move();
   //critters[i].display();
   critters[i].splat();
   }
   */

    for (int i=0; i<totalCritters; i++) {
      if (critters[i].squashIt) {
      critters[i].splat();
      }else{
      critters[i].move();
      critters[i].display();
    }
  }
}
//draw is where the if statement is

//"this"- built in function that refers to oneself
//boolean in class
//boolean if it is splatted, don't run move
//if it isnt splatted display and move

void mouseClicked() {
  for (int i=0; i<totalCritters; i++) {
    if (critters[i].squash()) {
      critters[i].squashIt=true;
      //println("critter# "+ i + " : " + critters[i].squashIt);
    }
  }
}








class Critter {

  int cx;
  int cy;
  int howManySets;
  float spacing;
  int diameter;
  int lineLength;
  int lineY;
  float speed;
  float angle;
  float antennaCirc;
  int eyeHeight;
  float critterSize;
  float critterRotate;
  int startingHue=20;
  int endingHue=80;
  int randomNum;
  int randomHue;
  int colorDiff;
  int opacity;
  boolean up;
  boolean blink;
  boolean flashing;
  boolean squashIt;



  Critter(int centerX, int centerY) {
    cx=centerX;
    cy=centerY;
    lineY=cy-25;
    lineLength=int(random(50, 60));
    howManySets=int(random(1, 3));
    speed=random(1, 3);
    angle=20;
    antennaCirc=5;
    eyeHeight=int(random(8, 15));
    critterSize=random(0.75, 1.25);
    critterRotate=random(-1, 1);
    colorDiff=endingHue-startingHue;
    randomNum= floor(random(colorDiff));
    randomHue= randomNum + startingHue;
    opacity=60;
    squashIt=false;
    flashing=true;
    blink=true;
    up=true;
  }



  void display() {
    pushMatrix();

    translate(cx, cy);
    scale(critterSize);
    rotate(critterRotate);
    translate(-cx, -cy);



    fill(randomHue, 72, 95);
    strokeWeight(1);
    stroke(randomHue+101, 237, 210);
    line(cx, lineY, cx, lineY-lineLength);

    for (int i = 0; i < howManySets+1; i++) {

      spacing=lineLength/howManySets;
      diameter=5;

      ellipseMode(CENTER);

      line(cx, lineY-spacing*i, (cx+spacing/2+i)+1, (lineY-spacing*i)-angle);
      ellipse((cx+spacing/2+i)+1, (lineY-spacing*i)-angle, diameter, diameter);

      line(cx, lineY-spacing*i, (cx-spacing/2+i)-1, (lineY-spacing*i)-angle);
      ellipse((cx-spacing/2+i)-1, (lineY-spacing*i)-angle, diameter, diameter);

      //to move the antennas up and down
      if (up) {
        angle=angle-0.25;
      } 
      else {
        angle=angle+0.25;
      }


      if (angle<=-10) {
        up=false;
      }

      if (angle>=20) {
        up=true;
      }
    }

    //////////////////////////////

    //to set the opacity of the glow
    if (blink) {
      opacity--;
    } 
    else {
      opacity++;
    }

    if (opacity<=20) {
      blink=false;
    }

    if (opacity>=60) {
      blink=true;
    }


    noStroke();
    fill(randomHue, 72, 95, opacity);
    ellipse(cx, cy+30, 100, 105);
    ellipse(cx, cy+25, 90, 100);
    ellipse(cx, cy+25, 80, 100);
    ellipse(cx, cy+25, 75, 100);

    noStroke();
    fill(randomHue+117, 83, 78);

    ellipseMode(CENTER);
    //head
    ellipse(cx, cy, 72, 50);

    fill(randomHue+117, 83, 78);
    //left curve
    bezier(cx-36, cy, cx-36, cy+50, cx-21, cy+72, cx, cy+72);
    //right curve
    bezier(cx+36, cy, cx+36, cy+50, cx+21, cy+72, cx, cy+72);

    fill(randomHue, 72, 95);
    //eye
    ellipse(cx, cy-10, eyeHeight, eyeHeight);


    fill(randomHue+93, 30, 92);
    //triangle body
    triangle(cx, cy+72, cx-36, cy, cx+36, cy);

    fill(randomHue, 72, 95);
    //antenna big circle
    ellipse(cx, cy-115, 10, 10);

    //for flashing antenna circle
    if (flashing) {
      antennaCirc=antennaCirc+0.25;
    } 
    else {
      antennaCirc=antennaCirc-0.25;
    }


    if (antennaCirc>=15) {
      flashing=false;
    }

    if (antennaCirc<=2) {
      flashing=true;
    }


    ellipse(cx, cy-140, antennaCirc, antennaCirc);

    fill(randomHue, 72, 95, 98);
    ellipseMode(CORNER);
    //top left wing
    ellipse(cx-34, cy-5, -50, 10);
    //top right wing
    ellipse(cx+34, cy-5, 50, 10);

    fill(randomHue, 72, 95);
    //bottom left wing
    bezier(cx-33, cy, cx-45, cy+2, cx-70, cy+48, cx-48, cy+66);
    //bottom right wing
    bezier(cx+33, cy, cx+45, cy+2, cx+70, cy+48, cx+48, cy+66);

    popMatrix();
  }

  void move() {
    if (cy>-100) {
      cy=cy-speed;
      lineY=lineY-speed;
    }
    else {
      cy=800;
      lineY=800;
    }


    if (cx < -100) {
      cx = width +100;
    } 
    else if (cx > width+100) {
      cx = -100;
    }

    if (critterRotate>=0) {
      cx=cx+speed;
    }
    else {
      cx=cx-speed;
    }
  }


  void splat() {
    noFill();
    stroke(randomHue, 72, 95, 95);
    strokeWeight(6);
    bezier(cx-12, cy-30, cx-24, cy-36, cx-8, cy-6, cx-18, cy+6);
    bezier(cx-18, cy+6, cx-20, cy+13, cx-45, cy+3, cx-48, cy+18);
    bezier(cx-48, cy+18, cx-53, cy+32, cx-36, cy+31, cx-23, cy+36);
    bezier(cx-23, cy+36, cx-8, cy+41, cx-30, cy+54, cx-12, cy+66);
    bezier(cx-12, cy+66, cx+6, cy+78, cx+8, cy+53, cx+18, cy+43);
    bezier(cx+18, cy+43, cx+30, cy+35, cx+40, cy+47, cx+50, cy+32);
    bezier(cx+50, cy+32, cx+56, cy+18, cx+31, cy+16, cx+25, cy+13);
    bezier(cx+25, cy+13, cx+18, cy+11, cx+24, cy, cx+30, cy-15);
    bezier(cx+30, cy-15, cx+33, cy-32, cx+23, cy-38, cx+20, cy-29);
    bezier(cx+20, cy-29, cx+10, cy-19, cx+3, cy, cx-3, cy-4);
    bezier(cx-3, cy-4, cx-8, cy-8, cx-1, cy-27, cx-12, cy-30);
  }

  boolean squash() {
    float distance=dist(mouseX, mouseY, cx, cy);
    if (distance<100) {
      return true;
    }
    else {
      return false;
    }
  }
}



