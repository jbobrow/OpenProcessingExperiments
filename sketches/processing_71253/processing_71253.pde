
float skyColor=0;


void setup() {
  size(600, 420);
}

void draw() {
  smooth();
  //background color
  skyColor=sin(0.00625*mouseX-0.375)*255;
  background(skyColor);


  //glass sheield
  noFill();
  strokeWeight(2);
  stroke(20);
  arc(300, 350, 520, 540, PI, TWO_PI);
  stroke(170);
  arc(300, 350, 510, 530, PI, TWO_PI);

  //city
  noStroke();
  fill(225);
  rect(60, 300, 80, 50);
  rect(140, 230, 40, 120);
  rect(180, 200, 50, 150);
  rect(230, 170, 70, 180);
  rect(300, 300, 40, 50);
  rect(340, 280, 60, 70);
  rect(400, 220, 55, 130);
  rect(455, 240, 65, 110);
  rect(520, 290, 20, 60);
  
  //windows
  strokeWeight(0);
  fill(255, 255, 0, 255-skyColor);
  rect(70, 310, 15, 15);
  rect(100, 310, 15, 15);
  rect(145, 250, 10, 15);
  rect(160, 250, 10, 15);
  rect(145, 270, 10, 15);
  rect(160, 270, 10, 15);
  rect(200, 220, 20, 25);
  rect(260, 270, 15, 15);
  rect(345, 285, 10, 10);
  rect(360, 285, 10, 10);
  rect(375, 285, 10, 10);
  rect(460, 255, 30, 20);

  //toggle bar
  for (int i=0; i<520;i++) {
    fill(0+i*1.2);
    rect(20+i, 360, 30, 30);
  }
  for (int i=0; i<250;i++) {
    fill(0+i*1.2);
    rect(550-i, 360, 30, 30);
  }
  
  //aroud toggle bar
  noFill();
  stroke(130);
  strokeWeight(2);
  rect(16, 356, 568, 38);

  //pullable button
  fill(255, 0, 0);
  stroke(150, 0, 0);
  rect(min(max(mouseX-23, 23), 530), min(max(mouseY-12, 362), 362), 46, 24);
  
  //sun
  float sunAlpha=skyColor; 
  float increaseYellow=skyColor*1.4;
  strokeWeight(0);
  
  stroke(255,255,0,sunAlpha);
  fill(255,255-increaseYellow,0,sunAlpha);
 ellipse(mouseX,40,40,40);

}


