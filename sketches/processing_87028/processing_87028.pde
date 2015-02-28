
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
  squares(0,0,512,512,7);
}

void squares(float x,float y,float a,float b,int i){
  translate(x,0);
  rotate(-atan((a-x)/(b-y))+radians(45));
  float ed = sqrt(sq(x-a)+sq(y-b))/sqrt(2);
  float rotsq = (frameCount%(256)*(ed/256));
  fill((frameCount/1.6)%(256),256,256,32);
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
