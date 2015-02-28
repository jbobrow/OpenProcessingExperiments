
float ojoX;
float ojoY;
float ojoTono;
float ojoTalla;

void setup(){
  size(400, 400);
  smooth();
  colorMode(HSB, 255);
  ojoX = random(width);
  ojoY = random(height);
  ojoTono = random(255);
  ojoTalla = height/6;
}

void draw(){
  background(255);
  dibujaOjo();  
}

void mousePressed(){
  ojoX = mouseX;
  ojoY = mouseY;
}

void mouseDragged(){
  ojoX = mouseX;
  ojoY = mouseY;

  ojoTono += 2;
  ojoTono = ojoTono % 255;
}


void dibujaOjo(){
  strokeWeight(6);
  stroke(0);
  noFill();
  
  float ojoArriba = ojoY-ojoTalla/2;
  bezier(width/2, 0, width/2, ojoArriba/2, ojoX, ojoArriba/2, ojoX, ojoArriba);
  
  translate(ojoX, ojoY);
  fill(255);
  ellipse(0, 0, ojoTalla, ojoTalla);
  
  rotate(atan2(mouseY-ojoY, mouseX-ojoX));
  
  float distancia = dist(mouseX, mouseY, ojoX, ojoY);
  float iris = constrain(distancia, 0, ojoTalla/4);
  
  translate(iris, 0);
  fill(ojoTono, 200, 200);
  strokeWeight(3);
  ellipse(0, 0, ojoTalla/2, ojoTalla/2);
  
  float pupila = map(distancia, 0, dist(0, 0, width, height), height/40, height/13);
  noStroke();
  fill(0);
  ellipse(0, 0, pupila, pupila);
  
}

void keyPressed(){
  saveFrame("screen.png");
}

