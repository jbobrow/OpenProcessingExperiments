
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Written by Sasa Zivkovic 
// No.mad discourse | www.nomaddiscourse.com
// No.mad process | www.nomadprocess.com
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
int x = 500;
int y = 500;
float b = 3000;
float f;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////
void setup() {
  size(1000, 500);
  background(0);
  smooth();
  strokeWeight(0.1);
  frameRate(20);
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////
void draw() {
  
  stroke(255, 100);
   f += 1;
  if (f == 90) {
    f = 0;
  }
   
  float b1 = map(mouseX, 0, 1000, 10, 100);
  b = b1;

  pushMatrix();
  translate(0, 250);
  rotate(radians(0));
  drawY(0, 0, b+f, radians(0));
  popMatrix();
 
  pushMatrix();
  translate(1000, 250);
  rotate(radians(180));
  drawY(0, 0, b+f, radians(0));
  popMatrix();
  
  fill(0, 10);
  noStroke();
  rect(0,0, width, height);
  noFill();
  
  
  ///// mouse indicator bar bottom 
  fill(0);
  rect(0, 500-10, width, height);
  //rect(1000-10, 0, width, height);
  //rect(0, 0, width, 10);
  //rect(0, 0, 10, height);
  fill(255);
  ellipse(mouseX, 500-5, 4, 4);
  //ellipse(mouseX, 5, 4, 4);
  //ellipse(1000-5, mouseY, 4, 4);
  //ellipse(5, mouseY, 4, 4);
  textSize(8);
  fill(255);
  text(">>", mouseX+10, 500-2);
  text("<<", mouseX-20, 500-2);
  
  ///// rounded rectangles 
  fill(255);
  noStroke();
  beginShape();
  int v = 10;
  vertex(width-v, 0);
  bezierVertex(width-v/2, 0, width, 0+v/2, width, v);
  vertex(width, 0);
  endShape();
  beginShape();
  vertex(v, 0);
  bezierVertex(v/2, 0, 0 , v/2, 0, v);
  vertex(0, 0);
  endShape();
  beginShape();
  vertex(v, height);
  bezierVertex(v/2, height, 0 , height- v/2, 0, height - v);
  vertex(0, height);
  endShape();
  beginShape();
  vertex(width-v, height);
  bezierVertex(width-v/2, height, width, height-v/2, width, height-v);
  vertex(width, height);
  endShape();
  noFill();
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////
void drawY(float x, float y, float b, float num) {

  float s1 = map(mouseX, 0, 1000, 1, 50);
  float s2 = f;

  num+=radians(0);
  
  float newx = x+cos(num)*s2;
  float newy = y+sin(num)*s2;
  
  float dist1 = dist(mouseX, mouseY, newx, newy);
  float map1 = map(dist1, 0, 1000, 0.1, 1.5);
  
  line(x*map1,y*map1,newx*map1,newy*map1);

  if(b > 2){
   drawY(newx, newy, b*0.5, num+radians(s1));
   drawY(newx, newy, b*0.5, num-radians(s1));
   drawY(x, y, b*0.2, num+radians(s1));
   drawY(x, y, b*0.2, num-radians(s1));
  }
}

