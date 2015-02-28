
void setup() {
size(400,400);
smooth();
}

void draw() {
  if (mousePressed){
    
background(255);
fill(255,200,255);
int ran1;
ran1=int(random(255));
int ran2;
ran2=int(random(255));
int ran3;
ran3=int(random(255));
  int rand4;
  int rand5;
  int rand6;
  for (int counter2 = 100; counter2 < (300); counter2++) {
  
rand4 = int(random(400));
rand5= int(random(400));
rand6= int(random(400));
fill(rand4/2,rand5/2,rand6/2, rand4/2);
stroke(0,0,0,0);
beginShape();
vertex(200, 50);
bezierVertex(200, 50, rand4, rand5, rand5, rand6+100);
endShape();
}
fill(255);
rect(200,0,200,400);
  for (int counter2 = 100; counter2 < (300); counter2++) {
  
rand4 = int(random(400));
rand5= int(random(400));
rand6= int(random(400));
fill(rand4/2,rand5/2,rand6/2, rand4/2);
stroke(0,0,0,0);
beginShape();
vertex(200, 50);
bezierVertex(200, 50, rand4/2, rand5/2, rand5+25, rand6+100);
endShape();
}

for (int counter2 = 100; counter2 < (300); counter2++) {
  
rand4 = int(random(400));
rand5= int(random(400));
fill(rand4/2,rand5/2,(rand4+rand5)/4, rand4/2);
stroke(0,0,0,0);
beginShape();
vertex(200, 150);
bezierVertex(200, 200, rand4, rand5, counter2, 100-rand4);
endShape();
}
stroke(0,0,0,0);

fill(200,150,150);
beginShape();

vertex(325, 175);
bezierVertex(325, 75, 200, 75, 200, 75);
bezierVertex(200, 75, 75, 75, 75, 175);
bezierVertex(75, 175, 75, 325, 200, 325);
bezierVertex(200, 325, 325, 325, 325, 175);

endShape(CLOSE);

int circleCentreX;
circleCentreX=150;
int circleCentreY;
circleCentreY=175;
int diam=45;
stroke(0,0,0,0);
fill(225);
ellipse(circleCentreX,circleCentreY,diam,diam);
fill(0);
ellipse(circleCentreX,circleCentreY,diam/10,diam/10);


for (int counter = 1; counter < (diam); counter++) {
stroke(0,0,0,counter);
fill(0,0,0,0);

ellipse(circleCentreX, circleCentreY, counter, counter);
}


circleCentreX=250;
fill(225);
ellipse(circleCentreX,circleCentreY,diam,diam);
fill(0);
ellipse(circleCentreX,circleCentreY,diam/10,diam/10);

for (int counter = 1; counter < (diam); counter++) {
stroke(0,0,0,counter);
fill(0,0,0,0);
ellipse(circleCentreX, circleCentreY, counter, counter);
}
fill(50,0,0);
ellipse(200,250,30,30);
for (int counter2 = 100; counter2 < (300); counter2++) {
  
rand4 = int(random(400));
rand5= int(random(400));
rand6= int(random(400));
fill(rand4/2,rand5/2,rand6, rand4/2);
stroke(0,0,0,0);
beginShape();
vertex(200, 50);
bezierVertex(200, 50, rand4-200, rand5-200, mouseX, mouseY);
endShape();
}


    
  }
else{
  strokeWeight(0);
 rect(0,0,400,400);
 background(255);
fill(255,200,255);
int ran1;
ran1=int(random(255));
int ran2;
ran2=int(random(255));
int ran3;
ran3=int(random(255));
  int rand4;
  int rand5;
  int rand6;
  for (int counter2 = 100; counter2 < (300); counter2++) {
  
rand4 = int(random(400));
rand5= int(random(400));
rand6= int(random(400));
fill(rand4/2,rand5/2,rand6/2, rand4/2);
stroke(0,0,0,0);
beginShape();
vertex(200, 50);
bezierVertex(200, 50, rand4, rand5, rand5, rand6+100);
endShape();
}
fill(255);
rect(200,0,200,400);
  for (int counter2 = 100; counter2 < (300); counter2++) {
  
rand4 = int(random(400));
rand5= int(random(400));
rand6= int(random(400));
fill(rand4/2,rand5/2,rand6/2, rand4/2);
stroke(0,0,0,0);
beginShape();
vertex(200, 50);
bezierVertex(200, 50, rand4/2, rand5/2, rand5+25, rand6+100);
endShape();
}

for (int counter2 = 100; counter2 < (300); counter2++) {
  
rand4 = int(random(400));
rand5= int(random(400));
fill(rand4/2,rand5/2,(rand4+rand5)/4, rand4/2);
stroke(0,0,0,0);
beginShape();
vertex(200, 150);
bezierVertex(200, 200, rand4, rand5, counter2, 100-rand4);
endShape();
}
stroke(0,0,0,0);
fill(200,150,150);

beginShape();

vertex(325, 175);
bezierVertex(325, 75, 200, 75, 200, 75);
bezierVertex(200, 75, 75, 75, 75, 175);
bezierVertex(75, 175, 75, 325, 200, 325);
bezierVertex(200, 325, 325, 325, 325, 175);

endShape(CLOSE);

int circleCentreX;
circleCentreX=150;
int circleCentreY;
circleCentreY=175;
int diam=45;
stroke(0,0,0,0);
fill(225);
ellipse(circleCentreX,circleCentreY,diam,diam);
fill(0);
ellipse(circleCentreX,circleCentreY,diam/10,diam/10);


for (int counter = 1; counter < (diam); counter++) {
stroke(0,0,0,counter);
fill(0,0,0,0);
ellipse(circleCentreX, circleCentreY, counter, counter);
}


circleCentreX=250;
fill(225);
ellipse(circleCentreX,circleCentreY,diam,diam);
fill(0);
ellipse(circleCentreX,circleCentreY,diam/10,diam/10);

for (int counter = 1; counter < (diam); counter++) {
stroke(0,0,0,counter);
fill(0,0,0,0);
ellipse(circleCentreX, circleCentreY, counter, counter);
}
for (int counter2 = 100; counter2 < (300); counter2++) {
  
rand4 = int(random(400));
rand5= int(random(400));
rand6= int(random(400));
fill(rand4/2,rand5/2,rand6, rand4/2);
stroke(0,0,0,0);
beginShape();
vertex(200, 50);
bezierVertex(200, 50, rand4-200, rand5-200, counter2+25, 50+counter2/2);
endShape();

}
fill(50,0,0);
beginShape();
vertex(150,250);

bezierVertex(150, 250, 200, 350, 250, 250);

endShape();



}}


