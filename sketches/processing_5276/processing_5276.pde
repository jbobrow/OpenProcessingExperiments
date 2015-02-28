
void setup() {
  size(320, 480);
  smooth();
  strokeCap(ROUND);

  // load images
  head = loadImage("head.png");
  wheel = loadImage("wheel.png");
  eye = loadImage("eye.png");
  cup2 = loadImage("cup3.png");
  bg = loadImage("kitchen7.png");
  bg2 = loadImage("kitchen2.png");
  ant = loadImage("antenna.png");

  // load shapes
  cup_ = loadShape("cup.svg");
  head_ = loadShape("head.svg");
  wheel_ = loadShape("wheel.svg");
  eye_ = loadShape("eye.svg");
}



boolean vector = false;

// images & shapes
PImage head;
PImage wheel;
PImage eye;
PImage cup1;
PImage cup2;
PImage bg;
PImage bg2;
PImage ant;
PShape cup_;
PShape head_;
PShape wheel_;
PShape eye_;

// variables
float w, targetW, easingW = 0.02;
float h, targetH, easingH = 0.03;
float e, targetE, easingE = 0.034;
float a, targetA, easingA = 0.027;
float s = 0.0, targetS, easingS = 0.01;
float l = 0.0;
int y = 338;


// button colors
color clear = color (200, 255, 255, 100);
color red = color (237, 34, 36);
color yellow = color (246, 235, 22); 
color purple = color (143, 80, 160); 
color green = color (113, 192, 91); 
color blue = color (69, 85, 165); 
color orange = color (249, 159, 27); 
color white = color (255); 
color magenta = color (206, 76, 140); 
color teal = color (68, 195, 211); 



