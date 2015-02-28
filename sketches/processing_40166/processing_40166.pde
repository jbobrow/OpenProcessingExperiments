
//Faysal Itani
//Creation and Computation
//Assignment #3


//Setting the variables

float backR;
float backG;
float backB;

float speed = 5;
float gravity = 0.1;  
float spX = 269;
float spY = 305;
float sp1X = 330;

float eyeX = 80;
float eye1X = 120;

int mX = 70;
int mY = 130;

int carX = 100;
int carY = 275;

int circleX = 20;
int circle2X = 15;
int circle3X = 10;
int circle4X = 5;

int spotX = 269;
int spotY = 110;
int spot2X = 330;

int gr = 305;
int gr1 = 300;
int dir = 10;
int or1 = 285;

int x = 100;
int y = 100;

int [] xp = new int [30];
int [] yp = new int [30];

void setup() {
  size(400, 400);
  frameRate(30);
  smooth();
  
}

void draw() {
  background(255);
  ellipseMode(CENTER);
  rectMode(CENTER);
  
    
//Random Colors
  backR = random(255);
  backG = random(255);
  backB = random(255);

//Colored Squares (backgrounds)

//red square
  noStroke();
  fill (210, 14, 2);
  rect(100, 100, 200, 200);
  
//blue square
  noStroke();
  fill (0, 120, 214);
  rect(300, 100, 200, 200);
  
//green square
  noStroke();
  fill (111, 166, 44);
  rect(100, 300, 200, 200);
  
//orange square
  noStroke();
  fill (240, 135, 8);
  rect(300, 300, 200, 200);

//mouse over squares

  //mouse over red square
    if (mouseX < 200 && mouseY < 200) {
      fill(backR, backG, backB);
      rect(100, 100, 200, 200);
    } 
  
  //mouse over blue square  
    else if (mouseX > 200 && mouseY < 200) {
    
      if (circleX < dir) {
        circleX = circleX + 30;
    }
    
      if (circleX > dir) {
        circleX = circleX -30;
    }
    
      if (circle2X < dir) {
        circle2X = circle2X + 30;
    }
    
      if (circle2X > dir) {
        circle2X = circle2X -30;
    }
    
      if (circle3X < dir) {
        circle3X = circle3X + 30;
    }
    
      if (circle3X > dir) {
        circle3X = circle3X -30;
    }
    
      if (circle4X < dir) {
        circle4X = circle4X + 30;
    }
    
      if (circle4X > dir) {
        circle4X = circle4X -30;
    }
      circleX = circleX + dir;
      circle2X = circle2X + dir;
      circle3X = circle3X + dir;
      circle4X = circle4X + dir;
    }
  
  //mouse over green square  
    else if (mouseX < 200 && mouseY > 200) { 
      carX = carX -2;
      eyeX = eyeX -1;
      eye1X = eye1X -1.5;
      mX = mX -1;
      mY = mY -1;
      gr = gr + 4;
  } 
  
  //mouse over orange square  
    else if (mouseX > 200 && mouseY > 200) {
      fill(255);
      rect(300, 300, 200, 200);
    
      speed = speed + gravity;
      spY = spY + speed;
    
      if (spY > height) {
        speed = speed * -0.95;  
    }
  }
  
  face(300,300,349,300,250,300,300,300);// orange face
  face(100,gr1,150,gr1,50,gr1,100,gr1); //green face
  face(300,100,349,100,250,100,300,105);//blue face
  face(100,100,50,100,150,100,100,100); //red face
  redHead();
  bluehead();
  greenhead();
  orangehead();
  
   for (int i = 0 ;i < xp.length -1; i++) {
    xp[i] = xp[i+1];
    yp[i] = yp[i+1];
  }
  
  xp [xp.length-1] = mouseX;
  yp [yp.length-1] = mouseY;
  for (int i = 0; i< xp.length; i ++) {
  floater(xp[i],yp[i], i*0.03); }


}
  void floater (int x,int y, float s) {
  pushMatrix ();
  translate (x,y);
  scale (s);
  fill (237,204,14,150);
  ellipse (0,0,50,50);
  popMatrix ();
 }

void redHead() {  
//red head
   strokeWeight (1);
   stroke (0);
   fill(255);

  //red eyes and smile
    line(70, 80, 130, 80);
    arc(100, 106, 55, 55, PI/2, PI);

  //red spots
    noStroke ();
    fill (210, 14, 2);
    ellipse (70, 110, 10, 10);

    noStroke ();
    fill (210, 14, 2);
    ellipse (130, 110, 10, 10);
   
}


void bluehead () {
//blue head
    stroke (0);
    fill(255);

  //blue smile
    noFill();
    arc(300, 106, 55, 55, PI/10, PI);

  //blue eyes
    ellipse (280, 90, circleX, circleX);
    ellipse (320, 90, circleX, circleX);

    ellipse (280, 90, circle2X, circle2X);
    ellipse (320, 90, circle2X, circle2X);

    ellipse (280, 90, circle3X, circle3X);
    ellipse (320, 90, circle3X, circle3X);

    ellipse (280, 90, circle4X, circle4X);
    ellipse (320, 90, circle4X, circle4X);


  // blue Spots
    noStroke ();
    fill (0, 120, 214);
    ellipse (spotX, spotY, 10, 10);

    noStroke ();
    fill (0, 120, 214);
    ellipse (spot2X, spotY, 10, 10);
}

void greenhead() {
//green head
    stroke (0);
    fill(255);
    
  //green smile
    line(mX, 325, mY, 325);

  //green eyes
    fill(255);
    rect(carX, carY, 60, 20);

    fill (255);
    ellipse (eyeX, 285, 20, 20);
    ellipse (eye1X, 285, 20, 20);


  //green spots
    noStroke ();
    fill (111, 166, 44);
    ellipse (70, gr, 10, 10);

    noStroke ();
    fill (111, 166, 44);
    ellipse (130, gr, 10, 10);
}

void orangehead() {
//orange head

  //orange smile
    stroke (0);
    fill(255);
    ellipse (300, 320, 20, 20);

  //orange eyes
    fill (255);
    ellipse (280, 285, 20, 20);
    ellipse (320, 285, 20, 20);

    fill (0);
    ellipse (280, or1, 5, 5);
    ellipse (320, or1, 5, 5);

  //orange Spots
    noStroke ();
    fill (240, 135, 8);
    ellipse (sp1X, spY, 10, 10);

    noStroke ();
    fill (240, 135, 8);
    ellipse (spX, spY , 10, 10);
  
}

 void face (int x, int y, int x1, int y1, int x2, int y2, int e1, int e2) {
   
   //ears   
      strokeWeight (2);
      stroke(0);
      fill (255);
      ellipse(x1, y1, 20, 20);
      
      stroke(0);
      fill (255);
      ellipse(x2, y2, 20, 20);
      
   //face
      strokeWeight (2);
      fill (255);
      ellipse (x, y, 100, 100);
      
  //nose
    fill (0);
    ellipse(e1,e2, 10, 5);
  
    }


//mouse pressed on green face
  void mousePressed() {
    if (mouseX < 200 && mouseY > 200) {
      gr1 = gr1 +50;
}
}



