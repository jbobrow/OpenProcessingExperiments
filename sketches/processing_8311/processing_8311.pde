
float angle = 0.0;
float offset = 60;
float scalar = 50;
float speed = 0.10;
float angle2 = 0.0;

//bullets
int bulletx = 190;
int bullety = 190;
boolean bulletmoving = false;
int numHits = 1;

float circleX = 80;
float circleY = 80;
float circleRadius = 10; 

PFont guardian; 
PFont directions;

void setup() {
  size(480, 320);
  smooth(); 
  ellipseMode(RADIUS);
  guardian = loadFont ("AlienEncounters-48.vlw");
  directions = loadFont ("Ayuthaya-12.vlw");

 // textFont(guardian);


}

void draw() {
  //rotating circle and goal 
  background(0);
  float x = offset + cos(angle) * scalar;
  float y = offset + sin(angle) * scalar;
  fill(255);
  //if (bulletmoving == true) {
    ellipse( x+20, y+20, 20, 20);//big circle
  //}
  ellipse( circleX, circleY, circleRadius, circleRadius);//goal 
  angle += speed;


  //battleship
  strokeWeight(3);
  stroke(255);

  line(190, 190, 230, 200);
  line(190, 190, 200, 230);  

  //println(bulletmoving);

  //bullets
  if (bulletmoving == true) {
    bulletx = bulletx-4;
    bullety = bullety-4;
    strokeWeight(1.5);
    line(bulletx, bullety, bulletx+10, bullety+10); 
  }
textFont(guardian);
text("The Guardian", 200, 10, 300, 200); 
textFont(directions);
fill(255, 205, 0);
text("Directions:", 200, 100, 300, 450);
textSize(9);
fill(255); 
text("1. Press the space bar to shoot", 200, 115, 300, 450);
text("2. Dodge the large circle guarding the goal", 200, 130, 300, 450);
text("3. Hit the goal 5 times to win", 200, 145, 300, 450);

if (keyCode == ENTER){
    textAlign(LEFT);
    
  }

  // Draw bullet



  // if (circleLineIntersect(bulletx, bullety, bulletx+10, bullety+10, circleX, circleY, circleRadius) == true) { 
  //    fill(255);
  //      }

  if (circleLineIntersect(bulletx, bullety, bulletx+10, bullety+10, circleX, circleY, circleRadius) == true) { 
    // ellipse( circleX, circleY, circleRadius, circleRadius);
   textFont(guardian);
    fill(255);
    float s = sin(angle2);
    background(s*127 + 127);
    //textSize(2);
    textAlign(CENTER);
    if (numHits == 1){
      fill(255, 205, 0);
      text("HIT #1!", 85, 100, 300, 200);
      fill(255);
      text("'ENTER' to continue", 85, 200, 300, 300);
    } else if (numHits == 2){
      fill(255, 205, 0);
      text("HIT #2!", 85, 100, 300, 200);
      fill(255);
       text("'ENTER' to continue", 85, 200, 300, 300);
    }
    else if (numHits == 3) {
      fill(255, 205, 0);
    text("HIT #3!", 85, 100, 300, 200);
    fill(255);
     text("'ENTER' to continue", 85, 200, 300, 300);
    }
    else if (numHits == 4) {
      fill(255, 205, 0);
      text("HIT #4!", 85, 100, 300, 200);
      fill(255);
       text("'ENTER' to continue", 85, 200, 300, 300);
    }
    else if (numHits == 5) {
      fill(255, 205, 0); 
      text("HIT #5! WINNER.", 85, 100, 300, 200);
      fill(255); 
       text("'ENTER' to replay", 85, 200, 300, 300);
    }
    else if(numHits > 5) {
      rewrite(); 
    }
    angle2 += 0.07;
    
   //textSize(2);
    //textAlign(LEFT);
    //text("HIT #1.", 20, 30, 300, 200);
    
    noStroke();
    line(bulletx, bullety, bulletx+10, bullety+10);


    bulletmoving = false;
    println("stop");
    
    textAlign(LEFT);
    
  }

  else {
    fill(255,0);
  }

  if (circleLineIntersect(bulletx, bullety, bulletx+10, bullety+10, x+20, y+20, 20) == true){
     println("im hit");
     bulletmoving = false;
     //noLoop();
//    reload();
//
//    line(bulletx, bullety, bulletx+10, bullety+10);
//    float s = sin(angle2);
//    background(s*127 + 127);
//
//   
//    angle2 += 0.1;
  }
//  else {
//    reload();
//
//  }

  if ((bulletx <= -10) && (bullety <= -10)) {
    reload();
    //    reset();

  } 


}


