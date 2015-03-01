
Star[] stars = new Star[2000];
float z = 0;


//tamanho do array
int s = 20;
//posicoes

float posx[];
float posy[];
float posz[];

int pindex=0;


void setup() {
  size(800, 800, P3D);

  for (int i=0; i<stars.length; i++) {

    stars[i] = new Star(random(-width, width), random(-width, width), random(-width, width));
  }

  posx = new float[s];
  posy = new float[s];
  posz = new float[s];
}

void draw() {

  background(20); 

  
  for (int posicao = 0; posicao < s; posicao ++) {
    pushMatrix();
    lights();
    translate(posx[posicao], posy[posicao], posz[posicao]);
    fill(#FCF000);
    sphere(13);
    //point(posx[posicao], posy[posicao], posz[posicao]);
    popMatrix();
  }
  
  noStroke();

  pushMatrix();
  translate(0, 0, 0);
  fill(#FFA7A7);

  sphereDetail(10);
  popMatrix();






  rotateY(z);
  rotateZ(z);
  z = z + 0.001;


  for (int i=0; i<stars.length; i++) {
    stars[i].fly(0);
  }
}



class Star {
  float x;
  float y;
  float z;
  float s = random(2);

  Star(float starX, float starY, float starZ) {
    x = starX;
    y = starY;
    z = starZ;
  }

  void fly(int speed) {
    x = x - speed;
    y = y - speed;

    pushMatrix();
    translate(x, y, z);
    noSmooth();

    fill(#E4FFA7);

    noStroke();

    sphere(4);
    popMatrix();


    pushMatrix();  
    translate(z, y, x); 
    fill(#FFA7E5);
    box(5);
    popMatrix();
  }
}

void mouseMoved() {
  posx[pindex] = mouseX;
  posy[pindex] = mouseY;
  posz[pindex] = -z*20;
  pindex++; //isso é igual a pindex = pindex +1;
  if (pindex >=s) {
    pindex = 0;
  }
}



