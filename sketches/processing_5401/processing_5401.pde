
//GOBI

float speed = 0.0;
float bs = 2.0;

PImage gobipbody;
PImage gobipleftleaf;
PImage gobiprightleaf;
PImage gobipsoilcover;
PImage gobipeye;
PImage gobipbackground;

PImage background1;
PImage background2;
PImage background3;
PImage background4;
PImage smoke;
PImage smogclouds;
PImage clouds;

float x;
float y;
float a = 0.0;
float targetX, targetY;
float easing = 0.006;
float dx, dy;
int mid = 238;
int h = hour();
float tx = 0;
float tx2 = 0;
float shutdown = 0;
float shutdown2 = 1;
float sleep = 0;


//speed of background panes
float b1 = -930;
float speed1 = 0.0;
float b2 = -930;
float speed2 = 0.0;
float b3 = -930;
float speed3 = 0.0;
float b4 = -930; //smoke
float speed4 = 0.0;
float b5 = -930;
float speed5 = 0.0;
float b6 = -930; //smog clouds
float speed6 = 0.0;
float b7 = -930; //clouds
float speed7 = 0.0;


void setup() {

  size(480,320);
  background(244);
  smooth();
  noCursor();
  
  gobipbody = loadImage ("GobiPBody.png");
  gobipleftleaf = loadImage ("GobiPLeftLeaf.png");
  gobiprightleaf = loadImage ("GobiPRightLeaf.png");
  gobipsoilcover = loadImage ("GobiPSoilCover.png");
  gobipeye = loadImage ("GobiPEye.png");
  
  background1 = loadImage ("Background1.png");
  background2 = loadImage ("Background2.png");
  background3 = loadImage ("Background3.png");
  background4 = loadImage ("Background4.png");
  smoke = loadImage ("Smoke.png");
  smogclouds = loadImage ("SmogClouds.png");
  clouds = loadImage ("Clouds.png");



}



void draw() {
 
  background (255-(abs(12-h)*31.25));
  
  
  float currentTime = (millis()/1000.0);
  println (b1);
  

  image (clouds, 0, b7);
  image (smogclouds, 0, b6);
  image (background4, 0, b5);
  image (smoke, 0, b4);
  image (background3, 0, b3);
  image (background2, 0, b2);
  image (background1, 0, b1);
    


    if (((h < 20) || (h > 8)) && (b1 >= -930) && (b1 <= 260)) {
      bs = 2;
      b1 += 1*bs;
      b2 += 0.8*bs;
      b3 += 0.6*bs;
      b4 += 0.6*bs;
      b5 += 0.5*bs;
      b6 += 0.46*bs;
      b7 += 0.45*bs;
    }
    
    if (((h > 20) || (h < 8)) && (b1 >= -930) && (b1 <= 240)) {
      b1 -= 1*bs;
      b2 -= 0.8*bs;
      b3 -= 0.6*bs;
      b4 -= 0.6*bs;
      b5 -= 0.5*bs;
      b6 -= 0.46*bs;
      b7 -= 0.45*bs;

    }

  
  
  pushMatrix();
  
    float rx = map(mouseY-8,0,height,-0.3,0.4); // smoothing out the leaf
    float sx = map(y,0,height,0.5,1.5); // smoothing out the shadow
    dx = abs(mouseX-x); // distance between sun and Gobi
    dy = abs(mouseY-y);
    float z = sin(a)*random(5);
    a += PI/36.0;
    
  
  /*
    //SHADOW
    pushMatrix();
      beginShape();
      translate(mid,290);
      scale(sx);
      translate((1/sx)*(x - width/2),0);
      fill(0,40);
      noStroke();
      ellipse(0,0,100,30);
      endShape();
    popMatrix();
  */ 
   
    //GOBI ON AND SHUTDOWN
    if ((h > 19) || h < 6) {
      targetY = 185;
      float dy = targetY - y;
      if(abs(dy) > 1) {
        y += dy*easing;
      }
 
      translate ((x-width/2),(y-height/2));
    }
    else {
      targetX = mouseX;
      dx = mouseX - x;   
      if(abs(dx) > 1) {
        x += dx*easing;
      }
      targetY = mouseY;
      dy = mouseY - y;
      if(abs(dy) > 1) {
        y += dy*easing;
      } 
    
    
      if ((h > 18 && h < 20) || (h < 7 && h > 5)) {
        translate (0,z); 
    
    
      }
      if (y>185) { //establishing the ground
        y=185;
      }
     
      translate((x-width/2), (y-height/2)); 
    }




  
    

  //IMAGE GOBI
    image (gobipbody, 60, -10, 360, 290);
    //leaves
    pushMatrix();
      translate(224, 99);
      tx += PI/(20+(abs(12-h)*8));
      if((h<7) || (h > 19)) {
        rotate(0);
      }
      else {
        rotate(((sin(tx)/4)+0.2)*shutdown2);
      }  
      image (gobipleftleaf,-135,-60,150,100);
    popMatrix();
    pushMatrix();
      translate(251,99);
      tx2 += PI/(20+(abs(12-h)*8));
      if((h < 7) || (h > 19)) {
        rotate(0);
      }
      else {
        rotate((sin(-tx2)/4)-0.2);
      }  
      image (gobiprightleaf,-12,-60,150,100);
    popMatrix();
    image (gobipsoilcover,53,-15);
    //eyes
    pushMatrix();
      translate(179,167);
      if ((h>18) || (h<8)) {
        rotate(10/(dx));
      }
      else {
        rotate(100/(dx));
      }
      image (gobipeye,-39,-39);
    popMatrix();
    pushMatrix();
      translate(296,167);
      if ((h>18) || (h<8)) {
         rotate(10/(-dx));
      }
      else {
        rotate(100/(-dx));
      }
      image (gobipeye,-39,-39);
    popMatrix();
  //END IMAGE GOBI
  

  
  

  
    //buttons
    stroke(255);
    if ((abs(dx) < 60) && (abs(dy) < 60)) {
      fill (36,247,5);
      rect(230,195,5,5);
      rect(235,195,5,5);
      rect(240,195,5,5);
      rect(245,195,5,5);
    }
    else {
      fill(random(0,255), random(0,255), random(0,255));
      rect(230,195,5,5);
      fill(random(0,255), random(0,255), random(0,255));
      rect(235,195,5,5);
      fill(random(0,255), random(0,255), random(0,255));
      rect(240,195,5,5);
      fill(random(0,255), random(0,255), random(0,255));
      rect(245,195,5,5);
    }
    //WAKING UP, SHUTTING DOWN
    if ((h > 18) || (h < 7)) {
      fill (247,143,5);
      rect(230,195,5,5);
      rect(235,195,5,5);
      rect(240,195,5,5);
      rect(245,195,5,5);
    }
    if ((h > 19) || (h < 6)) {
      fill (0);
      rect(230,195,5,5);
      rect(235,195,5,5);
      rect(240,195,5,5);
      rect(245,195,5,5);
    }
  
  popMatrix();
  
 //SUN
  noStroke();
  fill(255,236,157,80);
  for (int s = 15*(7-abs(12-h)); s > 0; s -= 10){
  ellipse(mouseX, mouseY, s, s);
  }


 
 
 stroke (1);
 
 
 
}


void keyPressed () {
 
  
  //keys for demonstration purposes only

  if(keyCode == DOWN) {
    h = 24;
  }
  if (keyCode == UP) {
    
    h = 12;
  }
  if (keyCode == LEFT) {
    h = hour();
  }
  if (keyCode == RIGHT) {
    h = 19;
  }
}








