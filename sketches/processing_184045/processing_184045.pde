

//VARIABLES
int total = 100;
float [] posicioX = new float[total];
float [] posicioY = new float[total];
float [] vx = new float[total];
float [] vy = new float[total];

float sz;

float gruixLinia;

float color1 = 0;
float color2 = 255;
float color3 = 253;


void setup() {
  size(600, 400);
  

  //posición inicial
  for (int i=0; i<total; i++) {
    posicioX[i] = width/2;
    posicioY[i] = height/2;
    vx[i]= random(-10, 10);
    vy[i]= random(-10, 10);
  }


  sz=4;
  gruixLinia = 1;
}

void draw() {

  fill(0,20);
  noStroke();
  rect(0,0,width,height);

  fill(color1,color2,color3);


  //actualización
  for (int i=0; i<total; i++) {
    posicioX[i] = posicioX[i] + vx[i];
    posicioY[i] = posicioY[i] + vy[i];

    //atoms
    noStroke();
    ellipse(posicioX[i], posicioY[i], sz, sz);

    strokeWeight(gruixLinia);
    stroke(random(255), random(255), random(255));
    line(posicioX[i]-sz/2, posicioY[i]-sz/2, posicioX[i]+sz/2, posicioY[i]+sz/2);
    line(posicioX[i]+sz/2, posicioY[i]-sz/2, posicioX[i]-sz/2, posicioY[i]+sz/2);


    sz = sz + 0.0005;
    gruixLinia = gruixLinia + 0.00005;

    //rebotes
    if ((posicioX[i] > width)||(posicioX[i] < 0)) {
      vx[i] = -vx[i];
    }

    if ((posicioY[i] > height)||(posicioY[i] < 0)) {
      vy[i] = -vy[i];
    }
  }
}

//REINICIAR TODO
void mousePressed() {
  for (int i=0; i<total; i++) {
    posicioX[i] = mouseX;
    posicioY[i] = mouseY;
    sz = 4;
    gruixLinia = 1;
    color1 = random(50,255);
    color2 = random(50,255);
    color3 = random(50,255);
  }
}

