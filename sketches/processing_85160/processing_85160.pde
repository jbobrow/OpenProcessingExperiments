
void setup() {
  size (600,600);

}

void draw() {
  background(240,240,150);
  fill(0,0,0,50);
  noStroke();
  quad(0,400,0,600,600,600,600,350);
  fill(255,255,255);
  noStroke();
  ellipse(500,350,100,60);
  stroke(0,100,200);
  strokeWeight(40);
  point(500 + (mouseX - 500)/20,350 + (mouseY - 350)/20);
  stroke(0,0,0);
  strokeWeight(20);
  point(500 + (mouseX - 500)/15,350 + (mouseY - 350)/15);
  noStroke();
  ellipse(200,530,85,130);
  stroke(245,245,50);
  strokeWeight(65);
  point(200 + (mouseX - 200)/18,530 + (mouseY - 530)/18);
  stroke(0,0,0);
  strokeWeight(20);
  point(200 + (mouseX - 200)/12,530 + (mouseY - 530)/12);
  noFill();
  strokeWeight(2);
  bezier(420, -10, 50, 20, 100, 555, -10, 420);
  bezier(-10, 75, 50, 20, 100, 555, -10, 420);
  strokeWeight(10);
  stroke(50,100,10);
  point(49,225);
  point(44,185);
  point(36,145);
  point(24,100);
  point(53,270);
  point(55,330);
  point(53,400);
  fill(50,100,10);
  noStroke();
  triangle(230,10,203,100,330,50);
  triangle(130,150,134,210,190,170);
  triangle(80,280,84,340,137,300);
  fill(90,30,210,134);
  ellipse(600,50,300,300);
  fill(190,110,20,115);
  strokeWeight(5);
  stroke(0,0,0);
  ellipse(500,620,500,250);
  noFill();
  bezier(-100,600,100,400,500,400,610,-70);
  noStroke();
  fill(190,100,100);
  quad(200,200,320,100,420,250,350,300);
}


