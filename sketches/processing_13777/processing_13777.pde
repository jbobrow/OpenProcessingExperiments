
class StreetLight {

  float x1, y1;

  boolean on;

  // constructor
  StreetLight(float tx, float ty, float th) {
    x1 = tx;
    y1 = ty;

    on = false;
  }

  boolean isOn() {
    return on;
  }

  void turnOn() {
    on = true;
  }

  void turnOff() {
    on = false;
  }

  void display() {
    drawLight();
  }



  void drawLight() {
    //lampPost
    stroke(0);
    strokeWeight(3);
    line(x1, y1, x1, .55*y1);
    strokeWeight(2);
    line(x1, 0.55*y1, x1+80, 0.55*y1);
    //Curl Decor
    stroke(0);
    noFill();
    beginShape();
    curveVertex(x1+48,.60*y1);
    curveVertex(x1+48,.60*y1);
    curveVertex(x1+55,.61*y1);
    curveVertex(x1+63,.60*y1);
    curveVertex(x1+65,.58*y1);
    curveVertex(x1+57.9,.55*y1);
    curveVertex(x1+40,.577*y1);
    curveVertex(x1+26,.62*y1);
    curveVertex(x1+12,.629*y1);
    curveVertex(x1+1,.616*y1);
    curveVertex(x1+3,.60*y1);
    curveVertex(x1+16,.59*y1);
    curveVertex(x1+16,.59*y1);
    endShape();
    line(x1+55,.61*y1,x1+55,.62*y1);
    //lights turn on
    if (on==true) {
      fill(250,214,81);
      beginShape();
      vertex(x1+55,.62*y1);
      vertex(x1+66,.65*y1);
      vertex(x1+66,.68*y1);
      vertex(x1+44,.68*y1);
      vertex(x1+44,.65*y1);
      endShape(CLOSE);
      fill(0);
      line(x1+66,.65*y1,x1+44,.68*y1);
      line(x1+66,.68*y1,x1+44,.65*y1);
      line(x1+66,.65*y1,x1+44,.65*y1);
      noStroke();
      fill(255,255,255,40);
      triangle(x1+55,.62*y1,x1+130,y1,x1-50,y1);
      //ellipseMode(CENTER);
      //ellipse(x1+55,.62*y1,5*x2, 5*x2);
    }
    //lights turn off
    else {
      fill (194,195,196,50);
      beginShape();
      vertex(x1+55,.62*y1);
      vertex(x1+66,.65*y1);
      vertex(x1+66,.68*y1);
      vertex(x1+44,.68*y1);
      vertex(x1+44,.65*y1);
      endShape(CLOSE);
      fill(0);
      line(x1+66,.65*y1,x1+44,.68*y1);
      line(x1+66,.68*y1,x1+44,.65*y1);
      line(x1+66,.65*y1,x1+44,.65*y1);
    }
  }
} // end of class StreetLight


