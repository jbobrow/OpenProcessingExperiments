
int cant = 60;

float[] X = new float[cant]; 
float[] Y = new float[cant]; 
float[] T = new float[cant]; 
float[] C = new float[cant]; 
float[] Cs = new float[cant]; 
float[] Cb = new float[cant]; 

float[] arranque = new float[cant]; 
int [] max = new int[cant]; 
float[] velx = new float[cant]; 
float[] vely = new float[cant]; 

float tamanio;

float velk=1;


//void keyPressed()
//{
//  if (value=RIGHT) {
//  velk=velk-0.1;
//  }
//}

void setup() {
size(900,600);
  //size(displayWidth, displayHeight);
background(0);
  for (int i = 0; i < cant; i++) {
    X[i]=random(0, width);
    Y[i]=random(0, height);
    T[i]=random(0, width/10);
    C[i]=int(random(255));
    Cs[i]=int(random(10, 255));
    Cb[i]=int(random(10, 255));

    arranque[i]= T[i] + random(T[i]);
    max[i] = int(random(10));
    velx[i]=random(-3, 3)+velx[i];
    vely[i]=random(-3, 3)+vely[i];
  }
}


void mouseClicked(){

  for (int i = 0; i < cant; i++) {
    X[i]=random(0, width);
    Y[i]=random(0, height);
    T[i]=random(0, width/10);
    C[i]=int(random(255));
    Cs[i]=int(random(10, 255));
    Cb[i]=int(random(10, 255));

    arranque[i]= T[i] + random(T[i]);
    max[i] = int(random(10));
    velx[i]=random(-3, 3)+velx[i];
    vely[i]=random(-3, 3)+vely[i];
}
}



void draw() {
  fill(0,map(mouseX,0,width,0,100)); 

  rect(0, 0, width, height);
  for (int i = 0; i < cant; i++) {

    if (i < cant-1) {
      float dist=(X[i]-X[i+1])*(Y[i]-Y[i+1]);
      float distcolor = map(dist, 0, width*height, 200, 0);
      stroke(C[i], Cs[i], distcolor);
   line(X[i], Y[i], X[i+1], Y[i+1] );
    }

    tamanio=random(0, width/10);
    planeta(X[i], Y[i], T[i], T[i], C[i], arranque[i], max[i], Cs[i], Cb[i]);
    X[i]=X[i]+velx[i]+velk;
    Y[i]=Y[i]+vely[i];
  }
}


void planeta(float rectX, float rectY, float alto, float ancho, float colorplaneta, float arranque, int jmax, float sat, float bri) {
  colorMode(HSB);
  noStroke();
  fill(255);
  fill(colorplaneta, sat, bri,map(bri,0,255,0,100));
  ellipse(rectX, rectY, alto, ancho);

  for (int j=0;j<jmax;j++) {
    stroke(colorplaneta, sat-j*10, bri-j*10);
    noFill();
    ellipse(rectX, rectY, arranque+(ancho*j*0.2), arranque+(alto*j*0.2));
  }
}

