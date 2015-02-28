

var audioElement1 = document.createElement("audio");
var audioElement2 = document.createElement("audio");


int numAstros = 10; // Numero d'astronautes
int PosX, PosY, VelX, VelY; // Posicio i velocitat del coet

PImage img;  //Es defineix la imatge

float[] posX = new float[numAstros]; //matriu per posicions X i Y
float[] posY = new float[numAstros]; 
float[] velX = new float[numAstros]; //matriu per velocitats X i Y
float[] velY = new float[numAstros];

void setup () {
  
  frameRate (10); // numero de "frames" per segon
  
  size (600,600); // tamany de la finestra
  
   img = loadImage("http://files.myopera.com/Nazareth1994/albums/7063862/Estrellas-De-Noche.jpg");  // S'introdueix la imatge de fons a través de l'enllaç
  
  
 for(int i=0; i<numAstros; i++) { // Es donen valors al moviment de l'astronauta
  posX[i] = width/2;  
  posY[i] = height/2;
  velX[i] = random (4,20);
  velY[i] = random (4,20);
  
 }  
 
  PosX = width/2;  // Es donen valors al moviment del coet
  PosY = height/2;
  VelX = 6;
  VelY = 6;
  
  audioElement1.setAttribute("src", "laser.mp3");
  audioElement2.setAttribute("src", "astronautes.mp3");
 
 
}


void draw () {
  
   
  image (img,0,0,620,620);  // Es col·loca la imatge
  
  for(int x=width/6; x<width; x=x+200) {      // Apliquem el fons estatic de la malla d'estrelles
    for(int y=height/6; y<height; y=y+200) {
      
      
      fill (250,250,150);   // Dbuix de les estrelles
      noStroke ();
      ellipse( x, y,20,20); 
      triangle (x,y-30,x-10,y,x+10,y);   
      triangle (x,y-5,x-30,y-5,x,y+10); 
      triangle (x,y-5,x+30,y-5,x,y+10); 
      triangle (x,y+10,x-10,y,x-20,y+30);
      triangle (x,y+10,x+10,y,x+20,y+30);    
      
    }
  } 


  for(int x=width/3;x<width;x=x+200)  {     // Apliquem el fons estatitic de la malla de planetes
    for(int y=height/3;y<height;y=y+200) {
      
      
      ellipse (x,y,80,30);  // Dibuix dels planetes
      ellipse (x,y,30,80);
      fill (1);
      ellipse (x,y,60,60);
      fill (250,250,150);
      ellipse (x,y,40,40);     
      
      
      
   }
  } 

  
 for(int i=0; i<numAstros; i++) {  // Posicions i velocitats de l'astronauta
  posX[i] += velX[i];  
  posY[i] += velY[i];

if((posX[i]<30)||(posX[i]>width-30)){   // Es condicionen les restriccions de l'astronauta amb els limits de la finestra 
    velX[i] = -velX[i];
  } 
  
    
  if((posY[i]<30)||(posY[i]>height-90)){
    velY[i] = -velY[i];
  } 
  
  
    
    fill (250,250,250);  // Dibuix de l'astronauta
    rect(posX[i]-15, posY[i]+10, 30, 50);
    rect(posX[i]-15, posY[i]+60, 10, 35);
    rect(posX[i]+5, posY[i]+60, 10, 35);
    rect(posX[i]+15, posY[i]+20, 20, 10);
    rect(posX[i]-35, posY[i]+20, 20, 10);
    ellipse (posX[i], posY[i], 50, 50);
    fill (171,250,250);
    ellipse (posX[i], posY[i]-5, 35, 25);
 
 }   
 
  
 
  PosX = PosX+VelX;  // Posicions i velocitats del coet
  PosY = PosY+VelY;
  
   if((PosX<300)||(PosX>width+250)){  // Es condicionen les restriccions del coet amb els limits de la finestra  
    VelX = -VelX;
     audioElement1.setAttribute("src","laser.mp3");
     audioElement1.play();
   } 
  
    
  if((PosY<-250)||(PosY>300)){
    VelY = -VelY;
     audioElement1.setAttribute("src","laser.mp3");
     audioElement1.play();
  } 
  
  
  fill(250,250,250);   // Dibuix del coet
    ellipse(PosX-width/2-15,PosY+height/2,150,120);
    rect(PosX-width/2-125,PosY+height/2-50,125,100);
    
    fill(75,140,180);
    ellipse(PosX-width/2-30,PosY+height/2,30,30);
    ellipse(PosX-width/2+20,PosY+height/2,30,30);
   
    fill(250,0,0);
    ellipse(PosX-width/2-175,PosY+height/2-20,75,30);
    ellipse(PosX-width/2-175,PosY+height/2+20,75,30);
    fill(250,250,0);
    ellipse(PosX-width/2-160,PosY+height/2-20,50,15);
    ellipse(PosX-width/2-160,PosY+height/2+20,50,15);
 
 
}

void mousePressed () {  // Cada cop que es prem el mouse s'escolten astronautes parlan
  audioElement2.setAttribute("src","astronautes.mp3");
  audioElement2.play();
}




