
void setup() {
 size(800,400);
  background(255);
  smooth();
  fill(0);
  text("just click",width/2, height/2);
  noStroke();
    
}
 
 
void draw() {
}
 
void mousePressed() {
  background(255);
  int quantos=10;
  for (int i= 0; i<quantos/2; i++) {
    noStroke();
    //stroke(100);
    fill(round(random(1))*255);
    float tam=width/2-(i*width/quantos);
    ellipse(width/4, height/2, tam, tam);
    fill(round(random(1))*255);
    ellipse(2*width/4, height/2, tam, tam);
    fill(round(random(1))*255);
    ellipse(3*width/4, height/2, tam, tam);
  }
}

