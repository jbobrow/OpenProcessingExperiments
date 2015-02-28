
//this script takes an image, divies it up, and makes ball art out of it

////////////////////////////////////////////////////////////////////////////



int w = 640;
int h = 640;
int divx = 42;
int divy = 42;
float[] grid = new float[w*h];
Ball[] lotsofBalls = new Ball[divx*divy];
int numBalls = divx*divy;
int bq = 0;

float[] imagePixel = new float[divx*divy]; //for image maker (the only part outside its area)


float ofx = 0;
float ofy = 0;

/////////////for TYPE/////
int keyed = 0;
String letter = " "+key;

color noiseColor;

float thisX = 100;
float thisY = 100;

//float offset = 0;
float noiseMultX = 20;
float noiseMultY = 20;




///////////////////////////////////////////////////////////////////////////////////

void setup() {
  String letter = ""+key;
  size (640, 640);

  for (int i = 0; i < divx; i++) {
    for (int j = 0; j < divy; j++) {
      int coord = (j*divx)+i;

      imagePixel[coord] = 0;
      lotsofBalls[coord] = new Ball(1, 2, 3, 4, 5, 6, lotsofBalls);
    }
  }
  fill(0, 0, 0, 255);
  rect(0, 0, width, height);
  frame.setResizable(true);
}

///////////////////////////////////////////////////////////////////////////////////



void draw() {
  smooth();
  //print(keyed);
  if (keyPressed == true) {
    keyed =1;
   
  }
  else {
    keyed=0;
  }

  if (keyed==1) {
    

    //-------------image maker-------------------//////////////////



    //  PImage myImage = loadImage("C:/projects/processing/skull.jpg", "jpg");
    //myImage.resize(width, height);
    //image(myImage, 0, 0);
    int q2 = 0;

    float[] pixelLoc = new float[divx*divy];

    pushStyle();
    fill(0, 0, 0, 255);
    rect(0, 0, width, height);
    fill(255);
    
    String letter = ""+key;
    //String letter = "ITP";
    texter(letter, width/3+width/12, height/4*3, 45, 45); //set the text size etc here
    //ellipse(width/2,height/2,100,100);
    popStyle();

    //load the pixels from the image and print the values as an array
    loadPixels();
    // updatePixels();


    for (int i = 0; i < divx; i++) {
      for (int j = 0; j < divy; j++) {
        int coord = (j*divx)+i;

        int thisi = width/divx;
        int thisj = height/divy;

        //this is sticking the value of the pixel into the proper place in the array
        imagePixel[coord] = map(pixels[i*thisi+((j*thisj)*width)], -1, -16777216, 1, 0);
        //  ellipse (i*thisi, j*thisj, imagePixel[i+(j*divx)]*20, imagePixel[i+(j*divx)]*20);
      }
    }
    //------------- end image maker-------------------//////////////////


    float b = 0;




    ///Balls declaration! ---- this part is super important, hence all the comments
    for (int i=0;i<divx;i++) {
      for (int j=0;j<divy;j++) {
        int coord = (j*divx)+i;

        //translate x, translate y, noise x, noise y, radius, id, array of the other balls

        //float mytx, float myty, float mynox, float mynoy, float myrad, int myid, Ball[] myothers
        lotsofBalls[coord] = new Ball(
        i*(w/divx)+ofx, //set the x and y position to the value of i and j (a grid) / divisions + the offset, this will just make a grid
        j*(h/divy)+ofy, 
        i+j*100, //these values are strictly to offset the noise and make different x and y values
        i+j+1000, 
        imagePixel[coord]*(w/divx)*random(.5, 1.5), //this scales the output by the value of the image
        //   imagePixel[j+(i*imx)]*(w/divx),
        coord, //gives the ball an id value
        lotsofBalls //this gives each instance a pointer to the array of all the other balls - I don't know how this works!
        );
        //  print(i+j*divx + "\n");
      }
    }
    // background(0);
    // updatePixels();
  }

  //background(0);

  pushStyle(); //this section fades the background
  fill(0, 0, 0, 150);
  rect(0, 0, width, height);
  popStyle();

  //  pushMatrix();  // this just applies an overall scale to reposition things
  //  scale(.92, .92);
  //  translate(35, 10);

  int q = 0;



  //this is very clever - it only draws the items that are larger than a certain size, making everything run much faster
  for (int i = 0;i<divx;i++) {
    for (int j = 0;j<divy;j++) {
      int coord = (j*divx)+i;

      if (imagePixel[i+(j*divx)]>.5) {
        lotsofBalls[coord].noisinator(noiseMultX, noiseMultY);//noiseMultX, noiseMultY);
        lotsofBalls[coord].collide();
        lotsofBalls[coord].move();
        lotsofBalls[coord].display(.01);// myb determines the speed of the noise
      }
    }
  }


  q=0;


  // these subtract the amount of noise every time, making it less and less noisy until it's not noisy at all
  if (noiseMultX>0) {
    noiseMultX=noiseMultX-1.31;
  }

  if (noiseMultY>0) {
    noiseMultY=noiseMultY-1.31;
  }
  keyed =1;
  //endRecord();
  // popMatrix();
}

///////////////////////////////////////////////////////////////////////////////////


void mouseClicked() { //this soups up the noise when you click the mouse
  noiseMultX = 100;
  noiseMultY = 100;
} 


///////////////////////////////////////////////////////////////////////////////////


class Ball {

  float tx, ty, nx, ny, rad, b, nox, noy, mouseNoisyX, mouseNoisyY, vx, vy, globalAngle;
  Ball[] others;
  int id = 0;


