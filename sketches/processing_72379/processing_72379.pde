
//Nikita Sharma
//Introduction to Digital Media Fall 2012
//Section A
//September 11th 2012
float randomDiameter =0; //global variable, integer, can access it anywhere throughout the code
float strokeGray =0;



void setup() {
  size(1200, 600);
  background(255);
}

void draw() {


  background(255, 255, 0);


  stroke(strokeGray);
  strokeWeight(5);
  fill(200, 0, 45);
  smooth();
  //background(135,25);
  fill(255, 0, 0, 100);
  rect(0, 0, width, height);
  smooth();
  stroke(strokeGray);
  strokeWeight(5);

  //fill inside of circle yellow
  //randomDiameter =random(20,100);
  if (randomDiameter <100) {
    randomDiameter++;
  }
  else {      
    randomDiameter=0;
  }
  for (int i=0; i<15; i++) {
    strokeWeight(10);
    stroke(i*30, 0, i*30);
    ellipse(mouseX, 600, i*10, i*10);
  }
  for (int i=0; i<15; i++) {
    strokeWeight(10);
    stroke(i*30, 0, i*30);
    ellipse(mouseX, 0, i*10, i*10);
  }
  for (int i=0; i<15; i++) {
    strokeWeight(10);
    stroke(i*30, 0, i*30);
    ellipse(1200, 300, i*10, i*10);
  }
  for (int i=0; i<15; i++) {
    strokeWeight(10);
    stroke(i*30, 0, i*30);
    ellipse(0, 300, i*10, i*10);
  }
  for (int i=0; i<15; i++) {
    strokeWeight(10);
    stroke(i*30, 0, i*30);
    ellipse(0, 0, i*10, i*10);
  }
  for (int i=0; i<15; i++) {
    strokeWeight(10);
    stroke(i*30, 0, i*30);
    ellipse(0, 600, i*10, i*10);
  }
  for (int i=0; i<15; i++) {
    strokeWeight(10);
    stroke(i*30, 0, i*30);
    ellipse(1200, 600, i*10, i*10);
  }

  for (int i=0; i<15; i++) {
    strokeWeight(10);
    stroke(i*30, 0, i*30);
    ellipse(1200, 0, i*10, i*10);
  }
  for (int i=0; i<25; i++) {
    strokeWeight(10);
    stroke(i*30, 0, i*30);
    ellipse(mouseX, mouseY, i*10, i*10);
  }


  ellipse(mouseX, mouseY, randomDiameter, randomDiameter);
  //ellipse(mouseX,mouseY,200,400);
  stroke(250, 255, 3);
  ellipse(mouseX, mouseY, 500, randomDiameter);

  stroke(0, 0, 255);
  strokeWeight(10);
  line(mouseX, mouseY, 0, 0);
  stroke(0, 0, 255);
  strokeWeight(10);
  line(mouseX, mouseY, 300, 0);
  stroke(0, 0, 255);
  strokeWeight(10);
  line(mouseX, mouseY, 600, 0);
  stroke(0, 0, 255);
  strokeWeight(10);
  line(mouseX, mouseY, 900, 0);
  stroke(0, 0, 255);
  strokeWeight(10);
  line(mouseX, mouseY, 1200, 0);
  stroke(0, 0, 255);
  strokeWeight(10);
  line(mouseX, mouseY, 1200, 200);
  stroke(0, 0, 255);
  strokeWeight(10);
  line(mouseX, mouseY, 1200, 400);
  stroke(0, 0, 255);
  strokeWeight(10);
  line(mouseX, mouseY, 1200, 600);
  stroke(0, 0, 255);
  strokeWeight(10);
  line(mouseX, mouseY, 900, 600);
  stroke(0, 0, 255);
  strokeWeight(10);
  line(mouseX, mouseY, 600, 600);
  stroke(0, 0, 255);
  strokeWeight(10);
  line(mouseX, mouseY, 300, 600);
  stroke(0, 0, 255);
  strokeWeight(10);
  line(mouseX, mouseY, 0, 600);
  stroke(0, 0, 255);
  strokeWeight(10);
  line(mouseX, mouseY, 0, 200);
  stroke(0, 0, 255);
  strokeWeight(10);
  line(mouseX, mouseY, 0, 400);
  stroke(0, 0, 255);
  strokeWeight(10);
  line(mouseX, mouseY, 0, 600);



  stroke(250, 255, 3);
  arc(mouseX, mouseY, randomDiameter, 500, 1.57, 4.71);
  stroke(250, 255, 3);
  arc(mouseX, mouseY, randomDiameter, 500, 4.71, 7.85);
  stroke(250, 255, 3);
  arc(mouseX, mouseY, 500, randomDiameter, 1.57, 3.14);
  stroke(250, 255, 3);
  arc(mouseX, mouseY, 500, randomDiameter, 0, 1.57);
  stroke(255, 0, 0);
  strokeWeight(20);
  arc(mouseX, mouseY, 400, 500, 5.4, 6);
  stroke(255, 0, 0);
  strokeWeight(20);
  arc(mouseX, mouseY, 400, 500, 3.42, 4.02);
  stroke(255, 0, 0);
  strokeWeight(20);
  arc(mouseX, mouseY, 400, 500, 1.85, 2.45);
  stroke(255, 0, 0);
  strokeWeight(20);
  arc(mouseX, mouseY, 400, 500, .69, 1.29);
}






void mouseClicked() {
  if (strokeGray == 0) {
    strokeGray =255;
  }
  else {
    strokeGray=0;
  }
}
  void keyPressed() {
    if (key =='s') {
      save("nikitasharma.png");
    }
  }
