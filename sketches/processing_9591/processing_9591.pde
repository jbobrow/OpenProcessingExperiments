
//pikachu
float x,y,x2,y2;
int leftEyeY,leftEyeX,rightEyeY,rightEyeX, leftEyeW, leftEyeH, rightEyeW, rightEyeH;
color Yellow;
float d = dist(mouseX, mouseY, leftEyeX, leftEyeY);
float rd = dist(mouseX, mouseY, rightEyeX, rightEyeY);

void setup(){
  size(600,600);
  colorMode(HSB,360);
  background(60,360,360);
  frameRate(60);
/*

  x = 5*width/20-20;
  y = 2*height/5-10;
  x2 = 3*width/4-20;
  y2 = 2*height/5-10;
  
*/

leftEyeX=5*width/20;
leftEyeY=2*height/5;
leftEyeW=width/6;
leftEyeH=width/6;

rightEyeX=15*width/20;
rightEyeY=2*height/5;
rightEyeW=width/6;
rightEyeH=width/6;

Yellow = color(60,260,360);
}

void draw(){
  background(Yellow);
  smooth();
  
  //cheeks
  stroke(0);
  fill(0,360,360,210);
  ellipse(3*width/20,3*height/5,leftEyeW,leftEyeH);
  ellipse(17*width/20,3*height/5,rightEyeW,rightEyeH);
  
  //shadow
  noStroke();
  fill(20,360,60,60);
  curve(width/5,9*height/15,2*width/5,height/2,3*width/5,height/2,4*width/5,9*height/15);
  
  //eye black
  noStroke();
  fill(0);
  ellipse(leftEyeX,leftEyeY,leftEyeW,leftEyeH);
  fill(0);
  ellipse(rightEyeX,rightEyeY,rightEyeW,rightEyeH);
  
  //eye midtone
  fill(20,360,360,80);
  ellipse(leftEyeX,leftEyeY+18,leftEyeW/2,leftEyeH/2);
  fill(20,360,360,80);
  ellipse(rightEyeX,rightEyeY+18,rightEyeW/2,rightEyeH/2);
  
  //nose
  fill(0);
  triangle(28*width/60,11*height/20,width/2,4*height/7,32*width/60,11*height/20);
  
  //eye white
  fill(360);
  ellipse(x,y,width/15,width/15);
  ellipse(x2,y2,width/15,width/15);
  
 x = constrain(mouseX, (leftEyeX-25), (leftEyeX+25));
 y = constrain(mouseY, (leftEyeY-25), (leftEyeY+25));
 x2 = constrain(mouseX, rightEyeX-25, rightEyeX+25);
 y2 = constrain(mouseY, rightEyeY-25, rightEyeY+25);
  
  
  //mouth
  stroke(0);
  fill(Yellow);
  arc(53*width/120, 36*height/60, width/8, height/8, 0,PI/2);
  arc(53*width/120, 36*height/60, width/8, height/8, PI/2, PI);
  arc(67*width/120, 36*height/60, width/8, height/8, 0,PI/2);
  arc(67*width/120, 36*height/60, width/8, height/8, PI/2, PI);

fill(Yellow);
noStroke();
rect(29*width/60,35*height/60,height/25,width/25);
//  bezier(17*width/50, 7*height/10, 7*width/20, 8*height/10, 9*width/20, 8*height/10, width/2, 7*height/10);
  //  bezier(33*width/50, 7*height/10, 13*width/20, 8*height/10, 11*width/20, 8*height/10, width/2, 7*height/10);
  
}

void keyPressed(){
  if (key=='c')
  Yellow=color(randomInt(0,360),360,360);
}

int randomInt (int MIN, int MAX) {
  return floor(random(MIN, MAX+1));
}


