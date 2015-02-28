
//source for the falling hearts http://www.openprocessing.org/sketch/47270
PImage img;
PImage img2;
  
float x = 0;
float y = 0;
 
float hs = random(2, 1.5);
float c = random(36);
 
void setup() {
  size(600, 400);
  colorMode(HSB, 360, 100, 100);
  smooth();
  noStroke();
 
  x = random(hs*50, width-hs*50);
  
  img= loadImage("IMG_5566_b.jpg");
  image(img,0,0);
}
 
void draw() {
  background(img);
  noStroke();
 
  //fill(0, 0, 0, 90);
  rect(0, 0, width, height);
  
 
  pushMatrix();
  translate(x, y);
  scale(hs);
  strokeWeight(3);
  stroke(0, 0, 100);
  fill(c*10, 80, 100, 50);
  rotate(0.9*sin(y*0.01));
  heart(0, 0, 100, 100);
  popMatrix();
 
  //filter(BLUR, 0.1);
 
  y += 5;
 
  if (y > height+hs*100) {
    y = 0;
 
    hs = random(2, 1.2);
    x = random(hs*50, width-hs*50);
    c = random(36);
  }
  
  
  
  
}
  
 
//***************************************
// I referred to Proce55ing.walker,blog
// http://blog.p5info.com/?p=28
//***************************************
 
void heart(float centerX, float centerY, float width, float height) {
  final float WIDTH = width / 2 * 0.85;
  final float HEIGHT = height / 2;
  final float OFFSET = centerY - (HEIGHT / 6 * 5);
  beginShape();
  for (int i = 0; i < 30; i++) {
    float tx = abs(sin(radians(i * 12))) * (1 + cos(radians(i * 12))) * sin(radians(i * 12)) * WIDTH + centerX;
    float ty = (0.8 + cos(radians(i * 12))) * cos(radians(i * 12)) * HEIGHT + OFFSET;
    vertex(tx, ty);
  }
  endShape(CLOSE);
}



//similar code from one shown in the class pdf
void mouseMoved(){
 
  
  img2 = loadImage("blueheart.png");
  image(img2,mouseX,mouseY,25,25);
  image(img2,mouseX+25,mouseY+25,25,25);
  
  
  /*/if (mouseX>pmouseX){
    fill(#EE0000);
  }
  else if (mouseX<pmouseX){
    fill(#2BBE0B);
  }/*/
}

