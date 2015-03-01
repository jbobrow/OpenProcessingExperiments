
float mov =1;
void setup() {
  size(600, 600);
  colorMode(HSB);
  strokeWeight(30);
}
void draw() {
  for (int i = 400;i>0;i=i-60) {
    stroke((i/3)+(mouseY+2), mov, 255);
    rect(i,mov, i, mov);
   
    rect(mov, 250, i, i);
      stroke((i/1)+(mouseY-mov), mov, 135);
    rect(i,mov, i, mov);
     stroke((i/6)+(mouseX/mov), 234, i);
    rect(i,mov, i, mov);
  }
   mov = mov +0.4;
}

