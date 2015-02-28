
//victor tabares
//rebot controlat, retorn de posició amb el cursor i canvi de color de le spupiles
//tinc un problema amb el sketch, però ja esta controlat. aquest queda com a definitiu.
  
 
int sz = 300;// mida dels caps
int numCap = 5;
 int colorCap;
 
//creem una matriu de posicionsX com si fos "numBoles", però en el nostre cas li direm nombre de caps i representa al nombre d'elements:
float[] posicionsX = new float[numCap];

//posicionsY:
float[] posicionsY = new float[numCap];

//velocitatsX:
float[] velocitatsX = new float[numCap];

//velocitatsY:
float[] velocitatsY = new float[numCap];

//color com a variable:
color[] colorcap = new color[numCap];
 
 
 
 
//gracies aquesta funció canviarem la posició de les cares
void mousePressed(){
  
  //reinicializamos las velocidades:
  for(int i = 0; i<numCap; i++){
    velocitatsX[i] = random(1,5);
    velocitatsY[i] = random(1,5);
    }
    
//podem variar diferents paràmetres com el color per exemple (color de les pupiles)
if(sz<100){
     sz = sz+8;
   }
   if (sz>=100){
     sz = 300;
   }
   
       colorCap = color (mouseX, mouseY, 10);

}
 
 
 
 
 
 
void setup(){
  size(800,800);
  
  //inicialitzem posicions i velocitats de totes les boles, caps:
  for(int i = 0; i<numCap; i++){
    posicionsX[i] = width/2;
    posicionsY[i] = height/2;
    
    // Les velocitats obeixen als randoms i per tant cada cap por seguir una trajectoria diferent
    velocitatsX[i] = random(5,5);
    velocitatsY[i] = random(5,5);
    
    
}
}
 
void draw(){
background(100,100,200);

  //bucle per a que es reprodueixin continuadament
 
  for(int i = 0; i<numCap; i++){
    //actuaizamos posiciones
    posicionsX[i] += velocitatsX[i];
    posicionsY[i] += velocitatsY[i];
 
    // X
    if((posicionsX[i]<sz/2)||(posicionsX[i]>width-sz/2)){
      velocitatsX[i] = -velocitatsX[i];
    }
    // Y
    if((posicionsY[i]<sz/2)||(posicionsY[i]>height-sz/2)){
      velocitatsY[i] = -velocitatsY[i];
    }
   
   
   
   //SKETCH
  
//cap
stroke(255,100,3);
fill(255,100,3);
ellipse(posicionsX[i],posicionsY[i],300,300); 
//300 170

//cara marró 
stroke(126,49,1);
strokeWeight(2);
fill(126,49,1);
ellipse(posicionsX[i],posicionsY[i],160,135);

//elipse carn cara 
stroke(250,205,177);
strokeWeight(2);
fill(250,205,177);
ellipse(posicionsX[i],posicionsY[i],105,135);

//ull blanc esquerre
stroke(255);
strokeWeight(2);
fill(255);
ellipse(posicionsX[i]-26,posicionsY[i]+8,51,65);

//ullblanc dret
stroke(255);
strokeWeight(2);
fill(255);
ellipse(posicionsX[i]+25,posicionsY[i]+8,51,65); 

//pupila esuqerra
stroke(0);
strokeWeight(1);
fill(colorCap);
ellipse(posicionsX[i]+21,posicionsY[i]+10,10,10);
 
//pupila dreta 
stroke(0);
strokeWeight(1);
fill(colorCap);
ellipse(posicionsX[i]-20,posicionsY[i]+10,10,10);
     
  }
 
 
}





