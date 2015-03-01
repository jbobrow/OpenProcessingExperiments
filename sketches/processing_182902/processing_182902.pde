

//PRÀCTICA 3 - VIDEOJOCS UPF 2015

//Varaibles

int x=665;
int y=447;

float midaPilotaX=75;
float midaPilotaY=75;

float posicioX=x/2;
float posicioY=y/2;

float velocitatX=4;
float velocitatY=4;
PImage foto;


void setup() {
  size(665,447);
  //ellipseMode (CENTER);
  fill(255);
  foto= loadImage ("fons.jpg");
  smooth();
}
    
void draw() {
  
//imatge de l'aigua + la pilota i el seu color + velocitat
  
 background(0);
 image (foto,0,0);
  //fill(183,167,72);
  //stroke(255,0,0); 
  strokeWeight(4); 
  ellipse(posicioX,posicioY, midaPilotaX,midaPilotaY);
  posicioX=posicioX+velocitatX;
  posicioY=posicioY+velocitatY;
  
//fem que reboti a les parets de la finestra
  
  if (posicioX>=width-(midaPilotaX/2)||posicioX<=0+(midaPilotaX/2)){
    velocitatX=-velocitatX;
  }
  if (posicioY>=height-(midaPilotaY/2)||posicioY<=0+(midaPilotaY/2)){
    velocitatY=-velocitatY;
        
      }
      
//Cambiem la posició i la velocitat de la pilota segons el ratolí  
  
}
void mousePressed () {
  posicioX= mouseX;
  posicioY= mouseY;
  
  velocitatX= random(-3,19);
  velocitatY= random(-3,19);
  
  fill(random(0,255), random(0,255), random(0,255), random(100,255));

}
    
  //Provant...
  
  void mouseReleased() {
    
    //opacitat
    
    fill (pmouseX,pmouseY,19,mouseX); 
    //velocitatX=pmouseX/10;
    //velocitatY=pmouseY/10;
  
  }

  
  
  
  
  
  
  
  
  



