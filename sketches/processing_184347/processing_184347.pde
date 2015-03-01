
//PRÀCTICA 4 - VIDEOJOCS UPF 2015

int mida=50;

int numeroPilotes=35;

int posicioX1=50;
int posicioY1=50;
int velocitatX1=4;
int velocitatY1=4;

//MATRIUS

float[] posicioX=new float [numeroPilotes];
float[] posicioY=new float [numeroPilotes];
float[] velocitatX=new float [numeroPilotes];
float[] velocitatY=new float [numeroPilotes];


//PImage foto;


void setup() {
  size(665,447);
  fill(255);
  noStroke();
  //foto= loadImage ("fons.jpg");
  smooth();
  for(int i=0; i<numeroPilotes; i++){
    posicioX[i]=mida;
    posicioY[i]=mida;
    velocitatX[i]=random(2,7);
    velocitatY[i]=random(2,7);
      }  
  }
    
    
void draw() {
  background(0);
  strokeWeight(4);
  
  
  //Iniciem el bucle i creem una pilota i el seu color aleatori
  
  for(int i=0; i<numeroPilotes; i++){
  
  ellipse(posicioX[i],posicioY[i], mida,mida);
  stroke(0);
  fill(random(0,255), random(0,255), random(0,255), random (150,200));
   
  posicioX[i]=posicioX[i]+velocitatX[i];
  posicioY[i]=posicioY[i]+velocitatY[i];
  
  //fem que reboti a les parets de la finestra
  
  if (posicioX[i]>=width-(mida/2)||posicioX[i]<=0+(mida/2)){
    velocitatX[i]=-velocitatX[i];
  }
  if (posicioY[i]>=height-(mida/2)||posicioY[i]<=0+(mida/2)){
    velocitatY[i]=-velocitatY[i];
  }
    
  //Si les pilotes toquen a la dreta de la finestra->fons vermell
  //Si les pilotes toquen a l'esuerrra de la finestra-> fons blau
  
  if (posicioX[i]>=width-(mida/2)) {
    background(255,0,0,100);
  }
  if (posicioX[i]<=0+(mida/2)) {
    background(10,3,255,100);
  }
    
    
  }
  
  //Pilotes blanques (en surten dues i no sé perquè!!)
  
  strokeWeight(3);
  fill(255);
  smooth();
  stroke(0);
  ellipse(posicioX1,posicioY1, mida,mida);
  posicioX1=posicioX1+velocitatX1;
  posicioY1=posicioY1+velocitatY1;
  
  
  //fem que reboti a les parets de la finestra
  
  if (posicioX1>=width-(mida/2)||posicioX1<=0+(mida/2)){
    velocitatX1=-velocitatX1;
  }
  if (posicioY1>=height-(mida/2)||posicioY1<=0+(mida/2)){
    velocitatY1=-velocitatY1;
  }
  
}
  
  
  void mousePressed(){
  
  for(int i = 0; i<numeroPilotes; i++){
    velocitatX[i] = random(3,7);
    velocitatY[i] = random(3,7);
        }
  
  fill(random(0,255), random(0,255), random(0,255), random(100,255));
  
  
}
  
  
  
  
  
  


  
  
  
  

  
   
  


  
  
  
  
  

