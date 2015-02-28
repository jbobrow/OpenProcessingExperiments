
float time = 0;
  
void setup() {
size(512,512);
frameRate(10);
}
  
void draw() {
  background(225);
  translate((width*0.4)+tan(time),(height*0.6)+(1/tan(time)));
  noFill();
  time=time+0.01;
  for (int i = 0;i < 20; i++) {
  rotate(sin(time));
  stroke(10*i,12*i,13*i);
  ellipse(i,i,i*5,cos(i*5));//ellipse in place of rect
  ellipse(5*i,5*i,i*5,sin(i*5));//extra line
  ellipse(10*(i),10*(i),i*5,sin(i*5));
  ellipse(5*i,5*i,10,cos(i*10));
  ellipse(10*i,15*i,14*i,12*i);
  ellipse(i,i,i*12,cos(1*15));
  stroke(5*i,30*i,20*i);
   
  }
}
