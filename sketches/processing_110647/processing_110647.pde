
int N = 15;
float pasoX;
float pasoY;
float cx;
float cy;
float rad;
float[] angulo = new float[N*N];
float[] incA = new float[N*N];
float fase=PI/N;


void setup() {

  size(600, 400);
  background(255);

  cx=200; //posicion X
  cy=200; //posicion Y
  rad=50; //radio
  //incA=PI/22.5;
  pasoX = width/N;
  pasoY = height/N;

  for (int i=0; i<angulo.length; i++) {
    angulo[i] = random(0, PI*2);
    incA[i] = random(PI/360,PI/22.5);
  }
}

void draw() {

  noStroke();
  fill(0, 255, 250, 10);
  rect(0, 0, width, height);

  fase=map( mouseX, 0, width, 0, PI*2);


  int indice = 0;

  for (int j=0; j<N; j++) {
    for (int i=0; i<N; i++) {//i=i+1;
      cx = (i*pasoX)+(pasoX/2);
      cy = (j*pasoY)+(pasoY/2);
      float x = cx + rad*sin(angulo[indice]+(fase*i));
      float y = cy + rad*cos(angulo[indice]+(fase*i));
      stroke(250, 0, 255, 50);
      line(x, y, cx, cy);
      fill(250, 250, 0, 50);
      noStroke();
      ellipse(x, y, 10, 10);
      
      angulo[indice]+=incA[indice];//angulo = angulo + incA
      indice++;
    }
  }
  
 

}
// void mousePressed(){
  
 // fill(150, 50, 250, 50);
 // rect(0, 0, width, height);
  
  
  
  //------------



