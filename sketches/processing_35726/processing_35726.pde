
void setup(){
  setupAudio();
  size(400,400);
  
}

int transp;
void draw(){
background(#7741B7);

getVolume();
float Y = map(volume, 0,100, 2,20);


  


smooth(); 
noStroke();
// body
fill(#1B7FBC);
ellipse(206,375, 158,300);
//ears
fill(#FFEB05);
noStroke();
arc(245,200, 40,40, radians(275), radians(450));
noFill();
stroke(1);
strokeWeight(1);
arc(250,195, 10,10, radians(275), radians(450));
arc(250,205, 10,10, radians(275), radians(450));
fill(#FFEB05);
noStroke();
arc(155,200, 40,40, radians(90), radians(275));
noFill();
stroke(1);
strokeWeight(1);
arc(150,195, 10,10, radians(90), radians(275));
arc(150,205, 10,10, radians(90), radians(275));
//head
noStroke();
fill(#FFEB05);
ellipse(200, 210, 100, 200);
fill(255,249,185,85);
ellipse(200,210, 25,200);
fill(255,249,185,90);
ellipse(200,210, 50,190);
fill(255,249,185,95);
ellipse(200,210, 75,175);
fill(255,249,185,100);
ellipse(200,210, 50,150);
//angry speech bubble
if(volume<=50){
  transp = 0;
}
else{
  transp=250;
}
fill(255,255,255,transp);
ellipse(320,150, 110,90);
stroke(1,transp);
strokeWeight(8);
beginShape();
vertex(315,130);
vertex(315,145);
vertex(300,145);
endShape();
beginShape();
vertex(330,130);
vertex(330,145);
vertex(345,145);
endShape();
beginShape();
vertex(345,160);
vertex(330,160);
vertex(330,175);
endShape();
beginShape();
vertex(300,160);
vertex(315,160);
vertex(315,175);
endShape();
noStroke();
beginShape();
vertex(300,180);
vertex(295,140);
vertex(260,175);
endShape(CLOSE);
//steam
if(volume<=30){
  transp = 0;
}
else{
  transp=250;
}
fill(222,221,219,transp);
ellipse(279+(Y),210, 10,10);
fill(222,221,219,transp);
ellipse(279+(Y),190, 10,10);
fill(255,255,255,transp);
rect(265,190, 10+(Y),20);
fill(255,255,255,transp);
ellipse(278+(Y),200, 21,21);
fill(222,221,219,transp);
ellipse(122+(-Y),210, 10,10);
fill(222,221,219,transp);
ellipse(122+(-Y),190, 10,10);
fill(255,255,255,transp);
rect(135,190, -10+-Y,20);
fill(255,255,255,transp);
ellipse(122+(-Y),199, 21,21);
//blush
fill(255,235+(-Y*10),5,50);
ellipse(230,235, 25,25);
ellipse(170,235, 25,25);
//eyes
fill(#FCFEFF);
ellipse(180, 200, 35, 35);
ellipse(220, 200, 35, 35);
//pupils
fill(0,0,0);
ellipse(220,200, 15,15);
ellipse(180,200, 15,15);
//red pupils
if(volume<=35){
  transp = 0;
}
else{
  transp=250;
}
fill(252,18,22,transp);
ellipse(220,200, 15,15);
ellipse(180,200, 15,15);
// hair
fill(0,0,0);
triangle(180,123, 140,100, 160,145);
triangle(200,110, 170,80, 170,130);
triangle(190,111, 220,80, 220,120);
triangle(215,118, 250,100, 240, 145);
//mouth
fill(#FCFEFF);
arc(200,285, 35,35, radians(180), radians(360));
fill(0,0,0);
stroke(1);
strokeWeight(1);
line(200,285, 200,270);
line(210,273, 210,285);
line(190,273, 190,285);
//mustache
fill(0,0,0);
stroke(0);
strokeWeight(8);
beginShape();
vertex(195,255);
vertex(195,270);
vertex(180,270);
vertex(170,265);
endShape();
beginShape();
vertex(205,255);
vertex(205,270);
vertex(220,270);
vertex(230,265);
endShape();
//nose
noStroke();
fill(#FA7D08);
ellipse(200,235, 45,60);
fill(252,185,125,25);
ellipse(200,235, 40,55);
fill(252,185,125,30);
ellipse(200,235, 35,50);
fill(252,185,125,35);
ellipse(200,235, 30,45);
fill(252,185,125,40);
ellipse(200,235, 25,40);
fill(252,185,125,45);
ellipse(200,235, 20,35);
fill(252,185,125,50);
ellipse(200,235, 15,30);
// eyebrow
noFill();
stroke(0);
strokeWeight(10);
beginShape();
curveVertex(180,180);
curveVertex(160,180);
curveVertex(160,175+(-Y*2));
curveVertex(195,185);
curveVertex(210,185);
curveVertex(240,175+(-Y*2));
curveVertex(240,180);
curveVertex(260,180);
endShape();
//chin
noFill();
strokeWeight(1);
arc(200,290, 20,20, radians(0),radians(180));

}


