
int circleType = 1;
parent.document.getElementById("appletAjaxContainer").setAttribute("style", "background-color:transparent; border:0px;");

void setup(){
  size(512,512);
  colorMode(HSB);
  noStroke();
  smooth();
  frameRate(32);
}

void draw(){
  externals.context.clearRect(0,0,width,height);
  if(circleType==1){
    threeCircles(256,256,256,4);
  }
  else{
    fourCircles(256,256,256,4);
  }
  squares(0,0,512,512,7);
}

void mouseClicked(){
  circleType*=-1;
}

void threeCircles(float x,float y,float rad,int i){
  translate(x,y);
  rotate(radians(frameCount));
  fill((frameCount/1.6)%(256),256,256,16);
  ellipse(0,0,rad*2,rad*2);
  if(i>1){
    threeCircles(  (4-2*sqrt(3))*rad,  0                ,  (2*sqrt(3)-3)*rad,  i-1);
    threeCircles(  (sqrt(3)-2)*rad  ,  (3-2*sqrt(3))*rad,  (2*sqrt(3)-3)*rad,  i-1);
    threeCircles(  (sqrt(3)-2)*rad  ,  (2*sqrt(3)-3)*rad,  (2*sqrt(3)-3)*rad,  i-1);
  }
  rotate(-radians(frameCount));
  translate(-x,-y);
}

void fourCircles(float x,float y,float rad,int i){
  translate(x,y);
  rotate(radians(frameCount));
  fill((frameCount/1.6)%(256),256,256,16);
  ellipse(0,0,rad*2,rad*2);
  if(i>1){
    fourCircles(  (sqrt(2)-1)*rad ,  (sqrt(2)-1)*rad ,  (sqrt(2)-1)*rad,  i-1);
    fourCircles(  -(sqrt(2)-1)*rad,  (sqrt(2)-1)*rad ,  (sqrt(2)-1)*rad,  i-1);
    fourCircles(  (sqrt(2)-1)*rad ,  -(sqrt(2)-1)*rad,  (sqrt(2)-1)*rad,  i-1);
    fourCircles(  -(sqrt(2)-1)*rad,  -(sqrt(2)-1)*rad,  (sqrt(2)-1)*rad,  i-1);
  }
  rotate(-radians(frameCount));
  translate(-x,-y);
}

void squares(float x,float y,float a,float b,int i){
  translate(x,0);
  rotate(-atan((a-x)/(b-y))+radians(45));
  float ed = sqrt(sq(x-a)+sq(y-b))/sqrt(2);
  float rotsq = (frameCount%(256)*(ed/256));
  fill((frameCount*1.6)%(256),256,256,16);
  beginShape();
   vertex(ed-rotsq,0);
   vertex(0,rotsq);
   vertex(rotsq,ed);
   vertex(ed,ed-rotsq);
  endShape();
  if(i>1){
    squares(ed-rotsq,0,rotsq,ed,i-1);
  }
}