void draw() {

  // variables & easing
  targetW = mouseX;
  w = w + ((targetW - w) * easingW);
  targetH = mouseX;
  h = h + ((targetH - h) * easingH);
  targetE = mouseX;
  e = e + ((targetE - e) * easingE);
  targetA = mouseX;
  a = a + ((targetA - a) * easingA);
  targetS = mouseX;
  s = targetS * easingS;



  if (vector == true) {
    
    // ROBOT BODY

    //// IMAGE
    
    background(255);
    image(bg, 0, 0);
    stroke(0);

    // NECK
    strokeWeight(18);
    stroke(186);
    line(h, 202, w, y);


    // HEAD
    image(head, h-72.5, 142); 


    // ANTENNA
    image(ant, h+23, 90); 


    // EYES
    image(eye, e-51.5, 210.5); 
    image(eye, e+35.5, 210.5);


    // CUP HOLDER
    noStroke();
    fill(55);
    ellipse(h, 157, 40, 14);

    fill(30);
    beginShape();
    vertex(h-12, 162);
    bezierVertex(h-8, 160, h+3, 157, h+13, 162);
    bezierVertex(h+3, 165, h-10, 163, h-12, 162);
    endShape();

    noStroke();
    fill(255, 50);
    beginShape();
    vertex(h-19, 128);
    bezierVertex(h-19, 128, h-8, 124, h-1, 125);
    bezierVertex(h+6, 126, h+8, 128, h+12, 126);
    bezierVertex(h+16, 125, h+20, 126, h+19, 128);
    bezierVertex(h+19, 128, h+14, 162, h+14, 162);
    bezierVertex(h+10, 163, h-5, 164, h-14, 162);
    bezierVertex(h-14, 162, h-19, 128, h-19, 128);
    endShape();
    
    
    // CUP
    image(cup2, h-23, 109); 


    // DRINK
    stroke(0);
    strokeWeight(1);

    fill(clear);
    noStroke();
    beginShape();
    vertex(h-19, 128);
    bezierVertex(h-19, 128, h-8, 124, h-1, 125);
    bezierVertex(h+6, 126, h+8, 128, h+12, 126);
    bezierVertex(h+16, 125, h+20, 126, h+19, 128);
    bezierVertex(h+19, 128, h+14, 162, h+14, 162);
    bezierVertex(h+10, 163, h-5, 164, h-14, 162);
    bezierVertex(h-14, 162, h-19, 128, h-19, 128);
    endShape();

    beginShape();
    vertex(h-19, 128);
    bezierVertex(h-19, 128, h-8, 124, h-1, 125);
    bezierVertex(h+6, 126, h+8, 128, h+12, 126);
    bezierVertex(h+16, 125, h+20, 126, h+19, 128);
    bezierVertex(h+19, 128, h+20, 131, h+12, 131);
    bezierVertex(h+4, 131, h-1, 130, h-7, 132);
    bezierVertex(h-14, 134, h-19, 128, h-19, 128);
    endShape();
    stroke(0);


    // BUTTONS
    noStroke();
    fill(red);
    rect(e-12, 221, 7, 7);

    fill(yellow);
    rect(e-3, 221, 7, 7);

    fill(purple);
    rect(e+6, 221, 7, 7);

    fill(green);
    rect(e-12, 230, 7, 7);

    fill(blue);
    rect(e-3, 230, 7, 7);

    fill(orange);
    rect(e+6, 230, 7, 7);

    fill(white);
    rect(e-12, 239, 7, 7);

    fill(magenta);
    rect(e-3, 239, 7, 7);

    fill(teal);
    rect(e+6, 239, 7, 7);


    // WHEEL 
    translate(w, y);
    rotate(s);
    image(wheel, -48.5, -48.5); 
  } 
  
  else {

    //// SHAPE

    background(255);
    image(bg2, 0, 0);
    stroke(0);

    // NECK
    strokeWeight(14);
    stroke(80);
    line(h, 202, w, y);
    strokeWeight(4);
    stroke(0);
    line(h+7, 202, w+7, y);
    line(h-7, 202, w-7, y);


    // HEAD
    shape(head_, h-72.5, 142); 


    // ANTENNA
    strokeWeight(5);
    line(a+42, 100, h+27, 161);

    strokeWeight(2);
    fill(237, 28, 36);
    ellipse(a+42, 100, 10, 10);


    // EYES
    shape(eye_, e-51.5, 210.5); 
    shape(eye_, e+35.5, 210.5);
    
    
    // CUP
    shape(cup_, h-24.5, 107); 


    // DRINK
    stroke(0);
    strokeWeight(1);

    fill(clear);
    noStroke();
    beginShape();
    vertex(h-19, 128);
    bezierVertex(h-19, 128, h-8, 124, h-1, 125);
    bezierVertex(h+6, 126, h+8, 128, h+12, 126);
    bezierVertex(h+16, 125, h+20, 126, h+19, 128);
    bezierVertex(h+19, 128, h+14, 162, h+14, 162);
    bezierVertex(h+10, 163, h-5, 164, h-14, 162);
    bezierVertex(h-14, 162, h-19, 128, h-19, 128);
    endShape();

    beginShape();
    vertex(h-19, 128);
    bezierVertex(h-19, 128, h-8, 124, h-1, 125);
    bezierVertex(h+6, 126, h+8, 128, h+12, 126);
    bezierVertex(h+16, 125, h+20, 126, h+19, 128);
    bezierVertex(h+19, 128, h+20, 131, h+12, 131);
    bezierVertex(h+4, 131, h-1, 130, h-7, 132);
    bezierVertex(h-14, 134, h-19, 128, h-19, 128);
    endShape();
    stroke(0);
    
    line(h-21.5, 114, h-14.5, 161);
    line(h+20.5, 114, h+13.5, 161);


    // BUTTONS
    fill(red);
    rect(e-12, 221, 7, 7);

    fill(yellow);
    rect(e-3, 221, 7, 7);

    fill(purple);
    rect(e+6, 221, 7, 7);

    fill(green);
    rect(e-12, 230, 7, 7);

    fill(blue);
    rect(e-3, 230, 7, 7);

    fill(orange);
    rect(e+6, 230, 7, 7);

    fill(white);
    rect(e-12, 239, 7, 7);

    fill(magenta);
    rect(e-3, 239, 7, 7);

    fill(teal);
    rect(e+6, 239, 7, 7);


    // WHEEL
    translate(w, y);
    rotate(s);
    shape(wheel_, -48.5, -48.5); 
    
  }
}



// DRINK CHANGE

  // TOP ROW
 void keyPressed() {
  if (key == '1' || key =='r') {
    clear = color (237, 34, 36, 100); 
  }
  else if (key == '2' || key =='y') {
    clear = color (246, 235, 22, 100); 
  } 
  else if (key == '3' || key =='p') {
    clear = color (143, 80, 160, 100); 
  } 

  // MIDDLE ROW
  else if (key == '4' || key =='g') {
    clear = color (113, 192, 91, 100); 
  }
  else if (key == '5' || key =='b') {
    clear = color (69, 85, 165, 100); 
  }
  else if (key == '6' || key =='o') {
    clear = color (249, 159, 27, 100); 
  }

  // BOTTOM ROW
  else if (key == '7' || key =='w') {
    clear = color (255, 100); 
  }
  else if (key == '8' || key =='m') {
    clear = color (206, 76, 140, 100); 
  }
  else if (key == '9' || key =='t') {
    clear = color (68, 195, 211, 100); 
  } 
  else if (key == '0') {
    clear = color (200, 255, 255, 100);
  } 
  else if (key == ' ') {
    if (vector == true) {
      vector = false; 
  } 
  else {
    vector = true; 
  }
    //vector = !vector;  // This line is the same as the five above
  }
}


