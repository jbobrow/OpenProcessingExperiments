

void setup() {
  size(400, 300);
  background(20, 120, 40);

}

void draw() {

  noStroke();
  background(10);

  fill(10+mouseX/2, 80+mouseY/2, 55);  
  rect(0, 0, 50, 400);

  fill(20+mouseX/2, 90+mouseY/2, 60); 
  rect(50, 0, 50, 400);

  fill(30+mouseX/2, 100+mouseY/2, 65); 
  rect(100, 0, 50, 400);

  fill(40+mouseX/2, 110+mouseY/2, 70); 
  rect(150, 0, 50, 400);

  fill(50+mouseX/2, 120+mouseY/2, 75); 
  rect(200, 0, 50, 400);

  fill(60+mouseX/2, 130+mouseY/2, 80); 
  rect(250, 0, 50, 400);

  fill(70+mouseX/2, 140+mouseY/2, 85); 
  rect(300, 0, 50, 400);

  fill(80+mouseX/2, 150+mouseY/2, 90); 
  rect(350, 0, 50, 400);

}
