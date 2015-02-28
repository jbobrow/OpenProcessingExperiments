
void setup(){
size(206,105);
}
//denote size of sketch window
//draw a curve for the left side top
void draw(){
  println(mouseX + " , " + mouseY);
background(40,90,205);
smooth();
//begin black box

fill(0,0,0);
rect(57,68,85,57);

ellipse(144,88,40,40);
//this begins plain green shape

beginShape();

fill(0,150,0);
strokeWeight(3);
beginShape();

curveVertex(-30,60);
curveVertex(0,25);
curveVertex(49,50);
curveVertex(66,height);
curveVertex(66,height);

vertex(0,height);

endShape();

//this begins orange shape

beginShape();

line(0,38,32,38);
curveVertex(-30,60);
curveVertex(49,50);
line(0,57,54,57);

fill(184,134,11);


endShape();

//this is the olive shape

fill(0,90,0);
beginShape();

curveVertex(-30,90);
curveVertex(0,60);
curveVertex(83,height);
curveVertex(110,155);
vertex(0,height);

endShape();

//this is the white shape

fill(255,255,255);
beginShape();

curveVertex(-30,90);
curveVertex(0,60);
curveVertex(30,height);
curveVertex(30,170);
vertex(0,height);


endShape();






}

