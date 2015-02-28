
void setup(){
  size(640,480);
  smooth();
  colorMode(HSB,360,100,100);
  frameRate(240);
  noCursor();
}


void draw(){
    noStroke();
  float pupilX1 = map(mouseX, 0,width, 260,320);
  float pupilX2 = map(mouseX, 0,width, 320,380);
  float pupilY = map(mouseY, 0,height, 220,260);
  background(120,60,80);
      //Body
  fill(1,0,50);
  ellipse(325,240,220,180);
      //WHITES
  fill(255,0,100);
  ellipse(290,240,100,100);
  ellipse(350,240,120,130);
      //IRIS
      float E = 200;
      float C = map(mouseX,0,width,0,360);
      float D = map(mouseY,0,height,0,360);
      float B = map(mouseX,0,width,50,100);
      float A = map(mouseY,0,width,30,70);
  if(mousePressed){
    E = frameCount;
    A = 100;
    B = 100;
  }
  if(frameCount==360){
    frameCount = 1;
  }
  fill(E,A,B);
  beginShape();
    vertex(310,240);
    bezierVertex(310,220,320,210,350,210);
    bezierVertex(380,210,390,220,390,240);
    bezierVertex(390,260,380,270,350,270);
    bezierVertex(320,270,310,260,310,240);
  endShape();
  beginShape();
    vertex(260,240);
    bezierVertex(260,220,260,220,290,220);
    bezierVertex(320,220,320,220,320,240);
    bezierVertex(320,260,320,260,290,260);
    bezierVertex(260,260,260,260,260,240);
  endShape();
      //PUPILS
  fill(0);
  ellipse(pupilX2,pupilY, 20,20);
  ellipse(pupilX1,pupilY, 15,15);
      //EYEBROWS
      stroke(1,1,1);
  if(mousePressed){
    line(317,228,280,180);
    line(317,228,350,180);
  }
      //FLY
  strokeWeight(10);
  fill(1,1,80);
  stroke(1,1,80);
  ellipse(mouseX-7,mouseY-4,9,9);
  ellipse(mouseX+7,mouseY-4,9,9);
  stroke(1,1,1);
  fill(1,1,1);
  ellipse(mouseX,mouseY,10,10);
      //LASERS
  stroke(1,100,100);
    strokeWeight(10);
  if(mousePressed){
    line(pupilX2,pupilY,mouseX,mouseY);
    line(pupilX1,pupilY,mouseX,mouseY);
  }
}

