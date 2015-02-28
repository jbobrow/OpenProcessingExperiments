
float aumento = 0;

 void setup (){
   background(0,0,0);
  size(800,600);
  colorMode(HSB);
}
void draw() {
  noStroke();
 fill(aumento/2,170,250,10);
  ellipse(mouseX, mouseY, 20*(aumento/40), 50*(aumento/100));
  fill(random(140),random(120),250,40);
ellipse(mouseX, mouseY, random(aumento/10), random(aumento/6));
  aumento +=10;
}

void mousePressed() {
  if (aumento == 0) {
    aumento = 255;
  } else {
    aumento = 0;
    loop();
  }
}
void mouseReleased() {
  noLoop();
}

