

int startThirdEye = 2000;
int endThirdEye = 12000;
int timeReset = 0;
int blinkReset = 2050;
float angle = 0;
int ctr = 0;
String ls = "sungl";
String rs = "ASSES";

void setup (){
  size (800, 800);
  smooth();
  
  float x = width/2;
  float y = height/2;
  makeGlasses(x, y);
}

void draw (){
  background (200);
  float x = width/2;
  float y = height/2;
  makeGlasses(x, y);
/*  int currentTime = millis();
  println(currentTime);
  if (currentTime > startThirdEye) {
      fill(0);
  rect(width/2 - 275, height/2 - 80, 200, 115);
  rect(width/2 + 75, height/2 - 80, 200, 115);
  
} else if (currentTime > blinkReset) {
    currentTime -= startThirdEye;
    fill(255);
    rect(width/2 - 275, height/2 - 80, 200, 115);
    rect(width/2 + 75, height/2 - 80, 200, 115);
    currentTime = timeReset;
  } else {*/
  if (mousePressed && (mouseButton == LEFT)){
    glassWrite(ls, rs, 64);
  }else{
  // redraw the white rectangle backgrounds
  fill(255);
  rect(width/2 - 275, height/2 - 80, 200, 115);
  rect(width/2 + 75, height/2 - 80, 200, 115);
  float lx = map(mouseX, 0, width, 150, 300); 
  float ly = map(mouseY, 0, height, 345, 410);
  float rx = map(mouseX, 0, width, 500, 650); 
  float ry = map(mouseY, 0, height, 345, 410);
   eye (lx, ly);
   eye (rx, ry);

  
  }
//  }
}

void eye (float x, float y) {
  pushMatrix();
  if (mousePressed && (mouseButton == CENTER)){
    translate(mouseX, mouseY);
  } else{
    translate(x, y);
  }
    if (mousePressed && (mouseButton == RIGHT)){
      fill(0, 0, 255, random(255));
    float loop = 50f/random(1,50);
   for (int i = 50; i > 1; i-= loop){
     strokeWeight(.1);
     ellipse (0, 0, i, i);
     rotate(random(TWO_PI));
     fill(random(255), random(255), random(255), random(255));
   }  
    }else{
    int ctr = 1;
    for (int i = 50; i > 0; i -= 10){
     if (ctr == 0){ 
       fill(255);
       ctr ++;
     } else {
       fill (0, 220);
       ctr = 0;
     } 
     ellipse (0, 0, i, i);
    }
    }
    popMatrix();
  if (mousePressed && (mouseButton == CENTER)){
    glassWrite("WTF", "Cyclops", 50);
  }
}

void makeGlasses(float x, float y){
  fill(0);
  rect(x - 300, y - 100, 250, 150);
  rect(x + 50, y - 100, 250, 150);
  fill(255);
  rect(x - 275, y - 80, 200, 115);
  rect(x + 75, y - 80, 200, 115);
  fill(0);
  arc(x, y - 10, 100, 75, PI, TWO_PI);
  fill(200);
  arc(x, y, 100, 75, PI, TWO_PI);
}

void glassWrite(String ls, String rs, int size){
fill(0);
  rect(width/2 - 275, height/2 - 80, 200, 115);
  rect(width/2 + 75, height/2 - 80, 200, 115);
  fill(255);
  textSize(size);
  text(ls, width/2 - 275, height/2);
  text(rs, width/2 + 75, height/2);
}


void openThirdEye () {
  pushMatrix();
    translate(width/2, height/2 - 200);
    beginShape();
      for (int i=0; i<360; i++){
        int r = 50;
    float x = cos( radians(i) ) *r;
    float y = sin( radians(i) ) *r;
      vertex (x,y);
      }
    endShape();
  popMatrix();
}

void closeThirdEye () {
  pushMatrix();
    ellipse (50, 50, 10, 10);
  popMatrix();
}

