
float posX;
float posY;

void setup() {
  size(600, 600);
  
  posX = 300;
  posY = 300;
}

void draw() {
  background(0);
  //alt+60 alt+62 menorque mayorque
  for (int i=0; i < 10; i=i+1) {

    fill(240, 20, 140);
    rect(posX, i*60, width/10, height/10);
    posX = posX + 0.1;
    posX = posX % 600;
    // posY = posY - int(random (-5, 5));
    println(i);
  }
}



