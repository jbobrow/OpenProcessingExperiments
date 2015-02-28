
float ycontrol=0;
float y=100;
float yspeed=PI/110;
float x=110;
void setup(){
  size(600,300);
}
void draw(){
  fill(0,20);
  rect(0,0,width,height);
  fill(255,20);
  smooth();
  stroke(64,139,255);
  ycontrol+=yspeed;
  for(int i=0;i<20;i++){
    y=map(cos(ycontrol+(i/5.0)),-1,1.25,0,height);
    //noStroke();
    ellipse(x+(i*20),y,y*.25,y*.25);
    //stroke(255,20);
    line(x+(i*20)-(y*.25),0,x+(i*20),y);
  }
}


