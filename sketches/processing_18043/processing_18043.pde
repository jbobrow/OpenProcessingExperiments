
boolean slash    = false;
boolean shuriken = false;

int fieldX       = 200;
int fieldY       = 200;

int midFieldX    = fieldX/2;
int midFieldY    = fieldY/2;

int leftEarTop   = midFieldX-22;
int rightEarTop  = midFieldX+22;
int earTop       = midFieldY-82;
int earBottom    = midFieldY-65;

int headChinX    = midFieldX;
int headBrowY    = midFieldY-51;

int torsoX       = midFieldX;
int torsoY       = midFieldY-18;

int mouthX       = midFieldX;
int mouthY       = midFieldY-30;
int mouthDiam    = 52;
int mouthGuardX  = midFieldX;
int mouthGuardY  = midFieldY-45;
int mouthGuardW  = 64;
int mouthGuardH  = 30;
  
int teethX       = midFieldX;
int teethY       = midFieldY-27;
int teethWidth   = 13;
int teethHeight  = 6;
  
int noseX        = midFieldX;
int noseY        = midFieldY-33;

int bandX        = midFieldX;
int bandY        = midFieldY-58;
int bandWidth    = 70;
int bandHeight   = 14;
int bandTailX    = midFieldX-34;
int bandTailY    = midFieldY-52;
int bandCircX    = midFieldX;
int bandCircY    = midFieldY-58;
int bandCircDiam = 8;

int eyeX         = midFieldX;
int eyeY         = midFieldY-40;
int eyeDiam      = 14;

int eyeShineX    = midFieldX;
int eyeShineY    = midFieldY-44;
int eyeShineD    = 3;
  
int shirtX       = midFieldX;
int shirtY       = midFieldY+12;

int pantsX       = midFieldX;
int pantsY       = midFieldY+30;

int feetX        = midFieldX;
int feetY        = midFieldY+60;

int beltX        = midFieldX;
int beltY        = midFieldY+34;
int beltWidth    = 40;
int beltHeight   = 8;
  
int whiskLStart  = midFieldX-32;
int whiskLEnd    = midFieldX-52;
int whiskRStart  = midFieldX+32;
int whiskREnd    = midFieldX+52;
int whiskY       = midFieldY-25;

int furR         = 239; 
int furG         = 171;
int furB         = 118;
int innerEarR    = 247;
int innerEarG    = 220;
int innerEarB    = 232;
int accentR      = 255; 
int accentG      = 0;
int accentB      = 0;
int detailR      = 255; 
int detailG      = 242;
int detailB      = 0;
int black        = 0;
int white        = 255;

int shurikenX    = 100;
int shurikenY    = 100;
int shurSize     = 3;
int shurPoint    = shurSize*4;
float shurDiam   = shurSize*1.75;


void setup() {
  size(200,200);
  smooth();
  noCursor();
}