// Code adapted from Paul Bourke: 
// http://local.wasp.uwa.edu.au/~pbourke/geometry/sphereline/raysphere.c 
boolean circleLineIntersect(float x1, float y1, float x2, float y2, float cx, float cy, float cr ) { 
  float dx = x2 - x1; 
  float dy = y2 - y1; 
  float a = dx * dx + dy * dy; 
  float b = 2 * (dx * (x1 - cx) + dy * (y1 - cy)); 
  float c = cx * cx + cy * cy; 
  c += x1 * x1 + y1 * y1; 
  c -= 2 * (cx * x1 + cy * y1); 
  c -= cr * cr; 
  float bb4ac = b * b - 4 * a * c; 

  //println(bb4ac); 

  if (bb4ac < 0) {  // Not intersecting 
    return false; 
  }  
  else { 

    float mu = (-b + sqrt( b*b - 4*a*c )) / (2*a); 
    float ix1 = x1 + mu*(dx); 
    float iy1 = y1 + mu*(dy); 
    mu = (-b - sqrt(b*b - 4*a*c )) / (2*a); 
    float ix2 = x1 + mu*(dx); 
    float iy2 = y1 + mu*(dy); 

    // The intersection points 
    //ellipse(ix1, iy1, 10, 10); 
    //ellipse(ix2, iy2, 10, 10); 

    float testX; 
    float testY; 
    // Figure out which point is closer to the circle 
    if (dist(x1, y1, cx, cy) < dist(x2, y2, cx, cy)) { 
      testX = x2; 
      testY = y2;  
    } 
    else { 
      testX = x1; 
      testY = y1;  
    } 

    if (dist(testX, testY, ix1, iy1) < dist(x1, y1, x2, y2) || dist(testX, testY, ix2, iy2) < dist(x1, y1, x2, y2)) { 
      return true; 
    } 
    else { 
      return false; 
    } 
  } 
} 


void keyPressed() {
  if (keyCode == ' ') {
    bulletmoving = true; 
  }
  else if (keyCode == ENTER){
    reload();
    
  }
}



void reload() {

  println("reload");

  bulletx = 190;
  bullety = 190;

  bulletmoving = false;

 numHits++;
 println("numHit =" + numHits);
}

void rewrite() {
  
  float s = sin(angle2);
    background(s*127 + 127);
    //textSize(2);
    textAlign(CENTER);
    if (numHits == 6){
      fill(255, 205, 0);
      text("HIT #1!", 85, 100, 300, 200);
      fill(255);
      text("'ENTER' to continue", 85, 200, 300, 300);
    } else if (numHits == 7){
      fill(255, 205, 0); 
      text("HIT #2!", 85, 100, 300, 200);
      fill(255);
       text("'ENTER' to continue", 85, 200, 300, 300);
    }
    else if (numHits == 8) {
      fill(255, 205, 0); 
    text("HIT #3!", 85, 100, 300, 200);
    fill(255);
     text("'ENTER' to continue", 85, 200, 300, 300);
    }
    else if (numHits == 9) {
      fill(255, 205, 0); 
      text("HIT #4!", 85, 100, 300, 200);
      fill(255); 
       text("'ENTER' to continue", 85, 200, 300, 300);
    }
    else if (numHits == 10) {
      fill(255, 205, 0); 
      text("HIT #5! WINNER.", 85, 100, 300, 200);
      fill(255);
       text("'ENTER' to replay", 85, 200, 300, 300);
    }
   
    if (numHits == 11){
      fill(255, 205, 0); 
      text("HIT #1!", 85, 100, 300, 200);
      fill(255);
      text("'ENTER' to continue", 85, 200, 300, 300);
    } else if (numHits == 12){
      fill(255, 205, 0);
      text("HIT #2!", 85, 100, 300, 200);
      fill(255);
       text("'ENTER' to continue", 85, 200, 300, 300);
    }
    else if (numHits == 13) {
      fill(255, 205, 0);
    text("HIT #3!", 85, 100, 300, 200);
    fill(255);
     text("'ENTER' to continue", 85, 200, 300, 300);
    }
    else if (numHits == 14) {
      fill(255, 205, 0);
      text("HIT #4!", 85, 100, 300, 200);
      fill(255);
       text("'ENTER' to continue", 85, 200, 300, 300);
    }
    else if (numHits == 15) {
      fill(255, 205, 0);
      text("HIT #5! WINNER.", 85, 100, 300, 200);
      fill(255);
       text("'ENTER' to replay", 85, 200, 300, 300);
    }
   
    if (numHits == 16){
      fill(255, 205, 0);
      text("HIT #1!", 85, 100, 300, 200);
      fill(255);
      text("'ENTER' to continue", 85, 200, 300, 300);
    } else if (numHits == 17){
      fill(255, 205, 0);
      text("HIT #2!", 85, 100, 300, 200);
      fill(255);
       text("'ENTER' to continue", 85, 200, 300, 300);
    }
    else if (numHits == 18) {
      fill(255, 205, 0);
    text("HIT #3!", 85, 100, 300, 200);
    fill(255);
     text("'ENTER' to continue", 85, 200, 300, 300);
    }
    else if (numHits == 19) {
      fill(255, 205, 0);
      text("HIT #4!", 85, 100, 300, 200);
      fill(255);
       text("'ENTER' to continue", 85, 200, 300, 300);
    }
    else if (numHits == 20) {
      fill(255, 205, 0);
      text("HIT #5! WINNER.", 85, 100, 300, 200);
      fill(255); 
       text("'ENTER' to replay", 85, 200, 300, 300);
    }
    
    angle2 += 0.07;
  
}




