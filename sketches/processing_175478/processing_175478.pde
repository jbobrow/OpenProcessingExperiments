
PVector location;
PVector velocity;
color [] cArray = {
    color(#620ce8), // purply cobalt
    color(#0dbeff), // bright sky 
    color(#22ff3c), // lime
    color(#ff771f), // orangey red
    color(#ff2a3f), // rose
    color(#1b28e8), // mild cobalt
    color(#1dff76), // bluey green
    color(#ffe237), // butter yellow
    color(#38e8d9), // bright aqua
    color(#f359ff), // wisteria
    color(#26e82d), // bright leaf green
    color(#cae803), // yellow green
    color(#ff9726), // bright orange
    color(#176fe8), // cornflower
    color(#f7ef1d), // bright yellow
    color(#e81922), // coraly red
    color(#ff227b) // bright pink
  };

void setup() {
  background(#434343);
  size(700, 500);
  location = new PVector(mouseX, mouseY);
  noStroke();
}

void draw() {
  velocity = new PVector(mouseX - pmouseX, mouseY - pmouseY);
  location.add(velocity);
  
  pushMatrix();
    translate(location.x, location.y);
    if (mouseX == pmouseX && mouseY == pmouseY) {
      rotate(0.0);
    }
    else {
      rotate(-velocity.heading2D());
    }
    int rnum  = (int)random(cArray.length);
    int rnum2  = (int)random(10,100);
  
    Arrow a1 = new Arrow(rnum2, rnum2, 1);
    a1.display(); 
  popMatrix();
}
class Arrow {
  color cArrow;
  float xPt; 
  float yPt;
  float rt;
  float trans;

  color [] cArray = {
    color(#620ce8), // purply cobalt
    color(#0dbeff), // bright sky 
    color(#22ff3c), // lime
    color(#ff771f), // orangey red
    color(#ff2a3f), // rose
    color(#1b28e8), // mild cobalt
    color(#1dff76), // bluey green
    color(#ffe237), // butter yellow
    color(#38e8d9), // bright aqua
    color(#f359ff), // wisteria
    color(#26e82d), // bright leaf green
    color(#cae803), // yellow green
    color(#ff9726), // bright orange
    color(#176fe8), // cornflower
    color(#f7ef1d), // bright yellow
    color(#e81922), // coraly red
    color(#ff227b) // bright pink
  };
  
  Arrow(float xPoint, float yPoint, int level) {
    xPt = xPoint;
    yPt = yPoint;
    rt = random(6.2831);
    
    int rnum  = (int)random(cArray.length);
    cArrow = cArray[rnum];
  }
  
  void display() {
    fill(cArrow);
    rotate(rt);
    beginShape();
    vertex(xPt, yPt);
    vertex(xPt-20, yPt+8);
    vertex(xPt-10, yPt+10);
    vertex(xPt-8, yPt+20);
    endShape(CLOSE);
  }  
  
}


