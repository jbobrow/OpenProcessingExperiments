
float taille;

void setup() {
  taille = 1;
  size(400,400);
  background(0,80,125);
  frameRate(1000);
  
}

void draw() {
  strokeWeight(3);
  line(100,300,100,0);
  line(200,400,200,100);
  line(300,0,300,300);
}

void mouseMoved() {
  if((mouseX+taille/2 >= 99 && mouseX+taille/2 <= 101)
      && !(mouseY+taille/2 >= 300 && mouseY+taille/2 <= 400)) {
    println("perdu");
    taille = 0;
  }
  else {
    taille+=0.3;
    fill(50,255,125);
    ellipse(mouseX,mouseY,taille,taille);
  }
}