void draw() {
  background(white);
  rectMode(CENTER);
  ellipseMode(CENTER);
  noStroke();
  
  // EARS
  fill(furR,furG,furB);
  triangle(leftEarTop-13,earBottom,leftEarTop+13,earBottom,leftEarTop,earTop);
  triangle(rightEarTop-13,earBottom,rightEarTop+13,earBottom,rightEarTop,earTop);
  fill(innerEarR,innerEarG,innerEarB);
  triangle(leftEarTop-9,earBottom,leftEarTop+9,earBottom,leftEarTop,earTop+5);
  triangle(rightEarTop-9,earBottom,rightEarTop+9,earBottom,rightEarTop,earTop+5);
  
  // HEAD
  fill(furR,furG,furB);
  beginShape();
    vertex(headChinX+35,headBrowY);
    vertex(headChinX+37,headBrowY+35);
    vertex(headChinX,headBrowY+56);
    vertex(headChinX-37,headBrowY+35);
    vertex(headChinX-35,headBrowY);
  endShape(CLOSE);
  
  // TORSO
  fill(furR,furG,furB);
  triangle(torsoX,torsoY,torsoX-35,torsoY+48,torsoX+35,torsoY+48);
  
  // MOUTH
  fill(black);
  ellipse(mouthX,mouthY,mouthDiam,mouthDiam);
  fill(furR,furG,furB);
  rect(mouthGuardX,mouthGuardY,mouthGuardW,mouthGuardH);
  
  // TEETH
  fill(white);
  rect(teethX,teethY,teethWidth,teethHeight);
  
  // NOSE
  fill(accentR,accentG,accentB);  
  triangle(noseX-3,noseY-4,noseX+3,noseY-4,noseX,noseY);
  
  // HEADBAND
  fill(accentR,accentG,accentB);
  rect(bandX,bandY,bandWidth,bandHeight);
  triangle(bandTailX,bandTailY,bandTailX-21,bandTailY+4,bandTailX-18,bandTailY+10);
  triangle(bandTailX,bandTailY,bandTailX-17,bandTailY+12,bandTailX-13,bandTailY+18);
  
  // HEADBAND DETAIL
  fill(white);
  ellipse(bandCircX,bandCircY,bandCircDiam,bandCircDiam);

  // EYES
  fill(black);
  ellipse(eyeX-20,eyeY,eyeDiam,eyeDiam);
  ellipse(eyeX+20,eyeY,eyeDiam,eyeDiam);
  
  // EYE SHINE
  fill(white);
  ellipse(eyeShineX-23,eyeShineY,eyeShineD,eyeShineD);
  ellipse(eyeShineX+17,eyeShineY,eyeShineD,eyeShineD);
  
  // SHIRT
  fill(black);
  beginShape();
    vertex(shirtX-20,shirtY+18);
    vertex(shirtX-28,shirtY+8);
    vertex(shirtX-15,shirtY-10);
    vertex(shirtX,shirtY);         // NECKCENTER
    vertex(shirtX+15,shirtY-10);
    vertex(shirtX+28,shirtY+8);
    vertex(shirtX+20,shirtY+18);
  endShape(CLOSE);

  // PANTS
  fill(black);
  beginShape();
    vertex(pantsX-20,pantsY);
    vertex(pantsX-20,pantsY+30);
    vertex(pantsX-3,pantsY+30);
    vertex(pantsX,pantsY+26);      // ZIPPERCENTER
    vertex(pantsX+3,pantsY+30);
    vertex(pantsX+20,pantsY+30);
    vertex(pantsX+20,pantsY);
  endShape(CLOSE);
  
  // FEET
  fill(furR,furG,furB);
  triangle(feetX-20,feetY,feetX-3,feetY,feetX-12,feetY+15);
  triangle(feetX+20,feetY,feetX+3,feetY,feetX+12,feetY+15);
  
  // BELT
  fill(accentR,accentG,accentB);
  rect(beltX,beltY,beltWidth,beltHeight);
  
  // BELT DETAIL
  fill(detailR,detailG,detailB);
  ellipse(beltX,beltY,beltWidth/2,beltHeight*2);
  
  // WHISKERS
  stroke(black);
  strokeWeight(1);
  line(whiskLStart,whiskY-3,whiskLEnd,whiskY-8);
  line(whiskLStart,whiskY,whiskLEnd,whiskY);
  line(whiskLStart,whiskY+3,whiskLEnd,whiskY+8);
  line(whiskRStart,whiskY-3,whiskREnd,whiskY-8);
  line(whiskRStart,whiskY,whiskREnd,whiskY);
  line(whiskRStart,whiskY+3,whiskREnd,whiskY+8);
  
  // SWORD
  noStroke();
  fill(82,45,0);
  rect(mouseX,mouseY,6,16);
  fill(255,210,0);
  rect(mouseX,mouseY-8,12,4);
  fill(175);
  quad(mouseX-3,mouseY-10,mouseX+3,mouseY-10,mouseX+3,mouseY-56,mouseX-3,mouseY-49);
  
  // SLASH
  
  if (mousePressed) {
    slash = true;
  } else {
    slash = false;
  }
  
  if (slash) {
    stroke(accentR,accentG,accentB);
    strokeWeight(abs(pmouseX-mouseX)/2);
    line(pmouseX+3,pmouseY-56,mouseX+3,mouseY-56); 
  } else {
    noStroke();
  }
  
  if (keyPressed) {
    shuriken = true;
  } else {
    shuriken = false;
  }

  if (shuriken) {
    slash = false;
    fill(accentR,accentG,accentB);
    beginShape();
      vertex(shurikenX-shurSize,shurikenY-shurSize);
      vertex(shurikenX,shurikenY-shurPoint);
      vertex(shurikenX+shurSize,shurikenY-shurSize);
      vertex(shurikenX+shurPoint,shurikenY);
      vertex(shurikenX+shurSize,shurikenY+shurSize);
      vertex(shurikenX,shurikenY+shurPoint);
      vertex(shurikenX-shurSize,shurikenY+shurSize);
      vertex(shurikenX-shurPoint,shurikenY);
    endShape(CLOSE);
    fill(white);
    ellipse(shurikenX,shurikenY,shurDiam,shurDiam);
    
    shurikenX = int(random(0,fieldX));
    shurikenY = int(random(0,fieldY));
  } else {
  }  
  
}

