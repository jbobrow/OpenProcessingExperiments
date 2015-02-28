

void setup() {
  size(580,580);
  smooth();
  noLoop();
  background(220);
}

void draw() {
  noStroke();

  for(int i=0;i<width-150;i+=170) {
    for(int j=0;j<height-150;j+=170) {
      float r=random(200);
      float s=random(0.6,2.2);
      int ran=int(random(200));
      int t=int(random(100));
      drawNote(i+70,j+160,r,s,ran);
    }
  }
}

void drawNote(int poX,int poY, float ro,float scal,int ran) {
  stroke(84,64,0);
  strokeWeight(2);

  randomSeed(ran);
  float colorR=random(255);
  float colorG=random(255);
  float colorB=random(255);


  pushMatrix();
  translate(poX,poY);
  rotate(PI/ro);
  scale(scal);
  beginShape();

  fill(colorR,colorG,colorB);  
  ellipse(0, 0,30,20);
  ellipse(40,0,30,20);

  line( 15,0, 15,-50);
  line( 55,0, 55,-50);
  strokeWeight(5);
  strokeCap(PROJECT);
  line( 16,-50, 54,-50);
  strokeWeight(1.6);
  line( 16,-42, 54,-42);
  noStroke();
  fill(255,255,255,100);
  ellipse(-3,-3,18,10);
  ellipse(38,-3,18,10);
  fill(255,255,255,200);
  ellipse(-5,-5,5,3);
  ellipse(38,-5,5,3);
  fill(255,255,255,100);
  ellipse(30,-50,30,2);
  endShape();
  popMatrix();
}


