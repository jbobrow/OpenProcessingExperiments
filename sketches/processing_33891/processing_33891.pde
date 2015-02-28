
PFont font;

void setup(){
  size(400,400);
  noStroke();
  font = loadFont("Helvetica-24.vlw");
}
void draw(){
  background(150,59,255);
  float h = map(hour(),0,20,30,(width-30));
  float m = map(minute(),0,60,30,(width-30));
  float s = map(second(),0,60,30,(width-30));
  
  fill(224,5,96);
 ellipse(h,150,75,75);
  fill(23,227,153);
  ellipse(m,125,50,50);
  fill(23,194,227);
  ellipse(s,250,25,25);
  
  fill(8,5,252);
  rect(h,0,50,100);
  fill(240,199,87);
  rect(m,175,50,100);
  fill(245,17,230);
  rect(s,300,50,100);
  
  int htext=hour();
  fill(0);
  textFont(font);
 if(mousePressed==true){
    text((hour()+":"+minute()+":"+second()),mouseX,mouseY);
    fill(h,m,s,100);
   // rect(0,0,width,height);
  }
  println(s);
}


