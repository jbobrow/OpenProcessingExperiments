
size(400,500);
background(255,233,173);

//light white shape
noStroke();
fill(234,228,196);
  beginShape();
    vertex(164,484);
    vertex(195,286);
    vertex(258,121);
    vertex(400,0);
    vertex(400,202);
    vertex(372,220);
    vertex(400,263);
    vertex(400,500);
    endShape();
    
    //white rectangle
noStroke();
fill(255,255,255);
beginShape();
  vertex(400,62);
  vertex(281,137);
  vertex(332,248);
  vertex(400,203);
endShape();

triangle(0,124,39,176,0,202);

//Left brown shape
fill(122,92,66);
noStroke();
beginShape();
  vertex(0,92);
  vertex(66,110);
  vertex(30,155);
  vertex(0,120);
endShape();

//brown circle
beginShape();
  curveVertex(0,341);
  curveVertex(0,341);
  curveVertex(20,275);
  curveVertex(50,235);
  curveVertex(110,209);
  curveVertex(174,232);
  curveVertex(149,368);
  curveVertex(48,410);
  curveVertex(0,341);
  curveVertex(0,341);
endShape();

//red triangle
fill(220,46,21);
noStroke();
triangle(54,241,183,277,45,403);

triangle(400,400,279,371,400,413);

//black lines
stroke(35,31,32);
strokeWeight(4);
line(0,124,345,524);
line(0,164,21,149);
line(0,202,39,176);

strokeWeight(7);
line(400,0,0,346);

strokeWeight(2.5);
line(212,0,400,383);

strokeWeight(1.5);
line(252,20,400,320);
line(278,46,400,262);

line(210,450,400,480);
line(153,467,400,485);
line(138,482,400,500);

strokeWeight(3);
line(363,365,363,520);
line(377,365,377,520);
line(321,253,400,290);
line(351,250,400,270);

//grid
stroke(35,31,32);
strokeWeight(2);
line(281,137,400,62);
line(291,165,400,93);
line(305,187,400,125);
line(321,216,400,162);
line(332,248,400,203);

line(335,103,393,203);
line(362,85,400,151);
line(381,74,400,106);

//black boxes
fill(35,31,32);
beginShape();
  vertex(335,103);
  vertex(350,125);
  vertex(377,107);
  vertex(362,85);
endShape();

beginShape();
  vertex(317,217);
  vertex(332,248);
  vertex(357,229);
  vertex(341,200);
endShape();

beginShape();
  vertex(281,137);
  vertex(291,164);
  vertex(314,150);
  vertex(303,124);
endShape();

beginShape();
  vertex(314,150);
  vertex(327,175);
  vertex(342,163);
  vertex(327,139);
endShape();

beginShape();
  vertex(342,163);
  vertex(356,190);
  vertex(378,175);
  vertex(363,149);
endShape();

beginShape();
  vertex(378,175);
  vertex(395,203);
  vertex(411,190);
  vertex(400,161);
endShape();

beginShape();
  vertex(387,134);
  vertex(400,161);
  vertex(416,145);
  vertex(402,122);
endShape();

//bottom gray triangle
fill(86,111,113);
noStroke();
triangle(70,500,90,480,120,500);

//curved lines
stroke(35,21,32);
strokeWeight(7);
noFill();
  beginShape();
    curveVertex(158,0);
    curveVertex(158,0);
    curveVertex(117,79);
    curveVertex(100,205);
    curveVertex(100,205);
  endShape();
  
strokeWeight(1.5);
  beginShape();
    curveVertex(341,0);
    curveVertex(341,0);
    curveVertex(225,212);
    curveVertex(156,480);
    curveVertex(156,480);
  endShape();
  
//gray circle
fill(70,69,65);
noStroke();
ellipse(33,0,80,35);



