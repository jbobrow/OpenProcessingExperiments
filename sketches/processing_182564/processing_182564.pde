
class Temps{
  
  int enrera;
  Temps(){
  
  enrera=10000+millis();
  }
  
  int segonsEnrera(){
    int resultat = (int)((enrera-millis())/ 1000)%60;
    if (resultat < 0){
        resultat = 0;
      }
    if(resultat<4){
      fill(255,0,0);
    }  
      return resultat; 
   }
   boolean fiEnrera(){
     return segonsEnrera()==0;
   }
   
   
   
  
   void dibuixaComptaEnrere(){
    fill(0,0,255);
    text(segonsEnrera(), 200, 50);
    noFill();
    rect(152,25,100,40);    
  }
}
Temps cronometre;
int click=0;
int suma;
void setup(){
  size(400,300);
  cronometre=new Temps();
}
void draw(){
  background(255);
 
  cronometre.dibuixaComptaEnrere();
  
  if(cronometre.fiEnrera()){
    text("acabat",50,100);
  }
  if(cronometre.segonsEnrera()==0){
    background(255);
    text("Has fet " + suma + " clicks",125,150);
    text("Podràs superar el teu rècord?",125,175);
  }
 
  fill(0);
  text(suma,200,100);
}

void mousePressed(){
    click=click+1;
    suma=suma+1;
    if(cronometre.segonsEnrera()==0){
      suma=suma-1;
    }
}


