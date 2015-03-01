

float dist;
float cor = 0;


void setup() {
  size(700, 500);
  background(255);
  colorMode(HSB, 360, 100, 100);
  background(random(360), 30, 100);
}

void draw() {

  if (mousePressed) {

    dist = dist(pmouseX, pmouseY, mouseX, mouseY);
    noStroke();
    fill(cor, 100, 100);
    ellipse(pmouseX, pmouseY, dist, dist);
    stroke(0.1);

    strokeWeight(dist/80);
    ellipse(mouseX, mouseY, dist, dist);
  }
  
  cor = cor + 1; // incrementa a cor para que mude sozinha
  
  if (cor > 360) { // serve para que a cor não pare de mudar no valor 360
    cor = 0;
  }
 
  noStroke(); // faz a barra 
  fill(255, 255, 255);
  fill(cor, 100, 100);
  rect(0, 480, 700, 20);
  fill(0);
  text("A cor actual é: " + cor, 10, 495);
  text("Click space to restart ", 570, 495);
}

void keyPressed() {
  
  if (key == 's' && key == 'S') {
    saveFrame();
  }
  
  if (key == ' ') {
    background(random(360), 30, 100);
  }
}


  




