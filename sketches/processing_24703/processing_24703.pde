


void setup() {
  size(200,400);
  background(90);
 noLoop();

}

void draw(){

smooth();

noStroke();


fill(48, 86, 17, 100);
beginShape();
curveVertex(0, 210);
curveVertex(0, 210);
curveVertex(80, 170);
curveVertex(140, 280);
curveVertex(190, 390);
curveVertex(190, 450);
curveVertex(170, 450);
curveVertex(160, 370);
curveVertex(120, 260);
curveVertex(70, 190);
curveVertex(0, 230);
curveVertex(0, 230);
endShape();

smooth();
noFill();
stroke(0);
strokeWeight(3);

fill(80, 152, 16);
beginShape();
curveVertex(200, 135);
curveVertex(200, 135);
curveVertex(160, 165);
curveVertex(100, 250);
curveVertex(-50, 310);
curveVertex(-50, 330);
curveVertex(110, 280);
curveVertex(180, 190);
curveVertex(200, 174);
curveVertex(200, 174);

endShape();

noStroke();
fill(34,65,6);
triangle(30, 281, 71, 264, 45, 256);
triangle(160, 163, 142, 195, 144, 160);
triangle(182, 190, 185, 208, 163, 220);

}


