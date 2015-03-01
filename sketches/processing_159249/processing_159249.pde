
float x=0;
void setup(){
  size(500,500);
  }
  
void draw(){
  background(0);
  rotate(PI);
  for (float t=1; t<800; t++){
    fill(t,240,240);
  rotate(126.5*PI/180);
  rect(t,0,2*sqrt(t),2*sqrt(t));
  
  if(t-250+x > 0){
  ellipse(t-250+x,0,2*sqrt(abs(t-250+x)),2*sqrt(abs(t-250+x)));
  }
  }
 x+= 3;
  if(mouseReleased){
    x=mouseX;
  }
  }
