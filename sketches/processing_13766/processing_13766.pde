

class streetLight {
  boolean turnOn;
  float x1;
  float y1;
  float h1;
  float w1;
  boolean on;
 

  // constructor
  streetLight(float tx, float ty, float th) {

    x1=tx;
    y1=ty;
    h1=th;
    w1=w;
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

    //pole
    noStroke();
    fill (0);
    rect(x1-(w1*.5),y1-h1/1.15,w1+2,h1-10);

    //lantern
    beginShape();
    vertex(x1+(w1*5),y1-h1/1.2);
    vertex(x1-(w1*5),y1-h1/1.2);
    vertex(x1-(w1*6),y1-h1/1.15);
    vertex(x1+(w1*6),y1-h1/1.15);
    endShape(CLOSE);

//turn on/off
    if (on==false) {
      stroke(0);
      fill(100);
      beginShape();
      vertex(x1+(w1*6),y1-h1/1.15);
      vertex(x1-(w1*6),y1-h1/1.15);
      vertex(x1-(w1*7),y1-h1/1.1);
      vertex(x1+(w1*7),y1-h1/1.1);
      endShape(CLOSE);
    } else {
      stroke(0);
      fill(random(255),random(255),random(255));
      beginShape();
      vertex(x1+(w1*6),y1-h1/1.15);
      vertex(x1-(w1*6),y1-h1/1.15);
      vertex(x1-(w1*7),y1-h1/1.1);
      vertex(x1+(w1*7),y1-h1/1.1);
      endShape(CLOSE);
      
      
    }
    line(x1,y1,x1,y1-h1/1.1);

    noStroke();
    fill(0);
    triangle(x1+(w1*7.5),y1-h1/1.1,x1-(w1*7.5),y1-h1/1.1,x1,(y1-h1)*.95);
    
    
  }
}


