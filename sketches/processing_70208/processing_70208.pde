
void setup(){
  size(700,400);
  background(255);
}

void draw(){
// ARCOS
noFill();
strokeWeight(5);
stroke(255);
for(int d1=50;d1<700;d1=d1+40){
  for(int p2x=25;p2x<=800;p2x=p2x+325)
  for(int p2y=25;p2y<=800;p2y=p2y+350)
        ellipse(p2x,p2y,d1,d1);
}
//FOMRA X
noStroke();
strokeWeight(2);
fill(0,200,250);
for(int p1x=-30;p1x<700;p1x=p1x+35){
  for(int p1y=-25;p1y<700;p1y=p1y+35){
  beginShape();
vertex(30+p1x,30+p1y);vertex(35+p1x,25+p1y);vertex(45+p1x,35+p1y);//medio
vertex(55+p1x,25+p1y);vertex(60+p1x,30+p1y);vertex(50+p1x,40+p1y);//medio
vertex(60+p1x,50+p1y);vertex(55+p1x,55+p1y);vertex(45+p1x,45+p1y);//medio
vertex(35+p1x,55+p1y);vertex(30+p1x,50+p1y);vertex(40+p1x,40+p1y);//medio
endShape(CLOSE);
  }
}
//TRIANGULOS
noFill();
int y2=-10;
stroke(255);
strokeWeight(3);
for(int pty=0;pty<700;pty=pty+10){
  for(int p=30;p<700;p=p+800)
  triangle(-30+p,0+pty,700,y2+pty,700,20+pty);
}
//FOMRA X2
noFill();
strokeWeight(2);
stroke(0,255,250);
for(int p1x=-30;p1x<700;p1x=p1x+35){
  for(int p1y=-25;p1y<700;p1y=p1y+35){
  beginShape();
vertex(30+p1x,30+p1y);vertex(35+p1x,25+p1y);vertex(45+p1x,35+p1y);//medio
vertex(55+p1x,25+p1y);vertex(60+p1x,30+p1y);vertex(50+p1x,40+p1y);//medio
vertex(60+p1x,50+p1y);vertex(55+p1x,55+p1y);vertex(45+p1x,45+p1y);//medio
vertex(35+p1x,55+p1y);vertex(30+p1x,50+p1y);vertex(40+p1x,40+p1y);//medio
endShape(CLOSE);
  }
}
// ARCOS2
noFill();
strokeWeight(2);
stroke(250);
for(int d1=50;d1<700;d1=d1+40){
  for(int p2x=25;p2x<=800;p2x=p2x+325)
  for(int p2y=25;p2y<=800;p2y=p2y+350)
        ellipse(p2x,p2y,d1,d1);
}
}
