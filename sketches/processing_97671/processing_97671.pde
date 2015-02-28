
int totalElements = 10;

float [] posX = new float [totalElements];
float [] posY = new float [totalElements];
float [] vX = new float [totalElements];
float [] vY = new float [totalElements];

float a=random (150,255);
float b=random (0,5);

void setup() {
  size(900, 900);
  //noSmooth();
  
  for (int i=0; i <totalElements; i++) {
    posX [i] = random (width);
    posY [i] = random (height);
    vX [i] = random (-8, 8);
    vY [i] = random (-8, 8);
  }
}

void draw() {

  background(140, 218, 252);

//Fons de "pluja" XD
  stroke(#31F0FF);
  strokeWeight(b);

  for (int i = 0; i < 500; i = i + 1) {
    float mida = random(50);
    rect(random(width), random(height), mida, mida);
  } 
  
//figura
  stroke(0);
  strokeWeight(5);
  for (int i=0; i <totalElements; i++) {

    posX [i] = posX [i] + vX[i];
    posY [i] = posY [i] + vY[i];

    if (posX [i] < 0 ||posX [i] > width) {
      vX [i] = -vX [i];
    }   


    if (posY [i] < 0 ||posY [i] > height) {
      vY [i] = -vY [i];
    }   
//Dibuix de la figura

    noStroke();
    fill(#17D341);
    ellipse(posX[i], posY[i]-70, 150, 116);
    fill(255);
    ellipse(posX[i]-60, posY[i]-70, 40, 116/2);
    ellipse(posX[i]+60, posY[i]-70, 40, 116/2);
    //outline barret
    noFill();
    stroke(5);
    ellipse(posX[i], posY[i]-70, 155, 120);

    //cos
    fill(255);
    ellipse(posX[i], posY[i], 80, 40);
    //outline cos 2
    noFill();
    stroke(5);
    ellipse(posX[i], posY[i], 80, 40);
    //C1
    fill(255);
    rect(posX[i]-40, posY[i]-40, 80, 40);

    //ulls
    fill(0);
    ellipse(posX[i]+15, posY[i]-20, 6, 10);
    ellipse(posX[i]-15, posY[i]-20, 6, 10);

    //cap2
    noStroke();
    fill(255);
    ellipse(posX[i], posY[i]-60, 50, 50);

    //outline cos 1
    noFill();
    stroke(5);
    rect(posX[i]-40, posY[i]-40, 80, 40);

    //Linia de "borrar"
    stroke(255);
    line(posX[i]-35, posY[i], posX[i]+35, posY[i]);

    //límits 
    if (posX[i] + 75 > width) {
      vX[i] = -vX[i];
      posX[i] = width -75;
    }
    if (posX[i]-75 <0) {
      vX[i] = -vX[i];
      posX[i] = 75;
    }
    //eix Y
    if (posY[i] + 20 > height) {
      vY[i] = -vY[i];
      posY[i] = height -20;
    }
    if (posY[i]-128 <0) {
      vY[i] = -vY[i];
      posY[i] = 128;
    }
  }
}

//Diferents tormentes de fons
void mousePressed() {
  if (b == random (0,5)) {
    b = b-1;
  } else {
    b = random (0,5);
  }
}




