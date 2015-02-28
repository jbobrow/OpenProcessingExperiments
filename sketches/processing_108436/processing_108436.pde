
//Curve Vertex Example
//Thanks to Adiel

void setup(){
size(500, 500);
}

void draw(){
background(255);

strokeWeight(3);

beginShape();

  curveVertex(50, 250);
  curveVertex(100, 250);
  curveVertex(150, 250);
  curveVertex(200, 250);
  curveVertex(mouseX, mouseY);
  curveVertex(300, 250);
  curveVertex(350, 250);
  curveVertex(400, 250);
  curveVertex(450, 250);
  


endShape();

strokeWeight(1);
  ellipse(50, 250, 10, 10);
  ellipse(100, 250, 10, 10);
  ellipse(150, 250, 10, 10);
  ellipse(200, 250, 10, 10);
  ellipse(300, 250, 10, 10);
  ellipse(350, 250, 10, 10);
  ellipse(400, 250, 10, 10);
  ellipse(450, 250, 10, 10);
  
}
