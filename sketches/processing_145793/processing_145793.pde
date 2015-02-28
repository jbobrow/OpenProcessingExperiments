
float angle;
//size
float sz=200;
//random change of angle
float rndm=1.36;
void setup(){
  size(500,500);
 // background(255);
  fill(0);
}
void draw(){
  angle+=PI/rndm;
  sz-=.5;
  pushMatrix();
  translate(250,250);
  rotate(angle);
  ellipse(sz,sz,10,10);
  popMatrix(CLOSE);
  if ((mousePressed)||(sz<-200)){
    rndm=random(1,2);
   // angle=0;
    sz=200;
    background(200);
  }
  text(rndm,0,500);
}
