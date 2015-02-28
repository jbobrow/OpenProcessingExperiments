
int height=240;
int width=240;
//PFont font;

void setup() {
  size(240,240);
  smooth();
  //font=loadFont("CourierNewPSMT-18.vlw");
  //textFont(font);
}

void draw() {
  background(255);
  //fill(0,0,0);
  //text(hour()+":"+minute()+":"+second(),0,20);
  stroke(0,0,0);
  strokeWeight(2);
  line(width/2, height/2, (width/2)*(1+0.6*cos(-PI/2 + hour()*30*PI/180 )), (height/2)*(1+0.6*sin(-PI/2 + hour()*30*PI/180)));
  line(width/2, height/2, (width/2)*(1+cos(-PI/2 + minute()*6*PI/180)), (height/2)*(1+sin(-PI/2 + minute()*6*PI/180)));
  stroke(255,0,0);
  strokeWeight(1);
  line(width/2, height/2, (width/2)*(1+cos(-PI/2 + second()*6*PI/180)), (height/2)*(1+sin(-PI/2 + second()*6*PI/180))); 
}

