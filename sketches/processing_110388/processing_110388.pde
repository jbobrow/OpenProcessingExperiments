
color[] blues={#D7F4F6};
color[] browns={#4A3000,#A64500};
color[] greens={#679B00,#89CB12,#DBE86A,#4F5F03,#C2E656};
color[] petals={#FFC700,#F79E00,#FFFF00,#FFCF00};

void setup(){
  size(500,250);
}

void draw(){
  backdrop(blues[0],greens[2]);
  
  drawGroups(greens[1],-1,0,-10);
  drawGroups(greens[0],1,80,10);
}

void drawGroups(color stemCol,int direction,int shortness,int margin){
  float xSpacing=width/7.0;
  
  for(int i=1;i<=6;i++){
    pushMatrix();
    translate(xSpacing*i+margin,height+shortness);
    drawFlower(stemCol,direction);
    popMatrix();
  }
}

void drawFlower(color stemCol,int direction){
  float len=40;
  float speed=0.001;
  float t=map(sin(millis()*TWO_PI*speed),-1,1,-2,2);
  
  stroke(stemCol);
  fill(stemCol);
  pushMatrix();
  rotate(-HALF_PI);
  for(int i=0;i<12;i++){  
    len*=0.83;
    rotate(radians(direction*t));
    rect(0,0,len+2,-7);
    translate(len,0);
    if(i<8){
      drawLeaves(stemCol,i);
    }
  }
  drawPetals(petals[3],20,45,30);
  drawPetals(petals[2],10,45,0);
  popMatrix();
}

void drawPetals(color c,int margin,int len,int time){
  for(int i=0;i<minute()-time;i++){
    pushMatrix();
    rotate(radians(12*i));
    stroke(c,175);
    fill(c,175);
    ellipse(margin,0,len,7);
    popMatrix();
  }
  drawHead();
}

void drawHead(){
  stroke(browns[0]);
  fill(browns[0]);
  ellipse(0,0,42,42);
  stroke(browns[1]);
  fill(browns[1]);
  for(int i=0;i<=hour();i++){
    pushMatrix();
    rotate(radians(15*i));
    ellipse(11,0,5,0.75);
    popMatrix();
  }
}

void drawLeaves(color c,int num){
  fill(c,200);
  stroke(c,200);
  
  if(num%2==1){
    pushMatrix();
    rotate(radians(-55));
    ellipse(20,0,30,10);
    popMatrix();
    //arc(-31,-31,60,60,0,PI/2.0,OPEN);
    //arc(0,0,60,60,PI,3.0*PI/2.0,OPEN);
  }
  else{
    pushMatrix();
    rotate(radians(235));
    ellipse(-17,0,30,10);
    //arc(0, 0, 60, 60, 0, PI/2.0, OPEN);
    //arc(31,31,60,60,PI,3.0*PI/2.0,OPEN);
    popMatrix();
  }
}

void backdrop(color c1, color c2){
  noFill();
  for(int i=0;i<=height;i++){
      float inter=map(i,0,height,0,1);
      color c=lerpColor(c1,c2,inter);
      stroke(c);
      line(0,i,width,i);
  }
}


