
int contrast,contrast1,contrast2,contrast3=0;
float circle1,circle2,circle3;
void setup(){
  size(200,200);
  noStroke();
  background(126);
}
void draw(){
  fill(126,20);
  rect(0,0,200,200);
  fill(0,255,255,contrast1);
  ellipse(125,75,100,100);
  fill(255,0,255,contrast2);
  ellipse(75,75,100,100);
  fill(255,255,0,contrast3);
  ellipse(100,125,100,100);
  circle1=sqrt(sq(125-mouseX)+sq(75-mouseY));
  circle2=sqrt(sq(75-mouseX)+sq(75-mouseY));
  circle3=sqrt(sq(100-mouseX)+sq(125-mouseY));
  
  if((circle1<50)&&(contrast1<50)){
    contrast1++;
  }
  if((circle2<50)&&(contrast2<50)){
    contrast2++;
  }
  if((circle3<50)&&(contrast3<50)){
    contrast3++;
  }
  if((circle1>50)&&(contrast1>0)){
    contrast1--;
  }
  if((circle2>50)&&(contrast2>0)){
    contrast2--;
  }
  if((circle3>50)&&(contrast3>0)){
    contrast3--;
  }
}
