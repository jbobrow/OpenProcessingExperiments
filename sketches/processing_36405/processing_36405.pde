
void setup () {
  size (300, 300) ;
}

void draw() {
  background (33, 212, 255);
  fill (211, 183, 68);
  noStroke();
  rect (0, 200, 300, 100);
  fill (134, 193, 25);
  rect (0, 200, 300, 15);
  fill (137, 110, 14);
  ellipse (150, 235, 20, 35);
  stroke (134, 193, 25);
  strokeWeight (5);


  //magic bean stalk
  if (mouseY > 125) {
    line (150, 235, 150, mouseY);
  } 
  else { 
    line(150, 235, 150, 125);
  }
  
  //background w/ no beanstalk
  if (mouseY > 235) {
    background (33, 212, 255);
    fill (211, 183, 68);
    noStroke();
    rect (0, 200, 300, 100);
    fill (134, 193, 25);
    rect (0, 200, 300, 15);
    fill (137, 110, 14);
    ellipse (150, 235, 20, 35);
    stroke (134, 193, 25);
    strokeWeight (5);
  }
  
  //flower petals
   if (mouseY < 35) {
    noStroke();
    fill (245, 193, 233);
    ellipse (150, 90, 50, 50);
    ellipse (115, 125, 50, 50);
    ellipse (150, 160, 50, 50);
    ellipse (185, 125, 50, 50);
    ellipse (130, 110, 70, 70);
    ellipse (130, 140, 70, 70);
    ellipse (170, 110, 70, 70);
    ellipse (170, 140, 70, 70);
  }
  
  if (mouseY < 55) {
    noStroke();
    fill (227, 153, 209);
    ellipse (150, 90, 30, 30);
    ellipse (115, 125, 30, 30);
    ellipse (150, 160, 30, 30);
    ellipse (185, 125, 30, 30);
    ellipse (130, 110, 50, 50);
    ellipse (130, 140, 50, 50);
    ellipse (170, 110, 50, 50);
    ellipse (170, 140, 50, 50);
  }
  
  if (mouseY < 85) {
    noStroke();
    fill (219, 66, 181);
    ellipse (150, 100, 30, 30);
    ellipse (125, 125, 30, 30);
    ellipse (150, 150, 30, 30);
    ellipse (175, 125, 30, 30);
    ellipse (130, 110, 30, 30);
    ellipse (130, 140, 30, 30);
    ellipse (170, 110, 30, 30);
    ellipse (170, 140, 30, 30);
  }
  
  if (mouseY < 115) {
    noStroke();
    fill (188, 21, 147);
    ellipse (150, 110, 30, 30);
    ellipse (135, 125, 30, 30);
    ellipse (150, 140, 30, 30);
    ellipse (165, 125, 30, 30);
  }
  
 
  //center of flower
  if (mouseY < 125) {
    noStroke();
    fill (252, 252, 99);
    ellipse (150, 125, 15, 15);
  }
} 


