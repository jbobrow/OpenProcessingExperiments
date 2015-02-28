
//Type font
PFont myFont;
PImage fly;
boolean cursorON = true;

float mouseON = 0;
boolean mouseDead = false;
float laserColor = 0;
float laserV1 = 0;
float jiggle = 0;
float jamp = 3;
float speed;
boolean LaserON = false;

//light
float Lsize;
float LLx1;
float LLx2;
//pupil size
float Psize;

//left eye-----------
float LEx = 210;
float LEy = 210;
float LEsize = 160;
//left pupil
float LPsize = 50;

//left light
float LLx;
float LLy;
//Iris shutters
float angleA = 1.7;
float LP1ax;
float LP1ay;
float LP2ax;
float LP2ay;
float LP1bx;
float LP1by;

//Right Eye
float REx = 430;
float REy = 210;
float REsize = 160;
//Right pupil
float RPsize = 50;
//Right light
float RLx;
float RLy;
//Right Iris shutters
float RP1ax;
float RP1ay;
float RP2ax;
float RP2ay;
float RP1bx;
float RP1by;

void setup(){
  size(640, 480);
  smooth();
  myFont = createFont("verdana", 9);
  fly = loadImage("fly.png");
  textFont(myFont);
  noCursor();
}

void draw(){
  background(142, 137, 129);
  stroke(0);
  strokeWeight(1);

  laserV1 ++;

  //mouse speed
  speed = abs(mouseX - pmouseX) + abs(mouseY - pmouseY);
  
  
  
  //pupil size
  if(mouseDead == false){
    if(RPsize < LPsize){
      Psize = RPsize;
    }  
    else{
      Psize = LPsize;
    }
    RPsize = constrain((dist(REx, REy, mouseX, mouseY))/2, 0, REsize);
    LPsize = constrain((dist(LEx, LEy, mouseX, mouseY))/2, 0, LEsize);

  }
  else{ //if mouse is dead...

    if(Psize > 0){
      Psize -= 1;
      //LPsize -= 1;
    }
  }

  //both eyes - jiggle control
  if((LaserON == false) && (mouseDead == false)){
    if((dist(REx, REy, mouseX, mouseY) < REsize / 2) || (dist(LEx, LEy, mouseX, mouseY) < LEsize / 2)){
      jiggle += .75;
      jamp += .01;
      if(jamp >= 6){
        LaserON = true;
      }
    }
  }
  if((mouseDead == true) && (jamp > 3)){
    jamp -= .1;
  }
  REy = 210 + sin(jiggle) * jamp;
  LEy = 210 + sin(jiggle) * jamp;
  if(Psize < 9){
    fill(255, 0, 0);
  }
  else{
    fill(95, 87, 74);
  }
  ellipse(LEx, LEy, LEsize, LEsize);
  ellipse(REx, REy, REsize, REsize);


  //Left Eye



    //noFill();

  //ellipse(LEx, LEy, Psize, Psize);
  //ellipse(REx, REy, Psize, Psize);

  //shutters
  fill(100);
  pushMatrix();
  translate(LEx, LEy);
  for(float s = 0; s < 8; s++){ //repeat shutters
    pushMatrix();
    rotate(- 2 + s * (PI/4));
    for(float i = 0; i < PI; i += PI){
      LP1ax = sin(i) * (LEsize)/2;
      LP1ay = cos(i) * (LEsize)/2;
      LP2ax = sin(i + PI/2) * (LEsize)/2;
      LP2ay = cos(i + PI/2) * (LEsize)/2;

      LP1bx = cos(i + angleA) * (Psize)/2;
      LP1by = sin(i + angleA) * (Psize)/2;

      triangle(LP1ax, LP1ay, LP1bx, LP1by, LP2ax, LP2ay);

      beginShape();
      vertex(LP1ax - 2, LP1ay + 1);
      strokeWeight(3);
      stroke(100);
      bezierVertex(LP1ax + 30, LP1ay + 10, LP2ax + 10, LP2ay + 30, LP2ax - 2, LP2ay - 2);
      endShape();
      stroke(0);
      point(RP1ax + 31.5, RP1ay + 5);
      strokeWeight(1);
    }
    popMatrix();

  }
  popMatrix();


  //Right Eye
  //shutters
  fill(100);
  pushMatrix();
  translate(REx, REy);
  for(float s = 0; s < 8; s++){ //repeat shutters
    pushMatrix();
    scale(-1, 1);
    rotate(- 2 + s * (PI/4));
    for(float i = 0; i < PI; i += PI){
      RP1ax = sin(i) * (REsize)/2;
      RP1ay = cos(i) * (REsize)/2;
      RP2ax = sin(i + PI/2) * (REsize)/2;
      RP2ay = cos(i + PI/2) * (REsize)/2;

      RP1bx = cos(i + angleA) * (Psize)/2;
      RP1by = sin(i + angleA) * (Psize)/2;

      triangle(RP1ax, RP1ay, RP1bx, RP1by, RP2ax, RP2ay);

      beginShape();
      vertex(RP1ax - 2, RP1ay + 1);
      strokeWeight(3);
      stroke(100);
      bezierVertex(RP1ax + 30, RP1ay + 10, RP2ax + 10, RP2ay + 30, RP2ax - 2, RP2ay - 2);
      endShape();
      stroke(0);
      point(RP1ax + 31.5, RP1ay + 5);
      strokeWeight(1);
    }
    popMatrix();

  }
  popMatrix();

  //lights
  noStroke();
  //left light
  Lsize = 20;
  LLx = map(mouseX, 0, width, LEx - (.7 * Psize / 3), LEx + (.7 * Psize / 3));
  LLy = map(mouseY, 0, height, LEy - (.7 * Psize / 3), LEy + (.7 * Psize / 3));
  RLx = map(mouseX, 0, width, REx - (.7 * Psize / 3), REx + (.7 * Psize / 3));
  RLy = map(mouseY, 0, height, REy - (.7 * Psize / 3), REy + (.7 * Psize / 3));
  if((mouseDead == true) && (mouseON < 0)){
    LLx = LEx;
    LLy = LEy;
    RLx = REx;
    RLy = REy;
    mouseON ++;
  }

  if(Psize > 8){
    for(float h = Lsize; h >= 0; h -= 5){
      fill(255, 0, 0, 255 - (h * (255 / Lsize)));
      ellipse(LLx, LLy, h+2, h+2);
      ellipse(RLx, RLy, h+2, h+2);

    }
  }
  noFill();
  //RINGS
  noFill();
  stroke(0);
  strokeWeight(10);
  ellipse(LEx, LEy, LEsize, LEsize);
  ellipse(REx, REy, REsize, REsize);
  if(LaserON == false){
    strokeWeight(8);
    stroke(-30 + (jamp * 40), 260 - (jamp * 40), 0);
    ellipse(LEx, LEy, LEsize, LEsize);
    ellipse(REx, REy, REsize, REsize);
  }
  else{
    strokeWeight(8);
    stroke(255, 0, 0);
    ellipse(LEx, LEy, LEsize, LEsize);
    ellipse(REx, REy, REsize, REsize);
  }




  //lazers
  laserColor = 75 + sin(laserV1) * 100;
  if((LaserON == true) || (mouseON < 0)){
    //ring glow
    for(float h = 5; h >= 0; h -= 1){
      noFill();
      stroke(-30 + (jamp * 40), 260 - (jamp * 40), 0, 110 - (h * 15));
      strokeWeight((h * h) / 2);
      ellipse(REx, REy, REsize + 10, REsize + 10);
      ellipse(LEx, LEy, LEsize + 10, LEsize + 10);
      println(h);
    } 
  }
  if(LaserON == true){
    //laser beams
    strokeWeight(1);
    if((dist(REx, REy, mouseX, mouseY) > REsize) && (dist(LEx, LEy, mouseX, mouseY) > LEsize)){
      stroke(255, laserColor, 0);
      line(RLx, RLy, mouseX, mouseY);
      line(LLx, LLy, mouseX, mouseY);

      //explosion
      for(float h = Lsize; h >= 0; h -= 5){
        noStroke();
        fill(255, laserColor, 0, 255 - (h * (255 / Lsize)));
        ellipse(mouseX, mouseY, h+2, h+2);
      }
      if(mouseON < 100){
        mouseON ++;
      }
      if(mouseON >= 100){
        mouseON = -200;
        mouseDead = true;
        cursorON = false;
        LaserON = false;
      }
    }
  } //end lazerON == true
  if((mouseON == 0) && (mouseDead == true)){
    mouseDead = false;
    cursorON = true;
  }

  if(cursorON == true){
    image(fly,mouseX - 20 + 2*sin(.8*laserV1),mouseY - 20 + 2*cos(.8*laserV1));
  }

  //Text
  fill(160);
  text("Psize = " + round(Psize), 20, 30);
  text("Jamp = " + round(jamp), 20, 40);
  text("LaserON == " + LaserON, 20, 50);
  text("mouseON = " + round(mouseON), 20, 60);
  text("mouseDead = " + mouseDead, 20, 70);

}















