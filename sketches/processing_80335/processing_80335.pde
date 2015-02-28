
int posicion1=15;
int posicion2=20;

void setup(){
  size(600, 600);
  noStroke();
}
void draw(){
  background(posicion1);
  int i = 0;
  while (i < 600){
    fill(i);
    ellipse(i, mouseY, 0, height);
    ellipse(i, 600, mouseX, height);
    i = i + 10;
    stroke (posicion2,150,105);
    posicion1=(posicion2+1)%200;
  }
}

