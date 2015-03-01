
float delta = 40;
float delta2= 60;
float delta3 = 55;
float delta4=99;
float r = 150;
float r2= 190;
float r3 = 60;
float r4= 130;
float degX;
float degY;
float degZ;
float X1, Y1=10;
int MAX = 648;
int xLocation = 47; 
PVector[] pos;
float movingEar;
float movingFeet;
float movingTail;
float movingFace;
boolean isFeetUp= true;
boolean isEarUp = true;
boolean isTailUp= true;
boolean isFaceUp=true; 

 
 
color strokeColor = color(255,0,0);
 
void setup() {
  size(600, 600, P3D);
  frameRate(60);
 // noFill(); 
  
  pos = new PVector[MAX];
}
void draw() {
 
  background(0);
  
 
  if (mousePressed) {
 
    if (movingEar>50) isEarUp = false;
    else if (movingEar<0) isEarUp = true;
 
    if (isEarUp)
      movingEar++;
    else
      movingEar--;
  }
 
  if (keyPressed) {
     if( key == 'n'){
   noFill();
   
     } 
   if( key == ' '){
      shakeFeet();
      xLocation+=5; 
    }
    
  if  (key == 'f' || key == 'f') {
      shakeFace();
    }
    
  if (key == 'b' || key == 'B') {
      shakeFeet();
    }
    if  (key == 't' || key == 't') {
      shakeTail();
    }
    
  }
  
  
    

 
  
  rotateY(radians(mouseY));
 
 
  translate(width/2, height/2, 0);
 
  translate(0, 0, xLocation); 
 // noStroke();
  stroke(strokeColor);
 // fill(200,100,0);
  strokeWeight(1);
  
  drawFace(0, 0);
  drawEar(-64, -150, -185, 0, -175);
  drawEar(64, -150, -185, 0, -175);
  drawBody(-2, 170, -280);
  
  
 
  println(-mouseX+" , "+-mouseY);
} 
 
void shakeFeet(){
  if (movingFeet>6) isFeetUp = false;
      else if (movingFeet<0) isFeetUp = true;
 
      if (isFeetUp)
        movingFeet++;
      else
        movingFeet--;
  
}

void shakeFace(){
    if (movingFace>5) isFaceUp = false;
    else if (movingFace<0) isFaceUp = true;
 
    if (isFaceUp)
      movingFace++;
    else
      movingFace--;
  }

void shakeTail(){
    if (movingTail>50) isTailUp = false;
    else if (movingTail<0) isTailUp = true;
 
    if (isTailUp)
      movingTail++;
    else
      movingTail--;
  }

 
void drawFace(float posX, float posY) {
 
  pushMatrix();
  translate(posX, posY, 0);
 
  rotateX(radians(degX+movingFace));
  rotateY(radians(degY));
  rotateZ(radians(degZ));
  
   
  
  beginShape(TRIANGLE_STRIP);
  for (float deg2 =0; deg2 < 180; deg2 += delta) {
    float phi = radians(deg2);
    for (float deg = 0; deg < 360; deg +=delta) {
      float theta = radians(deg);
      float x = r * sin(phi)*cos(theta);
      float y = r * sin(phi)*sin(theta);
      float z = r * cos(phi);
      vertex(x, y, z);
 
      float phi2 = radians(deg2+delta);
      x = r * sin(phi2)*cos(theta);
      y = r * sin(phi2)*sin(theta);
      z = r * cos(phi2);
      vertex(x, y, z);
    }
  }
  endShape(CLOSE);
  popMatrix();
}
 
void drawEar(float x, float y, float degX, float degY, float degZ) {
  pushMatrix();
 
  translate(x, y, 0);
  rotateX(radians(degX +movingEar));
  rotateY(radians(degY));
  rotateZ(radians(degZ));
 
  rotateX(PI/2);
  rotateZ(-PI/6);
 
  beginShape(TRIANGLE_STRIP);
  vertex(-50, -50, -50);
  vertex( 50, -50, -50);
  vertex(   0, 0, 50);
 
  vertex( 50, -50, -50);
  vertex( 50, 50, -50);
  vertex(   0, 0, 50);
 
  vertex( 50, 50, -50);
  vertex(-50, 50, -50);
  vertex(   0, 0, 50);
 
  vertex(-50, 50, -50);
  vertex(-50, -50, -50);
  vertex(   0, 0, 50);
  endShape(CLOSE);
 
  popMatrix();
}
 
void drawBody(float posX, float posY, float posZ) {
 
  pushMatrix();
  translate(posX, posY, posZ);
  
  beginShape(TRIANGLE_STRIP);
  for (float deg2 =0; deg2 < 180; deg2 += delta2) {
    float phi = radians(deg2);
    for (float deg = 0; deg < 360; deg +=delta2) {
      float theta = radians(deg);
      float x = r2 * sin(phi)*cos(theta);
      float y = r2 * sin(phi)*sin(theta);
      float z = r2 * cos(phi)*1.5;
      vertex(x, y, z);
 
      float phi2 = radians(deg2+delta2);
      x = r2 * sin(phi2)*cos(theta);
      y = r2 * sin(phi2)*sin(theta);
      z = r2 * cos(phi2) * 1.5;
      vertex(x, y, z);
    }
  }
  endShape(CLOSE);
 
  drawFeet(-160, 65, 200);
  drawFeet(160, 65, 200);
  drawFeet(-160, 65, -200);
  drawFeet(160, 65, -200);
  drawTail(54,-108,-320);
  popMatrix();
}
 
void drawFeet(float posX, float posY, float posZ) {
  pushMatrix();
  translate(posX, posY, posZ);
 
  rotateY(radians(degY +movingFeet));
  rotateX(radians(degX));
  rotateZ(radians(degZ));
 
  rotateX(PI/2);
  rotateZ(-PI/6);
 
  rotateY(0.75); 
  beginShape(TRIANGLE_STRIP);
  for (float deg2 =0; deg2 < 180; deg2 += delta3) {
    float phi = radians(deg2);
    for (float deg = 0; deg < 360; deg +=delta3) {
      float theta = radians(deg);
      float x = r3 * sin(phi)*cos(theta);
      float y = r3 * sin(phi)*sin(theta);
      float z = r3 * cos(phi);
      vertex(x, y, z);
 
      float phi2 = radians(deg2+delta);
      x = r3 * sin(phi2)*cos(theta);
      y = r3 * sin(phi2)*sin(theta);
      z = r3* cos(phi2);
      vertex(x, y, z);
    }
  }
  
  endShape(CLOSE);
  popMatrix();
}
 
 void drawTail(float posX, float posY, float posZ) {
  pushMatrix();
  translate(posX, posY, posZ);
 
  rotateY(radians(degY +movingTail));
  rotateX(radians(degX));
  rotateZ(radians(degZ));
 
  rotateX(PI/2);
  rotateZ(-PI/6);
 
  rotateY(0.75); 
  beginShape(TRIANGLE_STRIP);
  for (float deg2 =0; deg2 < 180; deg2 += delta4) {
    float phi = radians(deg2);
    for (float deg = 0; deg < 360; deg +=delta4) {
      float theta = radians(deg);
      float x = r4 * sin(phi)*cos(theta);
      float y = r4 * sin(phi)*sin(theta);
      float z = r4 * cos(phi);
      vertex(x, y, z);
 
      float phi2 = radians(deg2+delta4);
      x = r4 * sin(phi2)*cos(theta);
      y = r4 * sin(phi2)*sin(theta);
      z = r4* cos(phi2)*0.9;
      vertex(x, y, z);
    }
  }
  
  endShape(CLOSE);
  popMatrix();
}
 

