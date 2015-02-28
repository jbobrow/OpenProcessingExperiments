
// to use an image in processing you need to use a PImage
PImage[] susuwatari = new PImage[15];

float drawX = 0.0;// x location
float drawY = 0.0;// y location
float drawA = 0.0;// angle
float initA = 0.0;
float drawS = 1.0;// scale
int r = -1;
 
float drawXmov = 0.0;// change in x location
float drawXmovChg = 0.0;// change in x location
float drawYmov = 0.0;// change in y location
float drawYmovChg = 0.0;// change in y location
float drawArot = 0.0;// change in angle
float drawSrat = 0.0;// change in scale
int angleCount = 0, drawCount = 0;

void setup() {
  size(600, 600);
  smooth();
  background(255);
  fill(0, 102, 153);
  text("click to start", 15, 60, 80, 80);

  
  for (int p=0; p < 15; p++) {
    susuwatari[p] = loadImage((p+1) + ".gif");
  }
}

void draw() {
  r++;
  if (r >= 15) {
     r = 0; 
  }
 
  if (drawCount % 8 == 0) {
      angleCount++;
      pushMatrix();
      translate(width/2, height/2);
      if (drawCount % 3 == 0)
        rotate(radians(angleCount * 20));
      else
        rotate(radians(angleCount * 90));
      updateSusu();
      renderSusu();
      popMatrix();
  }
}
 
void mousePressed() {
  background(255);
  initSusu();
}
 
void initSusu() {
  
  drawX = 0;
  drawY = 0;
  //drawX = random(width);
  //drawY = random(height);
   
  drawA++;
  drawS = 0.50;
   
  initA += 2.0;
 
  drawXmov = sin( radians(initA) ) * 7.0;
  drawXmovChg = random( -0.03, 0.03);
  drawYmov = cos( radians(initA) ) * 7.0;
  drawYmovChg = random( -0.03, 0.03);
  drawArot = 5.0;
  drawSrat = random(-0.009, -0.001);
}
 
void updateSusu() {
  // update positional values
  drawX += drawXmov;
  drawY += drawYmov;
  //drawXmov += drawXmovChg;
  //drawYmov += drawYmovChg;
  drawA += drawArot;
  drawS += drawSrat;
 
  // check to see if draw is out of bounds
  if (drawS <= 0.01) {
    initSusu();
  }
  else if ( drawX < -susuwatari[r].width/2 || drawX >= width + (susuwatari[r].width/2)) {
    initSusu();
  }
  else if ( drawY < -susuwatari[r].height/2 || drawY >= height + (susuwatari[r].height/2)) {
    initSusu();
  }
}
 
void renderSusu() {
  
  if(drawX == 0 || drawY == 0) {
     return; 
  }
  
  pushMatrix();
  translate(drawX, drawY);
  rotate(radians(drawA));
  image(susuwatari[r], 0, 0, susuwatari[r].width * drawS, susuwatari[r].height * drawS );// image(PImage, x, y);
  popMatrix();
}


