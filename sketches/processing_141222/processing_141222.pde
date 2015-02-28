
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/139860*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/139848*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */

Critter myCritter;

void setup() {
  size (800, 800);
}

void draw() {
  background(50);
  if (myCritter != null) {
    myCritter.display();
    myCritter.move();
  }
}

void mouseClicked() {
  myCritter= new Critter(mouseX, mouseY);
}

class Critter {

  int cx;
  int cy;
  int howManySets;
  float spacing;
  int diameter;
  float lineLength;
  int lineY;
  int speed;
  int angle;
  int antennaCirc;
  int eyeHeight;


  Critter(int centerX, int centerY) {
    cx=centerX;
    cy=centerY;
    lineY=centerY-25;
    lineLength=int(random(50, 60));
    howManySets=int(random(1, 3));
    speed=int(random(0.5, 2));
    angle=20;
    antennaCirc=5;
    eyeHeight=15;
  }



  void display() {

    fill(232, 247, 67);
    stroke(165, 237, 210);
    line(cx, lineY, cx, lineY-lineLength);

    for (int i = 0; i < howManySets+1; i++) {

      spacing=lineLength/howManySets;
      diameter=5;

      ellipseMode(CENTER);

      line(cx, lineY-spacing*i, (cx+spacing/2+i)+1, (lineY-spacing*i)-angle);
      ellipse((cx+spacing/2+i)+1, (lineY-spacing*i)-angle, diameter, diameter);

      line(cx, lineY-spacing*i, (cx-spacing/2+i)-1, (lineY-spacing*i)-angle);
      ellipse((cx-spacing/2+i)-1, (lineY-spacing*i)-angle, diameter, diameter);


      angle=angle-0.25;
      if (angle<-10) {
        angle=20;
      }
    }


    noStroke();
    fill(32, 194, 201);

    ellipseMode(CENTER);
    //head
    ellipse(cx, cy, 72, 50);

    fill(32, 194, 201);
    //left curve
    bezier(cx-36, cy, cx-36, cy+50, cx-21, cy+72, cx, cy+72);
    //right curve
    bezier(cx+36, cy, cx+36, cy+50, cx+21, cy+72, cx, cy+72);

    fill(232, 247, 67);
    //eye
    ellipse(cx, cy-10, 15, eyeHeight);
    eyeHeight=eyeHeight-0.25;
    if(eyeHeight<0){
    eyeHeight=15;
    }


    fill(165, 237, 210);
    //triangle body
    triangle(cx, cy+72, cx-36, cy, cx+36, cy);

    fill(232, 247, 67);


    //antenna big circle
    ellipse(cx, cy-115, 10, 10);



    antennaCirc=antennaCirc+0.5;
    if (antennaCirc>15) {
      antennaCirc=5;
    }
    ellipse(cx, cy-140, antennaCirc, antennaCirc);

    fill(232, 247, 67, 90);
    ellipseMode(CORNER);
    //top left wing
    ellipse(cx-34, cy-5, -50, 10);
    //top right wing
    ellipse(cx+34, cy-5, 50, 10);

    fill(232, 247, 67, 90);
    //bottom left wing
    bezier(cx-33, cy, cx-45, cy+2, cx-70, cy+48, cx-48, cy+66);
    //bottom right wing
    bezier(cx+33, cy, cx+45, cy+2, cx+70, cy+48, cx+48, cy+66);
  }

  void move() {
    if (cy<height*1.5) {
      cy=cy-speed;
      lineY=lineY-speed;
      cx=cx+speed/2;
    }
  
    
  }
}



