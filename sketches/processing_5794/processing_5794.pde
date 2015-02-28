
// Robot Exercise 5: Parameterize 11/8/09

float bodyX = 90.0;;
float bodyY = 151.0;
float bodyWidth = 86.0;
float bodyHeight = 176.0;
float scaler = 2;
float rx = random(-2,2); // ear
float ry = random(-2,2); // motor 1
float rt = random(-2,2); // motor 2
float rh = random(-2,2); // motor 3

PImage worldview2;
PImage visor1;
PImage lazer;
PImage nogun;
boolean vector = false;


void setup() {
  size(480, 320);
  frameRate(10);
  smooth();
  noCursor ();
  worldview2 = loadImage("worldview2.png");
  visor1 = loadImage("visor1.png");
  lazer = loadImage("lazer.png");
  nogun = loadImage("nogun.png");
  
}
//moving motor & ear piece
float angle;
float jitter;


void draw() {
  // background pic world view
  background(worldview2);
  
  if(second()%2 == 0){
    jitter = (random(-0.1, 0.1));
  }
  angle = angle + jitter;
  ellipseMode(CENTER);

//scaler    
    scale (1/ scaler);
    
    
//functions
  drawB(bodyX, bodyY); // ellipse body
  drawH(bodyX, bodyY); // ellipse head
  drawV(bodyX, bodyY); // visor rect
  drawE(bodyX, bodyY); // ellipse ear
//  drawA(bodyX, bodyY); // ellipse arm
  drawMm(bodyX,bodyY); // ellipse motor1
  drawMmm(bodyX,bodyY); // ellipse motor2
  drawMmmm(bodyX,bodyY); // ellipse motor2

}

void drawB(float bodyX, float bodyY){ // body

  fill(mouseX, mouseY,255);
  stroke(0);
  strokeWeight(5);
  ellipse (bodyX,bodyY,bodyWidth,bodyHeight);


}

void drawH(float bodyX, float bodyY){ // head

  fill(255);
  stroke(0);
  strokeWeight(5);
  ellipse (bodyX - 3, bodyY - 59, bodyWidth + 64, bodyHeight - 51);

}

void drawE(float bodyX, float bodyY){ // ear

  fill(255);
  stroke(0);
  strokeWeight(4);
  float rx = random(-2,2);
  ellipse(bodyX - 65 + rx, bodyY - 59, bodyWidth - 62, bodyHeight - 151);

}

void drawV(float bodyX, float bodyY){ // visor

  fill(0);
  rect(bodyX - 38, bodyY-69, bodyWidth +34, bodyHeight - 134);


//}
//void drawA(float bodyX, float bodyY){ // arm
//
//  fill(255);
//  stroke(0);
//  strokeWeight(5);
//  ellipse(bodyX - 31 , bodyY + 37, bodyWidth - 58, bodyHeight - 108);

}
void drawMm(float bodyX, float bodyY){ // motor1
  frameRate(40);

  fill(0);
  strokeWeight(2);
  float ry = random(-2,2);
  ellipse(bodyX -1 + ry ,bodyY +95 ,26,4);
}

void drawMmm(float bodyX, float bodyY){ // motor2
  frameRate(40);
  fill(0);
  strokeWeight(2);
  ellipse(bodyX -1 + rt,bodyY +101 ,20,4);
  float rh = random(-2,2);
}

void drawMmmm(float bodyX, float bodyY){ // motor3
  frameRate(40);

  fill(0);
  strokeWeight(2);
  float rh = random(-2,2);
  ellipse(bodyX -1 +rh ,bodyY +107 ,14,4);
  
  
// visor change
  if(vector == true) {
    image(visor1, bodyX - 38, bodyY-69, bodyWidth +34, bodyHeight - 134);
  }

   if(vector == true) {
    image(lazer ,bodyX -31 , bodyY + 7, bodyWidth - 18, bodyHeight - 138);
   }
    else

    image(nogun ,bodyX -31 , bodyY + 7, bodyWidth - 58, bodyHeight - 108);
  }

  void mouseMoved() {
  
   bodyX = mouseX * scaler ; 
   bodyY = mouseY * scaler ;

  scaler = map(mouseY,0, height, 12.0, 0.5); 

 
}
void keyPressed() {

  if(key == ' ') {
    if(vector == false) {
      vector = true;
    }
    else {
      vector = false;
    }
  }
}


