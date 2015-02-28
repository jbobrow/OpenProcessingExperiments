
//Definició de les variables//
int i = 30;
int j = 30;
int sz = 30;
int a;
color c;
int px,py;

int numBoles = 10;//num d'elements que es mouen per la pantalla//
float[] posX = new float[numBoles];
float[] posY = new float[numBoles];
float[] velX = new float[numBoles];
float[] velY = new float[numBoles];

void setup(){
  size(580, 600);
  colorMode(RGB);
  rectMode(CENTER);
 
 for(int a = 0; a<numBoles; a++){//Definim la posició i la velocitat de les pilotes//
    posX[a] = width/2;
    posY[a] = height/2;
    velX[a] = random(-2,4);
    velY[a] = random(-2,4); 
  }
   
}

void draw(){
  
  background(10);
  
  for(int f=0;f<=580;f+=10){//Estructura de repetició del fons//
   px=int(mouseX/600.0*f+(600-f)/2);
   py=int(mouseY/600.0*f+(600-f)/2);
   fill(0,f,0);
   rect(px,py,600-f,600-f);
 }
 
  for(int i=0;i<=580;i++){
  for(int j=0;j<=600;j++){
  
}
  }
  for(i=50; i< width; i+=80)//Repeticio d'elements, en aquest cas els rombes//
  for(j=50; j< height; j+=100){
  c= color(255-mouseX,mouseY,j);
  fill(c);
  strokeWeight(5);
  stroke(255);
  quad(i,j-50,i+40,j,i,j+50,i-40,j);; 
  }
  
  for(int a = 0; a<numBoles; a++){//Parametres de velocitat i rebot de les pilotes//
    posX[a] += velX[a];
    posY[a] += velY[a];
    
    if((posX[a]<20)||(posX[a]>570)){
      velX[a] = -velX[a];
    } 
    if((posY[a]<20)||(posY[a]>580)){
      velY[a] = -velY[a];
    } 
      
      noStroke();{
      fill(posX[a],posY[a],50);
      ellipse(posX[a],posY[a],sz,sz);
  }  

}
}




