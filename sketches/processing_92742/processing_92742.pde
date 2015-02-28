
void setup() {
  size(800, 700);
  smooth();
  strokeWeight(3);
}

void draw() {
  background(128);
  fill(150, 150, 200);
  rect(200, 620, 400, 20, 7);//arms
  triangle(400, 500, 230, 700, 570, 700);//body
  
  arc(280, 250, 100, 100, PI-QUARTER_PI, PI+QUARTER_PI, PIE);
  arc(520, 250, 100, 100, PI+HALF_PI+QUARTER_PI, TWO_PI+QUARTER_PI, PIE);
  //ears
  ellipse(400, 400, 400, 400);//face
  
  point(235, 400);
  point(240, 405);
  point(245, 400);
  point(545, 400);
  point(540, 405);
  point(535, 400);


  fill(50);
  triangle(400, 410, 380, 380, 420, 380); //nose
  line(400, 410, 350, 450);
  line(400, 410, 450, 450);
  
  fill(200, 50, 50);
  quad(400, 410, 375, 430, 400, mouseY, 425, 430); //mouth
  
  fill(200);
  stroke(50);
  ellipse(320, 360, 50, 50);
  ellipse(480, 360, 50, 50);
  
  fill(50);
  ellipse(320, 360, 7, 7);
  ellipse(480, 360, 7, 7);
  ellipse(320, 360, mouseX / 20, mouseX / 20);
  ellipse(480, 360, mouseX / 20, mouseX / 20);
  //eyes
  
  line(300, 300, 330, 290);
  line(460, 290, 490, 300);
  //eyebrows
  
}
