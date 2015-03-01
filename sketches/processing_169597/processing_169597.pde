

void setup() {
  background(255);
  size(500,500);
  frameRate(3);
}
  int caso;
  void draw() {
    caso=int(random(3));
    
    if (caso==0) {
fill( random (255),random(255),random(153));
      rect(random(350),random(400),65,80);
    } else if (caso==1) { 
    fill(random(255),random(255), random(53));
      hue(50);
      ellipse(random(400),random(400),20,20);
    } else { 
    stroke(random(255));
    strokeWeight (3);
   
      line(random(400),random(400), random(500),random(500));
   fill(random(105),random(255), random(53));
   hue(20);
      ellipse(random(400),random(500),30,60);
  }
  }
