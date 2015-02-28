
/*
  Tyler Long
  Character Drawing
  1-30-13
*/

void setup(){
  size(480,600);
  background(17,129,23);
  smooth();
}

void draw(){
  
  //head
 fill(255);
beginShape();
vertex(100,100);
bezierVertex(100,125,100,275, 200, 275);
bezierVertex(200,275,300,275,300,100);
endShape();
noFill();
line(100,100,300,100);


//eyes
fill(26,160,196);
ellipse(160,150,35,35);
fill(26,160,196);
ellipse(240,150,35,35);

//mouth
noFill();
beginShape();
vertex(50,220);
bezierVertex(150,250,250,250,350,220);
endShape();

//antenna
noFill();
beginShape();
vertex(200,100);
bezierVertex(200,80,205,70,210,55);
endShape();
fill(255,0,0,12);
ellipse(213,47,20,20);

//body
fill(255);
beginShape();
vertex(120,350);
bezierVertex(130,420,140,520,150,580);
vertex(310,580);
bezierVertex(310,580,295,475,280,350);
endShape();
line(120,350,280,350);

//heart
fill(255,0,0);
beginShape();
vertex(250,375);
bezierVertex(270,350,280,375,250,410);
vertex(250,410);
bezierVertex(220,375,220,350,250,375);
endShape();

}
