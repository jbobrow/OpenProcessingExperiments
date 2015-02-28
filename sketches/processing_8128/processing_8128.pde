
// center point  
float centerX = 0, centerY = 0;  
 
float radius = 1, rotAngle = -45;  
//float radius2 = 50, rotAngle2 = 45;  
float accelX, accelY;  
float springing = .0006, damping = .98;  
 
//fade footsteps  
int footstep = 254;  
int footstep1 = 0;  
int footstep2 = 255;  
int circlefill = 254;  
int circlefillone = 254;  
int timer = 0;   
int fade = 255;  
int r = 0;  
int r2 = 0;  
float rand = random(1,100);  
float rand2 = random(100, 200);  
float circle1X = 0;  
float circle1Y = 0;  
float circleX = 0;  
float circleY = 0;  
float delta = 0;  
boolean circleOver = false;  
int centX = 0;  
int centY = 0;  
int score = 0; 
int s = 50; 
int level = 1; 
PFont franklinGothic; 
int slide = 1; 
 
 
// buttons 
 
int s1x = 0;  
int s1y = 0;  
int s1w = 680;  
int s1h = 320;  
 
int s2x = 450;  
int s2y = 280;  
int s2w = 680;  
int s2h = 300;  
 
//corner nodes  
int nodes = 4;  
float nodeStartX[] = new float[nodes];  
float nodeStartY[] = new float[nodes];  
float[]nodeX = new float[nodes];  
float[]nodeY = new float[nodes];  
float[]angle = new float[nodes];  
float[]frequency = new float[nodes];  
 
// soft-body dynamics  
float organicConstant = 1;  
 
void setup() {  
  rand = random(1,100);  
  loop(); 
  size(680, 320);  
  //center shape in window  
  centerX = 0;  
  centerY = 0;  
  // iniitalize frequencies for corner nodes  
  for (int i=0; i<nodes; i++){  
    frequency[i] = random(5, 5.0001);  
  }  
  noStroke();  
  smooth();  
  frameRate(60);  
  circle1X = random(50,670);  
  circle1Y = random(50,300);  
  circleX = random(50,670);  
  circleY = random(50,300);  
  franklinGothic = loadFont("FranklinGothic-Book-16.vlw"); 
  textFont(franklinGothic); 
  cursor(CROSS); 
  int centX = 0;  
  int centY = 0;  
  int score = 0; 
 
}  
 
 
 
void draw() {  
  redraw(); 
  //fade background  
  background(200);  
  fill(0); 
  textSize(12); 
  //text( "LEVEL: " + level, 10, 20);  
  //fill(255, 100);  
  //rect(0,0,width, height);  
  loop(); 
  if(slide == 1){ 
    gameintro(); 
  }  
  else if(slide == 2) { 
    drawGame(); 
    if((overButton(s1x, s1y, s1w, s1h))) { 
      slide = 2; 
      if((mouseX == centX) && (mouseY < centY)   
        || (mouseX - 1 == centX) && (mouseY < centY) ||   
        (mouseX -2 == centX) && (mouseY < centY)  
        || (mouseX - 3 == centX) && (mouseY < centY) ||   
        (mouseX -4 == centX) && (mouseY < centY)  
        || (mouseX - 5 == centX) && (mouseY < centY) ||   
        (mouseX -6 == centX) && (mouseY < centY)  
        || (mouseX - 7 == centX) && (mouseY < centY) ||   
        (mouseX -8 == centX) && (mouseY < centY)) {  
        slide = 3; 
        delay(1000); 
 
      }  
    } 
  } 
 
  if(slide == 3){ 
    gameOver(); 
    if((overButton(s1x, s1y, s1w, s1h))) { 
      slide = 3; 
 
    } 
    if((overButton(s2x, s2y, s2w, s2h))) { 
      slide = 2; 
 
    } 
  } 
}  
 
