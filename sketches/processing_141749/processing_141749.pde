
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/139860*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/139848*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */

Critter[] critters;


void setup() {
  size (800, 800);
  colorMode(HSB, 360, 100, 100);
  critters = new Critter[0];
}

void draw() {
  background(267,18,30);
     for (int i=0; i<critters.length; i++) {
    //critters[i].move();
    critters[i].display();
  }
}

void mouseClicked() {
 
  Critter myCritter = new Critter(mouseX, mouseY);
  critters = (Critter[]) append(critters, myCritter);

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
  boolean up=true;
  boolean blink=true;
  boolean flashing=true;


  Critter(int centerX, int centerY) {
    cx=centerX;
    cy=centerY;
    lineY=centerY-25;
    lineLength=int(random(50, 60));
    howManySets=int(random(1, 3));
    speed=random(0.5, 2);
    angle=20;
    antennaCirc=5;
    eyeHeight=int(random(8, 15));
    critterSize=random(0.75, 1.25);
    critterRotate=random(-1, 1);
    colorDiff=endingHue-startingHue;
    randomNum= floor(random(colorDiff));
    randomHue= randomNum + startingHue;
    opacity=60;
  }



  void display() {
    pushMatrix();
   
   translate(cx, cy);
   scale(critterSize);
    rotate(critterRotate);
    translate(-cx,-cy);

 

    fill(randomHue, 72, 95);
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
      if(up) {
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
      if(blink) {
        opacity--;
      } else {
        opacity++;
      }

      if (opacity<=20) {
        blink=false;
      }

      if (opacity>=60) {
        blink=true;
      }
    
   
    noStroke();
    fill(randomHue, 72, 95,opacity);
    ellipse(cx,cy+30,100,105);
    ellipse(cx,cy+25,90,100);
    ellipse(cx,cy+25,80,100);
    ellipse(cx,cy+25,75,100);

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
     if(flashing) {
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

    fill(randomHue, 72, 95,98);
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
}
}





