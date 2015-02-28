
//import processing.pdf.*;


void setup() {
  size(200,400);
  background(90);
  noLoop();
//beginRecord(PDF, "finalboard3pdf.pdf");
}

void draw(){  
smooth();

noStroke();



fill(48, 86, 17, 100);
beginShape();
curveVertex(200, 30);
curveVertex(200, 30);
curveVertex(150, 70);
curveVertex(110, 300);
curveVertex(90, 450);
curveVertex(110, 450);
curveVertex(130, 320);
curveVertex(170, 90);
curveVertex(200, 50);
curveVertex(200, 50);


endShape();

smooth();
noFill();
stroke(0);
strokeWeight(3);


fill(80, 152, 16);
beginShape();
curveVertex(200, 165);
curveVertex(200, 165);
curveVertex(100, 110);
curveVertex(-50, 150);
curveVertex(-50, 180);
curveVertex(100, 160);
curveVertex(200, 220);
curveVertex(200, 220);

endShape();

noStroke();
fill(34,65,6);
triangle(30, 168, 71, 161, 65, 206);
triangle(160, 191, 135, 219, 144, 180);
triangle(190, 158, 185, 98, 147, 126);
//endRecord();
}




