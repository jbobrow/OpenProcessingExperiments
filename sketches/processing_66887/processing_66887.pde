
float paso = PI /5;
float tam = 20;
float radius1 = tam * .33; float radius2 = tam * .90;  

void setup() {
  size (720, 400);    
  
  
}

void figura(int i, int j) {
PVector p = new PVector (i * 2 * tam + 10 * noise(i), j * 2 * tam + 10 * noise(j));
fill(63, 100, noise(i,j) * 255); 
float r = radius1;
float angle = PI * noise(i,j, frameCount / 100.0);
PVector p0 = new PVector(p.x + r * cos(angle), p.y + r * sin(angle));
beginShape();
  for (float a = 0; a < TWO_PI / paso; a ++) {
    r = a % 3 < 1 ? radius1 : radius2;
    angle = a * paso + PI * noise(i,j, frameCount / 100.0);
    vertex(p.x + r * cos(angle), p.y + r * sin(angle));  }
    vertex(p0.x, p0.y);
endShape();

}

void draw() {
  background(63, 152, 183);
  
  for (int i = 0; i <= width / (2 * tam) ; i++) {
    for (int j = 0; j <= height / (2 * tam); j++) {
      figura(i, j);
    }
  }
}

void mouseClicked() {
  int p  = floor(random(3, 32));
  paso = PI / p;
  println (p);
}

void keyPressed() {
  save("portada.png");
}



