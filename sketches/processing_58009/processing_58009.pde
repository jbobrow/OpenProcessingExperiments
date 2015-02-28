
PImage img1;
PImage img2;

void setup() {
  size(720, 600);
  smooth();
  strokeWeight(1);
  img1 = loadImage("background.jpg");
  img2 = loadImage("kimono.jpg");
}

void draw() {
  background(204);
  image(img1, 0, 0, 720, 600);
  fill(255);
  
  //head
  rect(mouseX-75, mouseY-10, 150, 20);
  arc(mouseX, mouseY, 150, 150, PI, 2*PI);
  
  //eyes
  fill(176, 226, 255);
  //eyes turn purple
  if (mousePressed == true) {
    fill(171, 130, 255);
  }
  rect(mouseX-32, mouseY-45, 16, 40);
  arc(mouseX-24, mouseY-44, 16, 16, PI, 2*PI);
  rect(mouseX+16, mouseY-45, 16, 40); 
  arc(mouseX+24, mouseY-44, 16, 16, PI, 2*PI);
  
  //arms
  fill(255);
  //left arm
  beginShape();
  vertex(mouseX-214, mouseY+161);
  vertex(mouseX-120, mouseY+31);
  vertex(mouseX-100, mouseY+45);
  vertex(mouseX-190, mouseY+180);
  endShape();
  arc(mouseX-201, mouseY+170, 30, 30, QUARTER_PI, PI+QUARTER_PI); 
  //right arm
  beginShape();
  vertex(mouseX+213, mouseY+161);
  vertex(mouseX+120, mouseY+31);
  vertex(mouseX+100, mouseY+45);
  vertex(mouseX+190, mouseY+180);
  endShape();
  arc(mouseX+201, mouseY+170, 30, 30, 0-QUARTER_PI, HALF_PI+QUARTER_PI); 
  
  //legs
  arc(mouseX-65, mouseY+260, 65, 65, 0, PI);
  arc(mouseX+65, mouseY+260, 65, 65, 0, PI);
  
  //body
  image(img2, mouseX-125, mouseY+10, 250, 250);
  noFill();
  rect(mouseX-125, mouseY + 10, 250, 250);
  
  //light panel
  fill(211, 211, 211);
  rect(mouseX-100, mouseY+40, 200, 100); 
  fill(0);
  //first rectangle turns red
  if (keyPressed && key == 'a') {
    fill(220, 20, 60);
  }
  rect(mouseX-90, mouseY+60, 20, 60);
  //second rectangle turns orange/yellow
  if (keyPressed && key == 's') {
    fill(255, 215, 0);
  }
  rect(mouseX-50, mouseY+60, 20, 60);
  //third rectangle turns green
  if (keyPressed && key == 'd') {
    fill(0, 201, 87);
  }
  rect(mouseX-10, mouseY+60, 20, 60);
  //fourth rectangle turns blue
  if (keyPressed && key == 'f') {
    fill(99, 184, 255);
  }
  rect(mouseX+30, mouseY+60, 20, 60);
  //fifth panel turns purple
  if (keyPressed && key == 'g') {
    fill(125, 38, 205);
  }
  rect(mouseX+70, mouseY+60, 20, 60);
  
}

