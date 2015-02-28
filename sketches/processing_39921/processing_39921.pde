
class Red_wire {

  Red_wire() { //this is the constructor
  }

  void drawWire() {

    //DRAW THE RED WIRES
    //red led power
    noFill();
    stroke(255, 0, 0);
    beginShape();
    curveVertex(300, 440);
    curveVertex(360, 440);
    curveVertex(400, 440);
    //ellipse(400,440,10,10);
    curveVertex(450, 400);
    //ellipse(450,400,10,10);
    curveVertex(400, 250);
    //ellipse(400,250,10,10);
    curveVertex(300, 250);
    curveVertex(200, 250);
    curveVertex(175, 225);
    curveVertex(175, 225);
    endShape();
    stroke(100);
    fill(100);
    //ellipse(175, 225, 1,2 );
    ellipse(360, 440, 5, 5);
  }
}


