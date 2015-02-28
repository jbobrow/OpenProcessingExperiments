
import processing.pdf.*;

float x,y;
float angle = 0;
float r=400;//r=ㅂㅏㄴㅈㅣㄹㅡㅁ

void setup(){
  size(600,600);
  background(255); 
beginRecord(PDF, "everything.pdf");
}

void draw(){
  
 
strokeWeight(3);
  x = r*cos(angle);
  y = r*sin(angle);
  noFill();
  stroke(255);
  
 
  ellipse(300,300,600+x,600+y);
    stroke(220,100,230);
  line(300,300,500+x,500+y);
    stroke(140,200,160);
  line(300,300,100+x,100+y);
  stroke(150,190,120);
  line(300,300,200+x,200+y);
 stroke(250,210,210);
  line(300,300,300+x,300+y);
 stroke(130,200,180);
  line(300,300,400+x,400+y);
  
  translate(300,300);
  rotate(r);
 stroke(200,190,120);
 
  stroke(190,200,120);
  ellipse(x/2,y/2,60,60);
  
point(x,y);
angle = angle + 0.9;
r=r-1;
}
  void keyPressed() {
  if (key == 'q') {
    endRecord();
    exit();
 //println(x);
  }
}
