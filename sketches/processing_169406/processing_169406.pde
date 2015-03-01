
float posX = 0;
float posY = 0;
float speed = 5;
float azar;

void setup() {
  size(1280, 720);
  frameRate(10);
  smooth();
}

void draw() {
  background(frameCount);
  azar = int(random(50,255));
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
  
  posY = random(15,30);
  posX = posX + speed;
  speed = speed - 0.01;
}

void mousePressed() {
 textSize(azar);
 fill(azar,azar,azar);
 text("FUCK ME", mouseX, mouseY); 
}

void keyPressed() {
fill(azar, azar, azar);
rect(posX + (mouseX - 900) + 200, posY + mouseY + 100, 270,200, 20);
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


