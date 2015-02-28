
//import processing.pdf.*;

void setup() {
  size(200,400);
  background(90);
noLoop();
//beginRecord(PDF, "finalboard1pdf.pdf");
}

void draw(){
smooth();
noStroke();





fill(48, 86, 17, 100);
beginShape();
curveVertex(200,  100);
curveVertex(200,  100);
curveVertex(130,  300);
curveVertex(-50, 310);
curveVertex(-50, 330);
curveVertex(140, 330);
curveVertex(200, 200);
curveVertex(200, 200);
endShape();

smooth();
noFill();
stroke(0);
strokeWeight(3);

fill(80, 152, 16);
beginShape();
curveVertex(200,  0);
curveVertex(200,  0);
curveVertex(120,  100);
curveVertex(-50, 147);
curveVertex(-50, 220);
curveVertex(140, 180);
curveVertex(200, 180);
curveVertex(200, 180);

endShape();
noStroke();
fill(34, 65, 6);
triangle(30, 125, 53, 90, 86, 113);
triangle(50, 205, 65, 231, 70, 199);
triangle(190, 15, 155, 15, 165, 55);
triangle(200, 183, 190, 180, 190, 213);
//endRecord();
}




