
int margeif = 45;
int margeif1 = 35;
int margex = 35;
int marge = 25;
int gc = 200;
int vx = -10;
int vy = 10;
int aantal = 70;
float [] xa = new float[aantal];
float [] ya = new float[aantal];
float[] posx = new float[aantal];
float[] posy = new float[aantal];
float[] richtingx = new float[aantal];
float[] richtingy = new float[aantal];
float[] grootte = new float[aantal];
float[] kleur = new float[aantal];

float[] posx1 = new float[aantal];
float[] posy1 = new float[aantal];
void setup() {
  size(1300, 800, OPENGL);
  frameRate(50);
  noStroke();
  for (int i = 0; i < aantal; i++) {
    posx[i] = random(51, 1000);
    posy[i] = random(51, 1000);
    richtingx[i] = random(vx, vy);
    richtingy[i] = random(vx, vy);
    grootte[i] = i;
    kleur[i] = i;
    posx1[2] = random(100, width-100);
    posy1[2] = random(100, height-100);
  }
}

void draw() {
  background(0);
  fill(100, 0, 0);
  ellipse(posx1[2], posy1[2], 50, 50);
  for (int i = 1; i < aantal; i++) {
    xa[i-1] = xa[i];
    ya[i-1] = ya[i];
  }
  for (int i = 1; i < aantal; i++) {
    if (posx[69] < posx1[2]+margeif*grootte[2] && posx[69] > posx1[2]-margeif*grootte[2] && posy[69] > posy1[2]-margeif*grootte[2] && posy[69] < posy1[2]+margeif*grootte[2]) {
      grootte[2] += 0.005;
      if(grootte[2] < 1){
        grootte[2] = 2;
      }
 if (posx[69] < posx1[2]+margeif1*grootte[2] && posx[69] > posx1[2]-margeif1*grootte[2] && posy[69] > posy1[2]-margeif1*grootte[2] && posy[69] < posy1[2]+margeif1*grootte[2]) {
      posx1[2] = random(500, width-500);
      posy1[2] = random(500, height-500);
  }
      if (kleur[0] < 0.47) {
        kleur[0] += 0.001;
      }
    }

    else {
      grootte[2] -= 0.000015;
    }

    if (kleur[0] > 0 ) {
      kleur[0] -= 0.000003;
    }
    if (grootte[2] < 0.5) {
      grootte[2] = 2;
    }
    if (grootte[2] > 14) {
      grootte[2] = 2;
    }




    if (posx[i] > width-marge*grootte[2]*1.2) {
      posx[i] = width-marge*grootte[2]*1.2;
      richtingx[i] = random(vx, vy);
      richtingy[i] = random(vx, vy);
    }
    if (posy[i] > height-marge*grootte[2]*1.2) {
      posy[i] = height-marge*grootte[2]*1.2;
      richtingx[i] = random(vx, vy);
      richtingy[i] = random(vx, vy);
    }
    if (posx[i] < marge*grootte[2]*1.2) {
      posx[i] = marge*grootte[2]*1.2;
      richtingx[i] = random(vx, vy);
      richtingy[i] = random(vx, vy);
    }
    if (posy[i] < marge*grootte[2]*1.2) {
      posy[i] = marge*grootte[2]*1.2;
      richtingx[i] = random(vx, vy);
      richtingy[i] = random(vx, vy);
    }
    posx[i] += richtingx[i];
    posy[i] += richtingy[i];
    xa[aantal - 1] = posx[i];
    ya[aantal - 1] = posy[i];
  }
  for (int i = 1; i < aantal; i++) {
    noStroke();
    fill(151-kleur[0]*200, 120-i, 0);
    ellipse(xa[i], ya[i], i* grootte[2], i* grootte[2]);
    //fill(190, 150, 0);
    fill(0);
    ellipse(xa[69]+15*grootte[2], ya[69], 10*grootte[2], 7*grootte[2]);
    ellipse(xa[69]-15*grootte[2], ya[69], 10*grootte[2], 7*grootte[2]);
  }
}




