


void setup(){
size(500,500);
}

void draw(){
 
fill(5,1,0);
point(250,250);

background(250,0);



line(125,0,0,125);
line(375,0,500,125);
line(0,375,125,500);
line(375,500,500,375);

stroke(236,240,34);
line(0,250,250,250);
line(0,500,250,250);
line(250,500,250,250);
line(500,500,250,250);
line(500,250,250,250);
line(500,0,250,250);
line(250,0,250,250);
line(0,0,250,250);

fill(5,1,0);
stroke(236,240,34);
ellipse(250,250,250,250);

fill(5,1,0);
stroke(236,240,34);
rect(125,250,250,125);

fill(236,240,34);
beginShape();
vertex(250,135);
vertex(150,220);
vertex(350,220);
vertex(250,135);
endShape();

arm();

pushMatrix();
scale(-1,1);
translate(-width,0);
arm();
popMatrix();

pushMatrix();
scale(1,-1);
translate(0,-height);
arm();
popMatrix();

pushMatrix();
scale(-1,-1);
translate(-width,-height);
arm();
popMatrix();

}

void arm(){
  ellipse(10,10,30,30);
fill(5,1,0);
ellipse(30,30,40,40);
fill(236,240,34);
ellipse(50,50,50,50);
fill(5,1,0);
ellipse(70,70,60,60);
fill(236,240,34);
ellipse(90,90,70,70);
fill(5,1,0);
ellipse(110,110,80,80);
fill(236,240,34);
ellipse(130,130,90,90);
}





