
float angle;
//random change of angle
float sz=200;
float radius=1.77;
float colour=300;
void setup() {
  size(500, 500);
  background(0);
  //ellipse(200,200,4,4);
  noStroke();
  
}

void draw(){
  frameRate(80);
  translate(250, 250);
  angle+=PI/radius;
  sz-=.4; 
  colour-=0.5;
  rotate(angle);
  fill(colour);
  ellipse(sz,sz,8,8);

  
    if ((mousePressed)||(sz<-200)){
     background(0);
   radius=random(1,2);
   //angle=0;
   sz=200;
   }else if((sz<0)){
      colour+=1;
   }
  //  text(radius,0,500);
}




