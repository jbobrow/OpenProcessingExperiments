

float theColor = 0;
float theOtherColor = 0;
float h = 0;
float qwer = 0;
float rot = 0;

void setup () {
  size(600,600);
  background(0);
  stroke(0);
  fill(255, 10);
  smooth ();
  colorMode (HSB);
  frameRate (18);
}





void draw () {



  
  
  translate (width/2, height/2);
  //for (int i = 0; i<64; i++) {
  // rotate (PI/2 + 1/2);

  int diam = (int) random (10, 100);


  stroke(0);

  stroke ( theOtherColor, 99, 99);
  noFill ();
  ellipse (random (-150, 150), random (-150, 150), diam, diam);
  stroke (theColor, 99, 99);
  ellipse (random (-70, 70), random (-70, 70), diam - 69, diam - 69);

  //theColor = theColor + .2;
  theOtherColor = theOtherColor - .2;

  if (theOtherColor <= 0) {

    theOtherColor = 359;
  }

  if ( theColor >= 359) {

    theColor = 0;
  }
  //}
  copy(5, 5, width -10, height -10, 0, 0, width, height);
  
    for (int i=0; i<8; i++) {
    rotate (PI/4);
    noStroke ();
    fill (h, h+3, 255, 1);
    ellipse (125, 0, qwer, qwer);
    h = h+.3;
    qwer = qwer + .5;
    
  }
  if (h >= 255) {
    h = 0;
  }
  if (qwer >= 250){
   qwer = 0; 
  }
  
 
  
}


