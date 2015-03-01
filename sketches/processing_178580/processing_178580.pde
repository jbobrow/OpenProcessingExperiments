
float delta = 5;
float r = 50;
int stepX =0, stepY = 0;
PImage img;
boolean goDown = true;
boolean goRight = true;
color cHeart = color(255,0,0);
void setup() {  
  size(1000, 500, P3D);

  frameRate(60);
}
void draw() {
 background(#1876A0);
  pushMatrix();
 
  popMatrix();
  translate(width/2, height/4, 0);
  
  
  

  translate(mouseX-500,mouseY-200,0);
  
  rotateY(radians(mouseX));
  rotateX(radians(mouseY));

 

  stroke(#F51919);
  strokeWeight(5);
  for (float deg2 =0; deg2 < 180; deg2 += delta) {
    float theta = radians(deg2);
    for (float deg = 0; deg < 360; deg +=delta) {
      if (deg<30 || deg>330) {
        stroke(0);
        heart();
      } else if (deg<45 || deg>315) {
        stroke(0);
      } else
        stroke(255);

      float phi = radians(deg);
      float x = r * sin(phi)*cos(theta);
      float y = r * sin(phi)*sin(theta);
      float z = r * cos(phi);
      point(x, y, z);
    }
  }

  pushMatrix();
  translate(0, height/5, 0);
  fill(#3DB934);
  stroke(#FF030B);

  box(100);
  popMatrix();

  pushMatrix();
  translate(-50, height/5, 0);
  fill(#05FCFA);
  stroke(#051FFC);
  box(50);
  popMatrix();

  pushMatrix();
  translate(50, height/5, 0);
  fill(#FF836A);
  stroke(#F05A30);
  box(50);
  popMatrix();
  
  pushMatrix();
  translate(-50, height/3, 0);
  fill(#FFF308);
  stroke(#FF9008);
  scale(1,1,2);
  box(60);
  popMatrix();
  
  pushMatrix();
  translate(50, height/3, 0);
  fill(#FF74F8);
  stroke(#C529FF);
  scale(1,1,2);
  box(60);
  popMatrix();
  
  
}

void heart()
{ 
  if (mousePressed)
    cHeart = color(random(0,255),random(0,255),random(0,255));
  
  float a=0;
  float b=0;
  fill(cHeart);
  beginShape();
  noStroke();
  vertex(a, b);
  bezierVertex(a+6, b-40, a+40, b-6, a, b+20);
  bezierVertex(a-40, b-6, a-6, b-40, a, b);
  endShape();
}

