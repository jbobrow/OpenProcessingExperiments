
Eye[] eyes = new Eye[15];// creates 15 eyes
PImage img;
PImage critter;//declare 1 image
//PImage bkg;

void setup() { 
  size(675, 863);
  
  //background(255);
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
  //background(img);//resets bkg with image
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
  /*int r;
  int g;
  int b;*/
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
  }

  void display(PImage images) {//accepting the Pimage
    for (int i = 0; i < howMany; i++) {
      /*stroke(0, opacity);
      //eyelashes
      line (cx, cy, cx - 40, cy - 25); //far left
      line (cx, cy, cx - 60, cy - 15);//left
      line (cx, cy, cx - 30, cy - 40);//middle left
      line (cx, cy, cx - 0, cy - 35); //middle
      line (cx, cy, cx + 30, cy - 40); //middle right
      line (cx, cy, cx + 60, cy - 35);//right
      line (cx, cy, cx + 65, cy - 10); //far right

      line (cx, cy, cx + 30, cy + 35); //far left
      line (cx, cy, cx + 60, cy + 25);//left
      line (cx, cy, cx + 30, cy + 20);//middle left
      line (cx, cy, cx + 0, cy + 35); //middle
      line (cx, cy, cx - 30, cy + 40); //middle right
      line (cx, cy, cx - 60, cy + 35);//right
      line (cx, cy, cx - 75, cy + 0); //far right

      //white of eye
      fill(100, 207, 250, opacity);
      noStroke();
      ellipse (cx, cy, 110, 75);
      //iris
      fill(20, 150, 170);
      ellipse(cx, cy, 80, 60);
      //pupil h
      fill(150, 50, 50);
      ellipse(cx, cy, 25, 45);
      //pupil v
      fill(150, 40, 40);
      ellipse(cx, cy, 45, 25);*/
      image(images,cx, cy);//displaying that image
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
    /*r=random(130, 180);
    g=random(50, 150);
    b=random(50, 150);*/
  }
}


