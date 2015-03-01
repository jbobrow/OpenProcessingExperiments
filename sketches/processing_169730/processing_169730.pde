
float posX = 0;
float posY = 0;
float speed = 5;
float azar;
float r = 255;
float g = 255;
float b = 255;

void setup() {
  size(1280, 720);
  frameRate(10);
  smooth();
}

void draw() {
  background(frameCount);
  azar = int(random(50, 255));
  //contorno cabeza
  stroke(azar, 227, azar);
  strokeWeight(abs( mouseX - pmouseX ));
  noFill();
  bezier(posX + (mouseX - 900) + 520, posY + mouseY + 202, posX + (mouseX - 900) + 450, posY + mouseY + 1, posX + (mouseX - 900) + 830, posY + mouseY + 1, posX + (mouseX - 900) + 760, posY + mouseY + 202);
  line(posX + (mouseX - 900) + 520, posY + mouseY + 202, posX + (mouseX - 900) + 620, posY + mouseY + 470);
  line(posX + (mouseX - 900) + 760, posY + mouseY + 202, posX + (mouseX - 900) + 660, posY + mouseY + 470);
  //tentaculos
  bezier(posX + (mouseX - 900) + 620, posY + mouseY + 473, posX + (mouseX - 900) + 420, posY + mouseY + 400, posX + (mouseX - 900) + 660, posY + mouseY + 600, posX + (mouseX - 900) + 520, posY + mouseY +580);
  bezier(posX + (mouseX - 900) + 660, posY + mouseY + 472, posX + (mouseX - 900) + 870, posY + mouseY + 400, posX + (mouseX - 900) + 650, posY + mouseY + 600, posX + (mouseX - 900) + 780, posY + mouseY +580);
  //ojos
  stroke(255);
  strokeWeight(7);
  ellipseMode(RADIUS);
  ellipse(posX + (mouseX - 900) + 600, posY + mouseY + 250, 20, 30);
  ellipse(posX + (mouseX - 900) + 680, posY + mouseY + 250, 20, 30);
  //pupilas
  fill(0, azar, azar);
  ellipse(posX + (mouseX - 900) + 600, posY + mouseY + 250, 10 + speed, 10);
  ellipse(posX + (mouseX - 900) + 680, posY + mouseY + 250, 10, 10 + speed);
  noFill();
  //boca
  stroke(azar, 0, mouseY);
  rect(posX + (mouseX - 900) + 600, posY + mouseY + 320, 80, 50, 18);

  posY = random(15, 30);
  posX = posX + speed;
  speed = speed - 0.01;

  if (mouseX < width/6) {
    fill(r, 0, 0, 230);
    rect(10, 0, 210, height);
    fill(r, g, 0, 230);
    rect(220, 0, 210, height);
    r = r - 25;
    g = g - 25;
    if (r < 0 || g < 0){
     r = 255; 
     g = 255;
    }
  } else if (mouseX < width/5) {
    fill(0, g, b);
    rect(430, 0, 210, height);
    fill(0, 0, b);
    rect(640, 0, 210, height);
    if (mousePressed){
     b = b - 25; 
    }
    b = constrain(b, 0, 255);
  } else if (mouseX < width/4) {
    fill(0, g, 0);
    rect(850, 0, 210, height);
    fill(r, 0, b);
    rect(1060, 0, 210, height);
  } else if (mouseX < width/2) {
    fill(r, 0, 0, 25);
    rect(10, 0, 210, height);
    fill(r, g, 0, 25);
    rect(220, 0, 210, height);
    fill(0, g, b, 25);
    rect(430, 0, 210, height);
    fill(0, 0, b, 25);
    rect(640, 0, 210, height);
    fill(0, g, 0, 25);
    rect(850, 0, 210, height);
    fill(r, g, b, 25);
    rect(1060, 0, 210, height);
    fill(0, 25);
    rect(1270, 0, 0, height);
  } else {
    stroke(0);
    strokeWeight(abs(mouseX - pmouseX));
    beginShape();
    vertex(20, 720);
    vertex(80, 0);
    vertex(140, 720);
    vertex(200, 720);
    vertex(260, 0);
    vertex(320, 720);
    vertex(380, 720);
    vertex(440, 0);
    vertex(500, 720);
    vertex(560, 720);
    vertex(620, 0);
    vertex(680, 720);
    vertex(740, 720);
    vertex(800, 0);
    vertex(860, 720);
    vertex(920, 720);
    vertex(980, 0);
    vertex(1040, 720);
    vertex(1100, 720);
    vertex(1160, 0);
    vertex(1220, 720);
    endShape(CLOSE);
  }
}

void mousePressed() {
  textSize(azar);
  fill(azar, azar, azar);
  text("FUCK ME", mouseX, mouseY);
}

void keyPressed() {
  fill(azar, azar, azar);
  rect(posX + (mouseX - 900) + 200, posY + mouseY + 100, 270, 200, 20);
  beginShape();
  vertex(posX + (mouseX - 900) + 250, posY + mouseY + 300);
  vertex(posX + (mouseX - 900) + 270, posY + mouseY + 300);
  vertex(posX + (mouseX - 900) + 450, posY + mouseY + 400);
  endShape(CLOSE);
  textSize(50);
  fill(0);
  text("Te invito", posX + (mouseX - 900) + 230, posY + mouseY + 180);
  textSize(30);
  text("a mi fiestita", posX + (mouseX - 900) + 230, posY + mouseY + 250);
}