boolean overButton(int x, int y, int w, int h) {  
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {  
    return true;   
  }   
  else {  
    return false;   
  }  
}  
 
 
boolean overCircle(float x, float y, int diameter)   
{  
  float disX = x - mouseX;  
  float disY = y - mouseY;  
  if(sqrt(sq(disX) + sq(disY)) < diameter/2 ) {  
    return true;  
  }   
  else {  
    return false;  
  }  
}  
 
 
void mousePressed() {  
  if ((slide == 1)) {  
    if ((overButton(s1x, s1y, s1w, s1h)) == true) {  
      slide = 2;   
      loop(); 
    }  
    else if ((slide == 3)) {  
      if ((overButton(s1x, s1y, s1w, s1h)) == true) {  
        slide = 1; 
      }   
 
    }  
    else if ((slide == 3)) {  
      if ((overButton(s2x, s2y, s2w, s2h)) == true) {  
        slide = 2; 
      }   
 
    } 
 
  } 
 
 
 
} 
 
 
void drawShape() {  
  //  calculate node  starting locations  
  for (int i=0; i<nodes; i++){  
    nodeStartX[i] = centerX+cos(radians(rotAngle))*radius;  
    nodeStartY[i] = -210 + centerY+sin(radians(rotAngle))*radius *300;  
    rotAngle += 360.0/nodes;  
  }  
 
  // draw polygon  
  curveTightness(organicConstant);  
  fill(0, footstep);  
  beginShape();  
  for (int i=0; i<nodes; i++){  
    curveVertex(nodeX[i], nodeY[i]);  
  }  
  for (int i=0; i<nodes-1; i++){  
    curveVertex(nodeX[i], nodeY[i]);  
  }  
  endShape(CLOSE);  
 
 
}  
 
void drawShape2() {  
  //  calculate node  starting locations  
  for (int i=0; i<nodes; i++){  
    nodeStartX[i] = centerX+cos(radians(rotAngle))*radius;  
    nodeStartY[i] = -210 + centerY+sin(radians(rotAngle))*radius *300;  
    rotAngle += 360.0/nodes;  
  }  
 
  // draw polygon  
  curveTightness(organicConstant);  
  fill(0, footstep1);  
  beginShape();  
  for (int i=0; i<nodes; i++){  
    curveVertex(nodeX[i], nodeY[i]);  
  }  
 
 
  //println("nodeX = " + nodeX[0] + " nodeStartY = " + nodeStartY[3] + "mouseX = " + mouseX + "mouseY" + mouseY);  
 
  for (int i=0; i<nodes-1; i++){  
    curveVertex(nodeX[i], nodeY[i]);  
  }  
  endShape(CLOSE);  
 
 
}  
 
void moveShape() {  
  //move center point  
 
  float deltaX = mouseX-centerX;  
  float deltaY = mouseY-centerY;  
 
 
 
  // create springing effect  
 
  deltaX *= springing;  
  deltaY *= springing;  
  accelX += deltaX;  
  accelY += deltaY;  
 
  // move predator's center  
  centerX += accelX;  
  centerY += accelY;  
 
  // slow down springing  
  accelX *= damping;  
  accelY *= damping;  
 
  // change curve tightness  
  organicConstant = 1-((abs(accelX)+abs(accelY))*.1);  
 
  //move nodes  
  for (int i=0; i<nodes; i++){  
    nodeX[i] = nodeStartX[i]+sin(radians(angle[i]))*(accelX *.5);  
    nodeY[i] = nodeStartY[i]+sin(radians(angle[i]))*(accelY *.5);  
    angle[i]+=frequency[i];  
  }  
 
  centX = (int) centerX;  
  centY = (int) centerY;  
 
 
  //println("deltaX =" + (centX) + "mouseX" + (mouseX-10));  
 
//  if((mouseX == centX) && (mouseY < centY)   
//    || (mouseX - 1 == centX) && (mouseY < centY) ||   
//    (mouseX -2 == centX) && (mouseY < centY)  
//    || (mouseX - 3 == centX) && (mouseY < centY) ||   
//    (mouseX -4 == centX) && (mouseY < centY)  
//    || (mouseX - 5 == centX) && (mouseY < centY) ||   
//    (mouseX -6 == centX) && (mouseY < centY)  
//    || (mouseX - 7 == centX) && (mouseY < centY) ||   
//    (mouseX -8 == centX) && (mouseY < centY)) {  
//    gameOver(); 
//    mouseX = centX; 
//     
//      
//     
// 
//  } 
 
 
 
}  
 
void drawCircle() {  
  fill(255, circlefill);  
  stroke(0, circlefill);  
  ellipse(circleX, circleY, s, s);  
  noStroke();  
  //  timer ++;  
  //  if(timer >= 500) {  
  //    circlefill = 0;     
  //  }  
}  
 
