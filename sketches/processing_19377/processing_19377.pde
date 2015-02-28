
/* Project 2: Respond for DMA 28 Winter 11 by Faustine Chia */


// declare local variables
PImage openEyes;
PImage squint1;
PImage squint2;
PImage squint3;
PImage squint4;
PImage squint5;
PImage closedEyes;

float x = 0.0;
float y = 0.0;
float easing = 0.05;
float xNudge =0;
float yNudge =0;

float rD, lD, sD;
float rA, lA;
float lX, lY;
float rX, rY;


float counter = 0;



void setup() {

  size(640,480);
  fill(0,102);
  smooth();
  noStroke();
  background(240, 233, 37);
  // frameRate(20);

  openEyes = loadImage ("eyes_test_black2.png"); 
  squint1 = loadImage ("eyes_squint_1.png"); 
  squint2 = loadImage ("eyes_squint_2.png"); 
  squint3 = loadImage ("eyes_squint_3.png"); 
  squint4 = loadImage ("eyes_squint_4.png");
  squint5 = loadImage ("eyes_squint_5.png"); 
  closedEyes = loadImage ("eyes_closed.png"); 

  lX= width/2-80;
  lY= height/2-15;
  rX= width/2+130;
  rY= height/2-15;
  
}





void draw() {

  float speed = dist(mouseX, mouseY, pmouseX, pmouseY); 

  float targetX = mouseX;
  float targetY = mouseY;
  x += (targetX - x) * easing;
  y += (targetY - y) * easing;



  if (mousePressed==false) {
    counter=0;
  }

  if (mousePressed==true) {
    counter+=0.15;
    // red bg
    background(255, 0, 0);
    // closed eyes 
    //    image (closedEyes, width/2-200, height/2-75);
    //    image (closedEyes, width/2-200 + random(-counter, counter), height/2-75 + random(-counter, counter));
    xNudge = random(-(8+counter), (8+counter));
    yNudge = random(-(8+counter), (8+counter));
    image (closedEyes, width/2-200 + xNudge, height/2-75 + yNudge);
  }

  else if (speed > 50 && speed < 100) {
    // yellow bg
    background(240, 233, 37);
    // squint ver 1 
    image (squint1, width/2-200, height/2-75);
    // black pupils
    //      fill(0);
    //      ellipse(width/2+43, height/2-15, 50,50); // right
    //      ellipse(width/2-20, height/2-15, 50,50); // left
    fill (0); 
    // left pupil 
    lD= dist(mouseX,mouseY,width/2-80,height/2-15);
    lD= constrain(lD,0,50);
    lA=atan2(mouseY-(height/2-15),mouseX-(width/2-80));

    float newlX=(width/2-80) + cos(lA)*lD;
    float newlY= (height/2-15) + sin(lA)*lD/2;
    lX += (newlX-lX) * 0.5;
    lY += (newlY-lY) * 0.5;
    ellipse(lX,lY,50,50);

    // right pupil 
    rD= dist(mouseX,mouseY,width/2+110,height/2-15);
    rD= constrain(rD,0,50);
    rA=atan2(mouseY-(height/2-15),mouseX-(width/2+110));

    float newrX= (width/2+110) + cos(rA)*rD;
    float newrY= (height/2-15) + sin(rA)*rD/2;
    rX += (newrX-rX) * 0.5;
    rY += (newrY-rY) * 0.5;
    ellipse(rX,rY,50,50);
  } 

  else if (speed > 100 && speed < 150) {
    // yellow bg
    background(240, 233, 37);
    // squint ver 2 
    image (squint2, width/2-200, height/2-75);
    // black pupils
    //      fill(0);
    //      ellipse(width/2+43, height/2-15, 50,50); // right
    //      ellipse(width/2-20, height/2-15, 50,50); // left
    fill (0); 
    // left pupil 
    lD= dist(mouseX,mouseY,width/2-80,height/2-15);
    lD= constrain(lD,0,50);
    lA=atan2(mouseY-(height/2-15),mouseX-(width/2-80));

    float newlX=(width/2-80) + cos(lA)*lD;
    float newlY= (height/2-15) + sin(lA)*lD/2;
    lX += (newlX-lX) * 0.5;
    lY += (newlY-lY) * 0.5;
    ellipse(lX,lY,50,50);

    // right pupil 
    rD= dist(mouseX,mouseY,width/2+110,height/2-15);
    rD= constrain(rD,0,50);
    rA=atan2(mouseY-(height/2-15),mouseX-(width/2+110));

    float newrX= (width/2+110) + cos(rA)*rD;
    float newrY= (height/2-15) + sin(rA)*rD/2;
    rX += (newrX-rX) * 0.5;
    rY += (newrY-rY) * 0.5;
    ellipse(rX,rY,50,50);
  } 

  else if (speed > 150 && speed < 200) {
    // yellow bg
    background(240, 233, 37);
    // squint ver 3 
    image (squint3, width/2-200, height/2-75);
    // black pupils
    //      fill(0);
    //      ellipse(width/2+43, height/2-15, 50,50); // right
    //      ellipse(width/2-20, height/2-15, 50,50); // left
    fill (0); 
    // left pupil 
    lD= dist(mouseX,mouseY,width/2-80,height/2-15);
    lD= constrain(lD,0,50);
    lA=atan2(mouseY-(height/2-15),mouseX-(width/2-80));

    float newlX=(width/2-80) + cos(lA)*lD;
    float newlY= (height/2-15) + sin(lA)*lD/2;
    lX += (newlX-lX) * 0.5;
    lY += (newlY-lY) * 0.5;
    ellipse(lX,lY,50,50);

    // right pupil 
    rD= dist(mouseX,mouseY,width/2+110,height/2-15);
    rD= constrain(rD,0,50);
    rA=atan2(mouseY-(height/2-15),mouseX-(width/2+110));

    float newrX= (width/2+110) + cos(rA)*rD;
    float newrY= (height/2-15) + sin(rA)*rD/2;
    rX += (newrX-rX) * 0.5;
    rY += (newrY-rY) * 0.5;
    ellipse(rX,rY,50,50);
  } 

  else if (speed > 200 && speed < 250) {
    // yellow bg
    background(240, 233, 37);
    // squint ver 4 
    image (squint4, width/2-200, height/2-75);
    // black pupils
    //      fill(0);
    //      ellipse(width/2+43, height/2-15, 50,50); // right
    //      ellipse(width/2-20, height/2-15, 50,50); // left
    fill (0); 
    // left pupil 
    lD= dist(mouseX,mouseY,width/2-80,height/2-15);
    lD= constrain(lD,0,50);
    lA=atan2(mouseY-(height/2-15),mouseX-(width/2-80));

    float newlX=(width/2-80) + cos(lA)*lD;
    float newlY= (height/2-15) + sin(lA)*lD/2;
    lX += (newlX-lX) * 0.5;
    lY += (newlY-lY) * 0.5;
    ellipse(lX,lY,50,50);

    // right pupil 
    rD= dist(mouseX,mouseY,width/2+110,height/2-15);
    rD= constrain(rD,0,50);
    rA=atan2(mouseY-(height/2-15),mouseX-(width/2+110));

    float newrX= (width/2+110) + cos(rA)*rD;
    float newrY= (height/2-15) + sin(rA)*rD/2;
    rX += (newrX-rX) * 0.5;
    rY += (newrY-rY) * 0.5;
    ellipse(rX,rY,50,50);
  } 

  else if (speed > 250 && speed < 1000) {
    // yellow bg
    background(240, 233, 37);
    // squint ver 5 
    image (squint5, width/2-200, height/2-75);
    // black pupils
    //      fill(0);
    //      ellipse(width/2+43, height/2-15, 50,50); // right
    //      ellipse(width/2-20, height/2-15, 50,50); // left
    fill (0); 
    // left pupil 
    lD= dist(mouseX,mouseY,width/2-80,height/2-15);
    lD= constrain(lD,0,50);
    lA=atan2(mouseY-(height/2-15),mouseX-(width/2-80));

    float newlX=(width/2-80) + cos(lA)*lD;
    float newlY= (height/2-15) + sin(lA)*lD/2;
    lX += (newlX-lX) * 0.5;
    lY += (newlY-lY) * 0.5;
    ellipse(lX,lY,50,50);

    // right pupil 
    rD= dist(mouseX,mouseY,width/2+110,height/2-15);
    rD= constrain(rD,0,50);
    rA=atan2(mouseY-(height/2-15),mouseX-(width/2+110));

    float newrX= (width/2+110) + cos(rA)*rD;
    float newrY= (height/2-15) + sin(rA)*rD/2;
    rX += (newrX-rX) * 0.5;
    rY += (newrY-rY) * 0.5;
    ellipse(rX,rY,50,50);
  } 

  else { 
    // yellow bg
    background(240, 233, 37);
    // open eyes
    image (openEyes, width/2-200, height/2-75);
    // black pupils
    //      fill(0);
    //      ellipse(width/2+43, height/2-15, 50,50); // Right 
    //      ellipse(width/2-20, height/2-15, 50,50); // Left 
    fill (0); 
    // left pupil 
    lD= dist(mouseX,mouseY,width/2-80,height/2-15);
    lD= constrain(lD,0,50);
    
    lA=atan2(mouseY-(height/2-15),mouseX-(width/2-80));

    float newlX=(width/2-80) + cos(lA)*lD;
    float newlY= (height/2-15) + sin(lA)*lD/2;
    lX += (newlX-lX) * 0.5;
    lY += (newlY-lY) * 0.5;
    ellipse(lX,lY,50,50);

    // right pupil 
    rD= dist(mouseX,mouseY,width/2+110,height/2-15);
    rD= constrain(rD,0,50);
    rA=atan2(mouseY-(height/2-15),mouseX-(width/2+110));

    float newrX= (width/2+110) + cos(rA)*rD;
    float newrY= (height/2-15) + sin(rA)*rD/2;
    rX += (newrX-rX) * 0.5;
    rY += (newrY-rY) * 0.5;
    ellipse(rX,rY,50,50);
  }
}


