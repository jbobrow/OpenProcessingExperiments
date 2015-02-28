
void setup(){
  size(640,480);
  smooth();
  colorMode(HSB,1);
  frameRate(20);
}


float boredom=0;
boolean pacing=false;
boolean movingRight=true;
float pupilDisplacement=0;

void draw(){
  
  float elasticMouseY=1;//(height-mouseY)/480.0;
  
  float speedX=(mouseX-pmouseX);//negative=left
  float speedY=(mouseY-pmouseY);//negative=up
  if(boredom<-12){
    boredom=0;
  }
  else if(boredom>height+20){
    boredom=height;
  }
  else if(abs(speedX)+abs(speedY)<10){
    boredom+=5;
  }
  else if(abs(speedX)+abs(speedY)>10){
    boredom-=5;
  }
  
  elasticMouseY*=(height-boredom)/height;

  
  fill(1,0,1);
  if(boredom<0&&boredom>=-5){background(1,1,1);}
  else if (boredom<-6){background(1,1,0);}
  else{background(1,0,constrain(elasticMouseY,.3,1));}
  
  fill(constrain(elasticMouseY-.1,0,.6),1-elasticMouseY,1);
  arc(width/3, height/2, 100,constrain(elasticMouseY*95+10,20,1000),radians(0),radians(180));//bottom half of left eye
  arc(width/3, height/2, 100,constrain(elasticMouseY*95+10,20,1000),radians(180),radians(360));//top half of left eye lid
  arc(width/3, height/2, 100,constrain(elasticMouseY*80+10,20,1000),radians(180),radians(360));//top half of left eye
  
  
  arc(width/3.0*2, height/2, 100,constrain(elasticMouseY*95+10,20,1000),radians(0),radians(180));//bottom half of right eye
  arc(width/3.0*2, height/2, 100,constrain(elasticMouseY*95+10,20,1000),radians(180),radians(360));//top half of right eye lid
  arc(width/3.0*2, height/2, 100,constrain(elasticMouseY*80+10,20,1000),radians(180),radians(360));//top half of right eye
  
  //fill(1,0,0);
  noStroke();
  fill(constrain(elasticMouseY,.6,.8),elasticMouseY,round(elasticMouseY));

  if(boredom>=height){pacing=true;}
  else{pacing=false; pupilDisplacement=0;}

  if(pacing){
    if(movingRight){
    pupilDisplacement++;}
    if(pupilDisplacement>30){
    movingRight=false;}
    if(!movingRight){
    pupilDisplacement--;}
    if(pupilDisplacement<-30){
    movingRight=true;}
  }
  ellipse(width/3+pupilDisplacement,height/2-elasticMouseY*20,constrain(elasticMouseY*20,5,30),30);//left pupil
  ellipse(width/3.0*2+pupilDisplacement,height/2-elasticMouseY*20,constrain(elasticMouseY*20,5,30),30);//left pupil
  stroke(1,0,0);
  
  noFill();
  strokeWeight(13);
  arc(width/3,height/2-10*elasticMouseY*2,150,constrain(elasticMouseY*170+10,100,1000),radians(280-constrain(elasticMouseY*100,0,100)),radians(360-constrain(elasticMouseY*130,0,100)));//left eyebrow
  arc(width/3.0*2,height/2-10*elasticMouseY*2,150,constrain(elasticMouseY*170+10,100,1000),radians(180+constrain(elasticMouseY*100,0,100)),radians(260+constrain(elasticMouseY*130,0,100)));//right eyebrow    
  //strokeWeight(1);
  
  if(mousePressed){
  
  
  
}

  
  
}

