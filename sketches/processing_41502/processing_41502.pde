
//Author: Dulce Andino  
//Purpose: Class Exercise
//Function: Practicing Loops
//Reference: example program from Pearson (2011), p.28

int diam=8;
int diam2=10;
int diam3=10;

float centX, centY, cent1, cent2,centA,centB, tempdiam;

void setup () {
  size(400, 400);
  background(237, 66, 66);
  frameRate(14);
  smooth();

  centX=width/3;
    centY=width/2;
    cent1=width-90;
    cent2=width-120;
    centA=width-40;
    centB=width-355;

    stroke(0);
    strokeWeight(3);
  fill(255);
}

void draw() {
  if (diam2<=350) {
    stroke(255); 
    strokeWeight(1); 
    noFill();    
    ellipse(centX, centY, diam2, diam2);   
    diam2 += 10;  // increases diameter for next loop
  }
//loop
while (tempdiam>10) {
  ellipse(centX,centY,tempdiam,tempdiam);
  tempdiam-=5;
}

if (diam<=250){
  stroke(65);
  strokeWeight(2);
  fill(102,110,107,25);
  ellipse(cent1,cent2,diam,diam);
  diam+=20;
}
while(tempdiam>15){
  ellipse(cent1,cent2,tempdiam,tempdiam);
  tempdiam-=10;
}

if (diam3<=350){
  stroke(180,255, 64);
  strokeWeight(5);
  noFill();
  ellipse(centA,centB,diam3,diam3);
  diam3+=25;
}

while(tempdiam>5){
  ellipse(centA,centB,tempdiam,tempdiam);
  tempdiam-=5;
  
}
}
void keyPressed() {
  saveFrame("loops-####.jpg");
}

  


