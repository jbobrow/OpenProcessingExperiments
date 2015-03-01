
int mida = 10;
int pilotes = 75;
float[] posicioX = new float[pilotes];
float[] posicioY = new float[pilotes];
float[] velocitatX = new float[pilotes];
float[] velocitatY = new float[pilotes];


void setup() {
  size(600, 300);
  noStroke();
  
  //QUE APAREGUIN LES BOLES AL MIG I VAGIN EN TOTES DIRECCIONS
  for (int i = 0; i<pilotes; i++) {
    posicioX[i] = width/2;
    posicioY[i] = height/2;
    velocitatX[i] = random(-5, 5);
    velocitatY[i] = random(-5, 5);
  }
}

void draw() {
  fill(0, 20);
  rect(0, 0, width, height);

  for (int i = 0; i<pilotes; i++) {
    posicioX[i] += velocitatX[i];
    posicioY[i] += velocitatY[i];
    //QUE NO SURTIN DEL QUADRAT SIUSPLAU
    if ((posicioX[i]<0)||(posicioX[i]>width)) {
      velocitatX[i] = -velocitatX[i];
    } 
    if ((posicioY[i]<0)||(posicioY[i]>height)) {
      velocitatY[i] = -velocitatY[i];
    } 

    fill(random(0, 255), random(0, 255), random(0, 255));
    ellipse(posicioX[i], posicioY[i], mida, mida);
  }
}

//explosió de sabor
void mousePressed() {
  for (int i=0; i<pilotes; i++) {
    posicioX[i] = mouseX;
    posicioY[i] = mouseY;
  }
}

