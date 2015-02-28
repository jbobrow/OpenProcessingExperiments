
import processing.opengl.*;

float localX = 400.0;
float localY = 400.0;

void setup(){
 size (800,800, OPENGL); 
}

void drawCreature(float x, float y){
  
  
  pushMatrix();
  pushMatrix();
  //left arm
    fill(33,18,2);
    noStroke();
    quad(-75 + x, -150 + y, -75 + x, -125 + y, -100 + x, -75 + y, -125 + x, -150 + y);
    triangle( -125 + x, -150 + y, -175 + x, -75 + y, -100 + x, -75 + y);
    quad(-175 + x, -75 + y, -100 + x, -75 + y, -100 + x, 0 + y, -200 + x, 0 + y);
    quad(-200 + x, 0 + y, -100 + x, 0 + y, -75 + x, 50 + y, -200 + x, 50 + y);
    quad(-200 + x, 50 + y, -75 + x, 50 + y, -75 + x, 125 + y, -200 + x, 125 + y);
    quad(-200 + x, 125 + y, -75 + x, 125 + y, -100 + x, 150 + y, -175 + x, 150 + y);
    pushMatrix();
    //left arm claws
      fill(45,43,42);
      triangle(-100 + x, 125 + y, -100 + x, 175 + y, -125 + x, 125 + y);
    popMatrix();
    pushMatrix();
      triangle(-125 + x, 125 + y, -125 + x, 175 + y, -150 + x, 125 + y);
    popMatrix();
    pushMatrix();
      triangle(-150 + x, 125 + y, -150 + x, 175 + y, -175 + x, 125 + y);
    popMatrix();
    popMatrix();
  
  pushMatrix();
  //left foot
    fill(49,29,7);
    noStroke();
    rectMode(CORNERS);
    rect(-100 + x, 100 + y, -25 + x, 225 + y);
    //left foot toe
      fill(25,23,22);
      quad(-100 + x, 200 + y, -75 + x, 200 + y, -50 + x, 225 + y,-125 + x, 225 + y);
  popMatrix();
      
  pushMatrix();
  //left ear
    
    translate( x - 90, y - 180);
   pushMatrix();
     rotateZ(radians( 5 * sin( millis()/750.0 )));
    pushMatrix();
    noStroke();
    fill(67,41,12);
    triangle( -14.5, -14.5, 60.5, -39.5, 14.5, 14.5);
      popMatrix();
    popMatrix();
    //quad(-100 + x, -175 + y, -100 + x, -200 + y, -25 + x, -225 + y, -75 + x, -175 + y);
  popMatrix();
    
  pushMatrix();
  //body
    fill(110,68,21);
    quad(-150 + x, -100 + y, -150 + x, -150 + y, -100 + x, -200 + y, -100 + x, -100 + y);
    rectMode(CORNERS);
    rect(-100 + x, -200 + y, 150 + x, 100 + y);
    quad(-100 + x, 100 + y, 150 + x, 100 + y, 100 + x, 150 + y, -50 + x, 150 + y);
    //mouth
      fill(77,26,10);
      rect(-75 + x, -100 + y, 75 + x, 50 + y);
    //throat
      fill(26,7,2);
      quad(-50 + x, 0 + y, -50 + x, -50 + y, -25 + x, -75 + y, -25 + x, 0 + y);
      rect(-25 + x, -75 + y, 75 + x, 0 + y);
    //uvula
      fill(77,26,10);
      rect(25 + x, -75 + y, 50 + x, -50 + y);
      fill(164,102,82);
      rect(27.5 + x, -62.5 + y, 37.5 + x, -52.5 + y);
  popMatrix();
    
  pushMatrix();
    //tongue
    fill(195,41,30);
    quad(-75 + x, 0 + y, -50 + x, -25 + y, 75 + x, -25 + y, 75 + x, 0 + y);
    rect(-75 + x, 0 + y, 75 + x, 50 + y);
    //tongue sheen
      fill(226,108,99);
      triangle(0 + x, 5 + y, 0 + x, -20 + y, 25 + x, -20 + y);
      stroke(226,108,99);
      strokeWeight(5);
      line(-45 + x, -20 + y, 70 + x, -20 + y);
      noStroke();
  popMatrix();
  
  pushMatrix();
  //right foot
    fill(110,68,21);
    noStroke();
    rectMode(CORNERS);
    rect(75 + x, 100 + y, 150 + x, 225 + y);
    fill(45,43,42);
    quad(50 + x, 225 + y, 125 + x, 225 + y, 100 + x, 200 + y, 75 + x, 200 + y);
  popMatrix();
   
  pushMatrix(); 
  //right arm
    //claws
    fill(134,130,126);
    noStroke();
    triangle(125 + x, 125 + y, 150 + x, 125 + y, 125 + x, 175 + y);
    triangle(150 + x, 125 + y, 175 + x, 125 + y, 150 + x, 175 + y);
    triangle(175 + x, 125 + y, 200 + x, 125 + y, 175 + x, 175 + y);
    //the arm
      fill(131,81,25);
      quad(100 + x, -150 + y, 150 + x, -150 + y, 125 + x, -75 + y, 100 + x, -125 + y);
      triangle(125 + x, -75 + y, 150 + x, -150 + y, 200 + x, -75 + y);
      quad(125 + x, -75 + y, 200 + x, -75 + y, 225 + x, 0 + y, 125 + x, 0 + y);
      quad(125 + x, 0 + y, 225 + x, 0 + y, 225 + x, 50 + y, 100 + x, 50 + y);
      rect(100 + x, 50 + y, 225 + x, 125 + y);
      quad(100 + x, 125 + y, 225 + x, 125 + y, 200 + x, 150 + y, 125 + x, 150 + y);
    //spots
      fill(187,144,93);
      ellipseMode(CENTER);
      ellipse(200 + x, 25 + y, 15, 15);
      ellipse(200 + x, 75 + y, 15, 15);
      ellipse(175 + x, 50 + y, 15, 15);
      ellipse(175 + x, 100 + y, 15, 15);
      ellipse(150 + x, 75 + y, 15, 15);
   popMatrix();
    
   pushMatrix();
  //jaw
    int jawLock;
    float jawMove = 125 * sin( millis()/500.0);
    if (jawMove < 0) {
       jawLock = 0; 
    } else {
       jawLock = 1;
    }
    float jawMouse;
    if (mousePressed  && (mouseButton == LEFT)){
      jawLock = 0;
      jawMouse = 100;
    } else {
      jawMouse = 0;
    }
    translate( 0, ((jawLock * jawMove)+ jawMouse));
    //teeth
    fill(230,227,210);
    quad(-175 + x, -100 + y, -175 + x, -150 + y, -150 + x, -150 + y, -125 + x, -100 + y);
    triangle(-175 + x, -150 + y, -150 + x, -175 + y, -150 + x, -150 + y);
    quad(75 + x, -100 + y, 100 + x, -150 + y, 125 + x, -150 + y, 125 + x, -100 + y);
    triangle( 100 + x, -150 + y, 125 + x, -150 + y, 100 + x, -175 + y);
    //lower jaw
      fill(92,66,36);
      rectMode(CORNERS);
      rect(-175 + x, -100 + y, 125 + x, -75 + y);
      rect(-150 + x, -75 + y, 100 + x, 75 + y);
      quad(-150 + x, 75 + y, 100 + x, 75 + y, 75 + x, 100 + y, -125 + x, 100 + y);
    //blemish
      stroke(66,39,10);
      line(-75 + x, -75 + y, -25 + x, -75 + y);
      point(-75 + x, -25 + y);
      point(-25 + x, -25 + y);
      point(-50 + x, -50 + y);
   popMatrix();
      
   pushMatrix(); 
  //eyes
    noStroke();
    fill(233,226,219);
    ellipseMode(CENTER);
    ellipse(-75 + x, -175 + y, 25, 25);
    ellipse(50 + x, -175 + y, 25, 25);
    fill(28,104,20);
    ellipse(-75 + x, -175 + y, 15, 15);
    ellipse(50 + x, -175 + y, 15, 15);
   popMatrix();
    
    
   pushMatrix();
   //right ear
     translate( x + 125, y - 180);
   pushMatrix();
     rotateZ(radians( 15*sin( millis()/500.0 )));
    pushMatrix();
 
    noStroke();
    fill(110,68,21);
    //quad(125 + x, -175 + y, 125 + x, -200 + y, 200 + x, -225 + y, 150 + x, -175 + y);
    triangle( -14.5, -14.5, 60.5, -39.5, 14.5, 14.5);
      popMatrix();
    popMatrix();
   popMatrix();
    
    
   pushMatrix();
    translate( 0, 1 * sin( millis()/1000.0));
  //snout
    noStroke();
    fill(114, 62, 4);
    quad(-150 + x, -150 + y, 100 + x, -150 + y, 125 + x, -125 + y, -175 + x, -125 + y);
    rect(-175 + x, -125 + y, 125 + x, -100 + y);
    quad(-175 + x, -100 + y, -75 + x, -100 + y, -100 + x, -75 + y, -150 + x, -75 + y);
    quad(25 + x, -100 + y, 125 + x, -100 + y, 100 + x, -75 + y, 50 + x, -75 + y);
    //nose
      fill(7,4,2);
      triangle(0 + x, -150 + y, -50 + x, -150 + y, -25 + x, -125 + y);
      stroke(82,77,72);
      line(-50 + x, -150 + y, 0 + x, -150 + y);
    //freckles
      stroke(187,144,93);
      point(-100 + x, -125 + y);
      point(-150 + x, -125 + y);
      point(-125 + x, -100 + y);
      point(50 + x, -125 + y);
      point(75 + x, -100 + y);
      point(100 + x, -125 + y);
  popMatrix();    
      
      popMatrix();
}


void draw(){
 background (255); 
 smooth();

 if (mousePressed && (mouseButton == LEFT)) {
    localX = mouseX;
    localY = mouseY; 
 /*   
 drawCreature(localX, localY);
 } else {
 
   drawCreature(localX, localY);
   
 }
*/
  float i;
  for ( i = 0; i < 2; i++){
    background(125*sin(millis()/15.0),125*cos(millis()/10.0), 125*tan(millis()/5.0));
     drawCreature(localX+(i*(300*sin(millis()/250.0))),localY+(i*(300*cos(millis()/250.0)))); 
     drawCreature(localX+(-i*(300*sin(millis()/250.0))),localY+(-i*(300*cos(millis()/250.0)))); 
     drawCreature(localX, localY);
  }
  
 } else {
 
   drawCreature(localX, localY);
   
 }
 
}

