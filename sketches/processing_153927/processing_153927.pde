
int x,y;   
int n ;
float accelerazione ;
float start=0, l=0; 
float quadrato, t;
 
void setup(){
  //impostazione parametri di creazione dei quadrati e di accelerazione
  quadrato=10;
  size(600,600,P3D); //dimensione finestra
  print (quadrato);
  n = 20; t=(width-quadrato*2)/n; //numero quadrati
  l=t*0.90;
  accelerazione =  PI/2/n;
  rectMode(CENTER);
  fill(0,0,255); //colore 
  smooth();
}
 //creazione effettiva e rotazione (ruotano in tempi di versi per creare l'illusione)
void draw(){
  background(255); //colore bg
  float m=start,mm=0;
  for(int a=0;a<n;a++){
    m+=accelerazione;mm=m;      //loop per le rotazioni
   for(int b=0;b<n;b++){
    mm+=accelerazione;
    pushMatrix();
    translate(quadrato+a*t+t/2, quadrato+b*t+t/2);
    rotate(mm);
    rect(0, 0, l,l);
   popMatrix();
   }
  }
  start-=accelerazione/5;  //velocità di rotazione
}



