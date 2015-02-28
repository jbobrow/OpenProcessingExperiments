
Eye[] eyes = new Eye[15];// creates 15 eyes
PImage img;
PImage critter;//declare 1 image
//PImage bkg;

void setup() { 
  size(600, 805);
  frameRate(15);
  smooth();
  bkg= loadImage("bkg.png");
  critter= loadImage("critter.png");//load one image
  for (int i=0; i < eyes.length; i++) {
    eyes[i] = new Eye(int (random(0, width)), int (random(0, height)));
    //^15 eyes in spots in the array
  }
}

void draw() {
  image(bkg,0,0);
  for (int i=0; i < eyes.length; i++) {
    //^for loop to initialize array, 20 lines of codes to one line of code
    //^telling to display/move
    eyes[i].display(critter);//array, object, object function, passes image into object
    eyes[i].move();

    for (int h=0; h<eyes.length; h++) {
      if (i != h) {
        if (eyes[i].intersect(eyes[h])) {
          eyes[i].hit();
          //eyes[i].colorChange();
          println("eye[i] is intesecting with eye[h]");
        } // end if
      } // end if
    } //end inner for
  }// end of for
}//end of draw

class Eye {
  float cx;
  float cy;
  int howMany;
  float xSpeed;
  float ySpeed;
  float rad; //radius
  //float opacity;
  //float opacLines;
  //float changeColor;
  

  Eye(int centerX, int centerY) {
    cx= centerX;
    cy= centerY;
    /*r= int(random(50, 180));
    g= int(random(0, 50));
    b= int(random(0, 50));*/
    howMany= int(random(5, 25));
    rad= 70;
    //opacity= 30;

    xSpeed= random(-8, 8);
    if (xSpeed==0) { //if hit 0
      xSpeed=1; //goes to 1
    }
    ySpeed= random(-8, 8);
    if (ySpeed==0) {
      ySpeed=1;
    }
  }//end eye

  void display(PImage images) {//accepting the Pimage
    for (int i = 0; i < howMany; i++) {
      image(images,cx, cy);//displaying that image
    }
  }//end display
  
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

  boolean intersect(Eye b) {
    float distance = dist(cx, cy, b.cx, b.cy); //calculate dist
    if (distance < rad + b.rad) {
      return true;
    }
    else {
      return false;
    }
  }//end boolean

  void hit() {
    ySpeed= ySpeed *= -1;
    xSpeed= xSpeed *= -1;
  }//end hit
}


