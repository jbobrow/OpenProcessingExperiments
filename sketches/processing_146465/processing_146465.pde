
MrBat[] bats;
MrBat myMrBat;

Flashlight myFlashlight;

int howManyBatsTotal = 20;
int howManyBatsOnScreen = 0;


void setup() {
  frameRate (8);
  size(800, 600);
  background(0);
  smooth();

  bats = new MrBat[howManyBatsTotal];
  myFlashlight= new Flashlight(mouseX, mouseY);
}

void draw() {
  background(0);

  if (bats != null) {
    for (int i=0; i<howManyBatsOnScreen; i++) { //adds bats to the array
      // println(i);
      bats[i].display();
      bats[i].move();

   /*   if (myFlashlight.intersect(bats[i])) {
        bats[i].spooked();
      }*/
    }
    if (frameCount % 10==0 && howManyBatsOnScreen < howManyBatsTotal ) {

      howManyBatsOnScreen++;

      bats[howManyBatsOnScreen-1]=new MrBat(random(width), random(height));
      println("this many bats: " + howManyBatsOnScreen);
      println(bats[howManyBatsTotal-1]);
    }

  
   /* myFlashlight.display();*/
  }

  class MrBat {
    float bodyR;
    float bodyG;
    float bodyB;
    float opacity;
    float eyeR;
    float eyeG;
    float eyeB;
    float cx;
    float cy;
    float xSpeed;
    float ySpeed; 
    float mrbatSize;
    boolean wingUp;
    int wingRate;
    float r;


    MrBat(float centerX, float centerY) {
      cx=centerX;// center x of bat body
      cy=centerY;// center y of bat body 
      r= 40;
      bodyR=random(75, 100);
      bodyG=random(75, 100);
      bodyB=random(100, 150);
      eyeR=random(175, 230);
      eyeG=random(125, 175);
      eyeB=40;
      xSpeed= random(-6, 6); 
      if (xSpeed==0) {
        xSpeed=1;
      }
      ySpeed=random(-6, 6);
      if (ySpeed==0) {
        ySpeed=1;
      }
      opacity= random(200, 255);
      mrbatSize=random(0.75, 1.25);

      boolean wingUp=false;
      wingRate= int (random(10, 15));
    }


    void display() {
      pushMatrix();
      translate(cx, cy);
      scale(mrbatSize);
      translate(-cx, -cy);



      noStroke();
      fill(bodyR, bodyG, bodyB, opacity);
      //int wingRate = int(random(14,15));
      if (frameCount % wingRate ==0) {
        wingUp=!wingUp;
      }
      if (wingUp) {


        triangle(cx-10, cy, cx-35, cy-40, cx-80, cy-25); //main left wing up
        triangle(cx-55, cy-17, cx-80, cy-25, cx-86, cy-15);//sub left wing A up
        triangle(cx-36, cy-10, cx-58, cy-18, cx-63, cy-3);//sub left wing B up
        triangle(cx-10, cy, cx-36, cy-10, cx-45, cy);//sub left wing C up

        triangle(cx+10, cy, cx+35, cy-40, cx+80, cy-25); //main left wing up
        triangle(cx+55, cy-17, cx+80, cy-25, cx+86, cy-15);//sub left wing A up
        triangle(cx+36, cy-10, cx+58, cy-18, cx+63, cy-3);//sub left wing B up
        triangle(cx+10, cy, cx+36, cy-10, cx+45, cy);//sub left wing C up
      }
      else { // replace with regular wing coordinates

        triangle(cx+10, cy, cx+50, cy-30, cx+90, cy-10);// main right wing
        triangle(cx+90, cy-10, cx+90, cy, cx+62, cy-7); //sub right wing A
        triangle(cx+65, cy-7, cx+65, cy+10, cx+38, cy-4); //sub right wing B
        triangle(cx+39, cy-4, cx+45, cy+10, cx+15, cy-1); //sub right wing C
        triangle(cx-90, cy-10, cx-10, cy, cx-50, cy-30);// main left wing
        triangle(cx-90, cy-10, cx-90, cy, cx-62, cy-7); // sub left wing A
        triangle(cx-65, cy-7, cx-65, cy+10, cx-40, cy-4); // sub left wing B
        triangle(cx-39, cy-4, cx-45, cy+10, cx-15, cy-1); // sub left wing C
      }
      ellipseMode(CENTER); 
      noStroke();
      fill(bodyR, bodyG, bodyB, opacity);
      ellipse(cx, cy, r, r);
      triangle(cx-20, cy-5, cx-20, cy-30, cx-10, cy-15); // left ear
      triangle(cx+10, cy-15, cx+20, cy-30, cx+20, cy-5); // right ea
      fill(eyeR, eyeG, eyeB);
      ellipse(cx-10, cy, 10, 20); // left eye
      ellipse(cx+10, cy, 10, 20); // right eye

      fill(eyeR, eyeG, eyeB, 100); 
      ellipse(cx-10, cy, 15, 25); //eye glow 1
      ellipse(cx+10, cy, 15, 25);

      fill(eyeR, eyeG, eyeB, 75);
      ellipse(cx-10, cy, 20, 25); // eye glow 2
      ellipse(cx+10, cy, 20, 25);

      fill(eyeR, eyeG, eyeB, 50);
      ellipse(cx-10, cy, 30, 30); //eyeglow 3
      ellipse(cx+10, cy, 30, 30);

      popMatrix();
    }

    void move() {

      cy=cy+ySpeed;
      cx=cx+xSpeed;

      if (cx>width || cx<0) {
        xSpeed*=-1;
      }
      if (cy>height || cy<0) {
        ySpeed*=-1;
      }
    }

    void spooked() {
      cy=cy+ySpeed;
      cx=cx+xSpeed;
      println("spooked");
    }
  }

  class Flashlight {
    float cx;
    float cy;
    float r;
    float distance;

    Flashlight(float centerX, float centerY) {
      cx=centerX;
      cy=centerY;
      r=100;
      distance=dist(cx, cy, d.cx, d.cy);
    }

    void display() {
      noStroke();
      fill(255);

      ellipse(cx, cy, r, r);
    }

    boolean intersect(MrBat d) {
      if (distance < r + d.r) {
        return true;
      }

      else {
        return false;
      }
    }
  }
}



