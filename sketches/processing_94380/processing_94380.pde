
int posX;
int posY;
float matiz;



void setup() {
  size(1280, 720);
  colorMode(HSB, 360, 100, 100);
  background(0);
}

void draw() {

  matiz=matiz+0.5;
  if (matiz==360) {
    matiz=0;
  }


  fill(matiz, 100, 100);
  rect(0, 0, width/7, height);

  fill(matiz/4+90, 100, 100);
  rect(50, 400, 80, 80);
  ellipse(90, 250, 80, 80);
  triangle(40, 70, 90, 15, 140, 70);

  if (mousePressed) {    
    fill(matiz/5, 34, 21);
  } 
  else {
    fill(matiz/2, 51, 98);
  }

  ellipse(mouseX, mouseY, 80, 80);
}



