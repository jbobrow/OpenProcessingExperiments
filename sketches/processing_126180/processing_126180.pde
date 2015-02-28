
void setup(){
  size(640,400);
  background(255);
  smooth();
}
void draw(){
for(int i=0;i<360;i+=10){
  float x1 = sin(radians(i))*50; 
  float y1 = cos(radians(i))*50; 
  float x2 = sin(radians(i))*180; 
  float y2 = cos(radians(i))*180;
  float x3 = sin(radians(i))*85; 
  float y3 = cos(radians(i))*85; 
  float x4 = sin(radians(i))*130; 
  float y4 = cos(radians(i))*130;
  ellipse(x1+320,y1+200,5,5);
  ellipse(x2+320,y2+200,20,20);
  ellipse(x3+320,y3+200,10,10);
  ellipse(x4+320,y4+200,15,15);
  fill(random(255),random(255),random(255));
  noStroke();
}
  PFont myfont = createFont("Times",50);
  textFont(myfont);
  fill(random(95),random(95),random(95));
  text("%",(320)-20,(200)+20);
}
  


