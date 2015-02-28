
int r = 50;

void setup() {
  size(600, 600);
   noStroke();
}

void draw() {
  background(245,252,208);
  scale(0.8);
  translate(mouseX+random(-3.3), mouseY+random(-3,3));
  
  if (mousePressed) {
     //draw flower
  fill(random(0,255),random(144,217),random(133,173),90);
  ellipse(50,50,r,r);
  fill(random(0,255),random(144,217),random(133,173),90);
  ellipse(180,-50,r,r);
  fill(random(0,255),random(144,217),random(133,173),90);
  ellipse(300,50,r,r);
  fill(random(0,255),random(144,217),random(133,173),90);
  ellipse(250,200,r,r);
  fill(random(0,255),random(144,217),random(133,173),90);
  ellipse(100,200,r,r);
  r = r + 5;
  }else{
    r=50;
  }

  
  
  //draw T
  
  fill(244, 146, 30);
  quad(60, 100, 305, 100, 310, 140, 60, 140);
  quad(200, 100, 240, 100, 260, 270, 220, 270);
  
  
  //draw A
  
  fill(156,65,69);
  quad(0, 200, 100, 0, 140, 0, 40, 200);
  quad(100, 0, 140, 0, 160, 200, 120, 200);
  quad(60, 100, 130, 100, 130, 140, 60, 140);
  
  //draw +
  
  fill(133);
  rect(130, 30, 80, 20);
  rect(160, 0, 20, 80);
  
}
