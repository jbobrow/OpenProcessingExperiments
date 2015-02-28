
//"hw2" CMU 48-757 F'11 
//copywrite 2011 Zack Jacobson-Weaver
size(400,400);
background(0,0,0);
smooth();
float x,y,wd,ht;
x=100;
y=100;
wd=100;
ht=100;
float x1,y1,x2,y2,x3,y3,x4,y4;
x1=60;
y1=200;
x2=70;
y2=200;
x3=190;
y3=200;
x4=200;
y4=200;
float cx1,cy1,cx2,cy2;
cx1=50;
cy1=50;
cx2=100;
cy2=100;
  ellipseMode(CENTER);
  noStroke();
  fill(5,23,175);
  ellipse((x*2),(y*2),(wd*3),(ht*3));
  fill(169,233,240);
  ellipse((x*2),(y*2),(wd*3-20),(ht*3-20));
  fill(5,23,175);
  ellipse((x*2),(y*2),(wd*3-30),(ht*3-30));
stroke(255,3,7);
strokeWeight(5);
noFill();
curve(x1,y1,x2,y2,x3+20,y3-90,x4,y4+150);
  curve(x1-100,y1+50,x2+40,y2+80,x3+20,y3-90,x4,y4+150);
curve(x1,y1+50,x2+40,y2+80,x3+100,y3,x4+100,y4+400);
  stroke(235,3,252);
  beginShape();
  curveVertex(x,y+360);
  curveVertex(x+50,y+165);
  curveVertex(x+90,y+77);
  curveVertex(x+130,y+34);
  curveVertex(x+170,y+12);
  endShape();
beginShape();
curveVertex(x+75,y+380);
curveVertex(x+75,y+200);
curveVertex(x+85,y+120);
curveVertex(x+130,y+34);
curveVertex(x+170,y+12);
endShape();
  beginShape();
  curveVertex(x+75,y+380);
  curveVertex(x+75,y+200);
  curveVertex(x+150,y+60);
  curveVertex(x+180,y);
  curveVertex(x+200,y-50);
  endShape();
beginShape();
curveVertex(x+100,y+380);
curveVertex(x+100,y+220);
curveVertex(x+140,y+80);
curveVertex(x+180,y);
curveVertex(x+200,y-50);
endShape();
  noFill();
  stroke(147,8,147);
  bezier(x1*4.9,y1*.57,cx1*4.7,cy1*6,cx2*2.6,cy2*3.2,x2+160,y2*1.4);

  
     
  
                
                
