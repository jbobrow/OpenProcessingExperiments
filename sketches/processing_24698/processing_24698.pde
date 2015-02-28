
//import processing.pdf.*;

void setup() {
  size(200,400);
  background(90);
 noLoop();
 //beginRecord(PDF, "finalboard2pdf.pdf");
}

void draw() {

smooth();
noStroke();


fill(48, 86, 17, 100);
beginShape();
curveVertex(100, 0);
curveVertex(100, 0);
curveVertex(80, 20);
curveVertex(10, 30);
curveVertex(-50, 30);
curveVertex(-50, 50);
curveVertex(10, 50);
curveVertex(100, 40);
curveVertex(130, 0);
curveVertex(130, 0);

endShape();


smooth();
noFill();
noStroke();


fill(48, 86, 17, 100);
beginShape();
curveVertex(200, 310);
curveVertex(200, 310);
curveVertex(120, 320);
curveVertex(100, 450);
curveVertex(120, 450);
curveVertex(140, 340);
curveVertex(200, 335);
curveVertex(200, 335);

endShape();


smooth();
noFill();
stroke(0);
strokeWeight(3);

fill(80, 152, 16);
beginShape();
curveVertex(200, 143);
curveVertex(200, 143);
curveVertex(190, 144);
curveVertex(110, 210);
curveVertex(-50, 150);
curveVertex(-50, 200);
curveVertex(110, 270);
curveVertex(200, 220);
curveVertex(200, 220);
endShape();

noStroke();
fill(34,65,6);
triangle(30, 183, 71, 135, 85, 206);
triangle(160, 255, 185, 259, 180, 239);
//endRecord();
}