  //translate x, translate y, noise x, noise y, offset x, noy, radius
  Ball(float mytx, float myty, float mynox, float mynoy, float myrad, int myid, Ball[] myothers) {

    tx = mytx;
    ty = myty;
    rad = myrad;
    nox = mynox;
    noy = mynoy;
    b=0; //b is the offset multiplier of the noise - so "noise(b)" and is fed a value in 'display' (maybe not the best place?)
    others = myothers;
    id = myid;
  }

  void noisinator(float x, float y) {//this multiplies the amount of noise being applied

    //this part takes the distance from the mouse and makes it more noisy
    float distance = constrain((dist(mouseX, mouseY, tx, ty)), 1, 100);
    float mapDistance = map(distance, 1, 100, 150, 1);
    float mouseAmount = dist(mouseX, mouseY, pmouseX, pmouseY)/10;


    mouseNoisyX += mapDistance*mouseAmount/2;
    mouseNoisyY += mapDistance*mouseAmount/2;

    nx=x+mouseNoisyX;
    ny=y+mouseNoisyY;

    if (mouseNoisyX>0) {
      mouseNoisyX-=10;
      mouseNoisyY-=10;
    }
    if (mouseNoisyX<0) {
      mouseNoisyX=0;
      mouseNoisyY=0;
    }
  }


  void display(float myb) {

    float ntx = (noise(b+nox)-.5); //ntx - noise translate x - sets the value of the perlin noise + predefined offset - an overall offset
    float nty = (noise(b+noy)-.5);
    b+=myb; // myb determines the speed of the noise

    //   for (int i=0;i<5;i++) {
    //    noStroke();
    //    fill(255*q, 0, 0);
    pushMatrix();
    translate(tx+(nx*ntx), ty+(ny*nty));
    rotate ((dist(tx+(nx*ntx), ty+(ny*nty), 0, 0))/10);
   // ellipse(0,0,rad);
    thing(0, 0, rad, noise(id));
    popMatrix();
    // (q);
    //    q-=.2;
    //   }
  }

  void collide() {
    for (int i = id +1; i < numBalls; i++) {

      //defiing dx and dy for the first time, (distance x and y)
      // in this case (confusing) .x and .y is the others x subtract this x and y
      float dx = others[i].tx - tx;
      float dy = others[i].ty - ty;

      //this is a slightly more efficient way of doing "dist"
      float distance = sqrt(dx*dx + dy*dy);

      //the minimum distance is this diameter *s the others diameter
      float minDist = others[i].rad/2 + rad/2;

      if (distance < minDist) { 

        //ok... must get to understand a tan better - I guess this makes an angle from
        //two spots on the grid
        float angle = atan2(dy, dx);
        globalAngle = angle;

        //defining new float target x goes in the right direction
        float targetX = tx + cos(angle) * minDist;
        float targetY = ty + sin(angle) * minDist;

        //defining new float ax and ay as ... *.1 is the damping amount
        float ax = (targetX - others[i].tx)*.1;
        float ay = (targetY - others[i].ty)*.1;


        vx -= ax;
        vy -= ay;


        others[i].vx += ax;
        others[i].vy += ay;

        //  vx = 0;
        // vy = 0;
      }
    }
  }

  void move() {
    tx+=vx;
    ty+=vy;
    vx*=.9;
    vy*=.9;
    if (tx>width||tx<0) {
      tx=0;
    }
    if (ty>height||ty<0) {
      ty=0;
    }
  }
}


void texter(String mychar, float mytx, float myty, float mysx, float mysy) {
  //  PFont thisFont = loadFont("Courier New");
  // textFont(thisFont,12);
  textAlign(CENTER);
  String thischar =mychar;
  float tx = mytx;
  float ty = myty;
  float sx = mysx;
  float sy = mysy;
  pushMatrix();
  translate(tx, ty);
  scale(sx, sy);
  text(thischar, 0, 0);
  popMatrix();
}

//////////////////////////////////////////////////////////////////////////////
/////////////////////////////THING///////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

void thing(float mytx, float myty, float myrad, float myfill) {
  pushStyle();
  colorMode(HSB, 1, 1, 1);
  float filler = myfill;
  float tx = mytx;
  float ty = myty;
  float rad = myrad;
  strokeWeight(0);
  ellipse(tx, ty, rad, rad);
  float q=1;


  if (noise(rad)<.9) {
    for (int i=0;i<5;i++) { //fill in toward the center
      noStroke();
      // fill(255*q, 0, 0);
      fill(noise(filler*1000), filler, q);
      // ellipse(tx+(noise(q+filler)*filler*rad/2), ty+(noise(q+filler*filler)*filler*rad/2), rad, rad);
      ellipse(tx, ty, rad*q, rad*q);
      // print (noise(filler*1000));
      q-=.2;
    }
  }

  if (noise(rad)<.7) { //add some circles on selected items
    for (int i=0;i<7;i++) {

      fill(q/8, .8, 1);

      pushMatrix();
      translate(tx, ty);

      pushStyle();
      noFill();
      strokeWeight(1);
      stroke(1);
      ellipse(0, 0, rad/3, rad/3);
      popStyle();

      rotate(radians(i*60+(noise(filler)*1000)));
      translate(rad/3, 0);

      ellipse(0, 0, rad/6, rad/6);

      popMatrix();
      q++;
    }
  }
  if (noise(rad)>.5) { //add some circles on selected items   
    fill(q/8, .8, 1);    
    pushMatrix();
    translate(tx, ty);    
    pushStyle();
    noFill();
    strokeWeight(1);
    stroke(1);
    ellipse(0, 0, rad/3, rad/3);
    ellipse(0, 0, rad/2, rad/2);
    stroke(.5);
    ellipse(0, 0, rad*.7, rad*.7);
    stroke(.3);
    ellipse(0, 0, rad*.9, rad*.9);
    popStyle();
    popMatrix();
  }
  popStyle();
}


