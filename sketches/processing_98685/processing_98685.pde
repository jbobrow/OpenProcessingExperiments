
int totalElements = 10;
 
float [] posX = new float [totalElements];
float [] posY = new float [totalElements];
float [] vX = new float [totalElements];
float [] vY = new float [totalElements];
 
float a=random (150, 255);
float b=random (0, 5);
 
void setup() {
  size(900, 900);
 
 
  for (int i=0; i <totalElements; i++) {
    posX [i] = random (width);
    posY [i] = random (height);
    vX [i] = random (-8, 8);
    vY [i] = random (-8, 8);
  }
}
 
void draw() {
 
  dibuixa_fons();
  for (int i=0; i <totalElements; i++) {
  actualitza_posicio (i);
  posiciona_element(posX [i], posY [i]);
  }
}
void dibuixa_fons() {
 
  background(140, 218, 252);
 
  stroke(#31F0FF);
  strokeWeight(b);
 
  for (int i = 0; i < 500; i = i + 1) {
    float mida = random(50);
    rect(random(width), random(height), mida, mida);
  }
}
 
 
void posiciona_element(float posX, float posY) {
 
  //Dibuix de la figura
  stroke(0);
  strokeWeight(5);
  noStroke();
  fill(#17D341);
  ellipse(posX, posY-70, 150, 116);
  fill(255);
  ellipse(posX-60, posY-70, 40, 116/2);
  ellipse(posX+60, posY-70, 40, 116/2);
  //outline barret
  noFill();
  stroke(5);
  ellipse(posX, posY-70, 155, 120);
 
  //cos
  fill(255);
  ellipse(posX, posY, 80, 40);
  //outline cos 2
  noFill();
  stroke(5);
  ellipse(posX, posY, 80, 40);
  //C1
  fill(255);
  rect(posX-40, posY-40, 80, 40);
 
  //ulls
  fill(0);
  ellipse(posX+15, posY-20, 6, 10);
  ellipse(posX-15, posY-20, 6, 10);
 
  //cap2
  noStroke();
  fill(255);
  ellipse(posX, posY-60, 50, 50);
 
  //outline cos 1
  noFill();
  stroke(5);
  rect(posX-40, posY-40, 80, 40);
 
  //Linia de "borrar"
  stroke(255);
  line(posX-35, posY, posX+35, posY);
}
 
 
 
void actualitza_posicio (int num_element) {
 
  posX [num_element] = posX [num_element] + vX[num_element];
  posY [num_element] = posY [num_element] + vY[num_element];
 
  if (posX [num_element] < 0 ||posX [num_element] > width) {
    vX [num_element] = -vX [num_element];
  } 
 
 
  if (posY [num_element] < 0 ||posY [num_element] > height) {
    vY [num_element] = -vY [num_element];
  } 
 
  //límits X
  if (posX[num_element] + 75 > width) {
    vX[num_element] = -vX[num_element];
    posX[num_element] = width -75;
  }
  if (posX[num_element]-75 <0) {
    vX[num_element] = -vX[num_element];
    posX[num_element] = 75;
  }
  //eix Y
  if (posY[num_element] + 20 > height) {
    vY[num_element] = -vY[num_element];
    posY[num_element] = height -20;
  }
  if (posY[num_element]-128 <0) {
    vY[num_element] = -vY[num_element];
    posY[num_element] = 128;
  }
}

//Bonus Track
//Diferents tormentes de fons
void mousePressed() {
  if (b == random (0,5)) {
    b = b-1;
  } else {
    b = random (0,5);
  }
}