void drawCircle1() {  
  r = (int) rand;  
  fill(255, circlefillone);  
  stroke(0, circlefillone);  
  ellipse(circle1X, circle1Y, s, s);  
  noStroke();  
}  
 
void drawGame() { 
  redraw(); 
  background(200);  
  fill(0); 
  textSize(12); 
  text( "LEVEL: " + level, 10, 20);  
  textSize(10); 
  fill(0); 
  text( "SCORE: " + score, 10, 35);  
  //fill(255, 100);  
  //rect(0,0,width, height);  
 
 
  if(mousePressed == true) {  
    if(overCircle(circleX, circleY, s)) {  
      circlefill = 0;   
      score += 1; 
    }  
    else if(overCircle(circle1X, circle1Y, s)) {  
      circlefillone = 0; 
      score += 1;  
    }  
  }  
 
 
  if(score >= 20) { 
    s = 45; 
    level = 2; 
    springing = .0007; 
 
    if( score >= 30) { 
      s = 40; 
      level = 3; 
      springing = .0008; 
    }  
    if( score >= 40) { 
      s = 35; 
      level = 4; 
      springing = .0009; 
    }  
    if( score >= 50) { 
      s = 30; 
      level = 5; 
      springing = .0010; 
 
    }  
    if( score >= 60) { 
      s = 25; 
      level = 6; 
      springing = .00105; 
    }  
    if( score >= 70) { 
      s = 20; 
      level = 7; 
      springing = .0011; 
    }  
    if( score >= 80) { 
      s = 15; 
      level = 8; 
      springing = .00115; 
    }  
    if( score >= 90) { 
      s = 10; 
      level = 9; 
      springing = .0012; 
    }  
    if( score >= 100) { 
      s = 5; 
      level = 10; 
      springing = .00125; 
    } 
  } 
 
  println("score" + score + "s" + s ); 
 
  drawCircle();  
  drawCircle1();  
 
  if(circlefill <= 0) {  
    circleX = random(50,600);  
    circleY = random(50,300);  
    circlefill = 255;  
  }  
 
  if(circlefillone <= 0) {  
    circle1X = random(50,600);  
    circle1Y = random(50,300);  
    circlefillone = 255;  
  }  
 
  footstep -= 2;  
  footstep1 -= 2;  
 
  if(footstep1 == 60) {  
 
    footstep = 254;  
 
  }  
  pushMatrix();  
  translate(-10,0);  
  drawShape();  
  moveShape();  
  popMatrix();  
 
  if(footstep == 60) {  
    footstep1 = 254;  
  }  
 
  drawShape2();  
  moveShape();  
 
  println("score" + score + "s" + s ); 
  // println("footstep = " + footstep + " footstep1 = " + footstep1);  
} 
 
void gameintro() { 
  background(200);  
  fill(255); 
  stroke(0); 
  ellipse(270, 195, 25, 25); 
  fill(0); 
  strokeWeight(1); 
  textSize(16); 
  text( " TARGET PRACTICE & AVOID GETTING HIT ", 10, height/2); 
  text( " CLICK ON THE WHITE CIRCLE ", 50, 200); 
  text( " DONT TOUCH OR CROSS THE BLACK LINE THAT FOLLOWS YOU ", 80, 230); 
  text( " CLICK ANYWHERE TO START ", 470, 300); 
  line( 400, 0, 400, 210); 
  stroke(0, 50); 
  line( 410, 0, 410, 210); 
  fill(0,0); 
  rect(s1x, s1y, s1w, s1h); 
 
 
 
 
} 
 
void gameOver() { 
  redraw(); 
  background(200);  
  fill(255); 
  stroke(0); 
  //ellipse(270, 195, 25, 25); 
  fill(0); 
  strokeWeight(1); 
  textSize(16); 
  text( "GAME OVER ", 50, height/2); 
//  text( "SCORE: " + score, 50, 200); 
//  text( "LEVEL: " + level, 50, 220); 
  text( "MOUSE ROLLOVER HERE TO RESTART ", 400, 300); 
  line( 400, 0, 400, 210); 
  stroke(0, 50); 
  line( 410, 0, 410, 210); 
  fill(0,0); 
  //stroke(0,0); 
  stroke(0, 0); 
  rect(s2x, s2y, s2w, s2h); 
  score = 0; 
  level = 1;   
  s = 50; 
  springing = .0006;
  } 
  //delay(500000); 


