
import ddf.minim.*;
Minim minim;
AudioInput in;

int N = 15;
float pasoX;
float pasoY;
float cx;
float cy;
float rad;
float[] angulo = new float[N*N];
float[] incA = new float[N*N];
float fase=PI/N;
float radio;
 
 
void setup() {
 
  size(1024  , 800);
  background(255);
 
 
 minim = new Minim(this);
 in= minim.getLineIn();
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
 
 // noStroke();
  fill(0, 255, 250, 10);
  rect(0, 0, width, height);
 
  fase=map( mouseX, 0, width, 0, PI*2);
  //radio = 300;

for (int i = 0; i < in.bufferSize()-1; i++)

{
  float despX = float(width) / float(in.bufferSize());

stroke(255);
 // line(i*despX, ((height/2)-50) + 50*in.left.get(i),(i+1)*despX, ((height/2)-50 + in.left.get(i+1)));

} 
  int indice = 0;
 
  for (int j=0; j<N; j++) {
    for (int i=0; i<N; i++) {//i=i+1;
      cx = (i*pasoX)+(pasoX/2);
      cy = (j*pasoY)+(pasoY/2);
      
      //float locRad = rad * in.left.get(int(in.bufferSize()/(N*N))*(j*i));
      
      
      
      float x = cx + rad*sin(angulo[indice]+(fase*i));
      float y = cy + rad*cos(angulo[indice]+(fase*i));
      stroke(250, 0, 255, 50);
      line(x, y, cx, cy);
      
      fill(250, 250, 0, 50);
      noStroke();
      ellipse(x, y, 300*amplitudL(), 300*amplitudL());
       
      angulo[indice]+=incA[indice];//angulo = angulo + incA
      indice++;
    }
  }
   
  
 
}

float amplitudL(){
 float max = 0;

for (int i = 0; i < in.bufferSize(); i++){
 if(abs(in.left.get(i)) > max){
  max = abs(in.left.get(i));
 }
   
} 
 
 return max; 
  
  
}


