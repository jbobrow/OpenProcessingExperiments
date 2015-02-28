
//víctor Tabares//
//P4
//matriu de moviment de diferents sketchs on interectuem amb el cursor i variem el color i la posició de les voles.

 
int sz = 10;
int numCap = 5;
int colorCap;
 
//creem una MATRIU de posicionsX com si fos "numBoles", però en el nostre cas li direm nombre de caps i representa al nombre d'elements:
float[] posicionsX = new float[numCap];

//posicionsY:
float[] posicionsY = new float[numCap];

//velocitatsX:
float[] velocitatsX = new float[numCap];

//velocitatsY:
float[] velocitatsY = new float[numCap];

//color com a variable:
color[] colorpilotes = new color[numCap];

void setup(){
  size(800,800);
  
  //inicialitzem posicions i velocitats de totes les boles, caps:
  for(int i = 0; i<numCap; i++){
    posicionsX[i] = random(width/2-300, width/2+300);
    posicionsY[i] = random(height/2-300, height/2+200);
    
    // Les velocitats obeixen als randoms i per tant cada pilota por seguir una trajectoria diferent
    velocitatsX[i] = random(5,5);
    velocitatsY[i] = random(5,5);
    
    //Color
    colorpilotes[i] = color(random(10), random(255), random(100));
  }
}


 
void draw(){
  background(colorCap-50);
 
  //iniciem un bucle per a que realitzi les accions d'una manera indefinida i contínua
  //tindrem un problema amb le strajectories que he intentat varirar modificant valors, però no he aconsewguit que seguixin una trajectoria ja que cada cop que sexecuta el bukle cada cap canvia la seva trajectoria i per llogicament es molt complicat que aleatoriament aquesta trajectoria segueixi la mateixa direcció que l'anterior.
  
  for(int i = 0; i<numCap; i++){
    
    //actualitzem posicions
    //cal que siguin simetriques si no ho son acabaran sortin de la pantalla.
    
    posicionsX[i] += random(-5,5);
    posicionsY[i] += random(-5,5);
 
    //comprobem limits X
    if((posicionsX[i]<0)||(posicionsX[i]>width)){
      velocitatsX[i] = -velocitatsX[i];
    }
    //comprobem limits Y
    if((posicionsY[i]<0)||(posicionsY[i]>height)){
      velocitatsY[i] = -velocitatsY[i];
    }
 
 //Delimitem amb els limits de la finestra:
    //posX
    if(posicionsX[i]<2*50)
    {
      posicionsX[i] = 50*2;
    }
    if(posicionsX[i]>width-9*50/2)
    {
      posicionsX[i] = width-9*50/2;
    }
    //posY
    if(posicionsY[i]<2*50)
    {
      posicionsY[i] = 50*2;
    }
    if(posicionsY[i]>height-2*50)
    {
      posicionsY[i] = height-2*50;
    }
   
   //sketchem
   fill (colorpilotes[i]);
   SP(posicionsX[i],posicionsY[i]);
  }
}
void SP (float _x, float _y)
   
  {
    int mySz = 10;
     
    //SKETCH
  
//cap
stroke(255,100,3);
fill(255,100,3);
ellipse( _x,_y,300,300); 
//300 170

//cara marró 
stroke(126,49,1);
strokeWeight(2);
fill(126,49,1);
ellipse( _x,_y,160,135);

//elipse carn cara 
stroke(250,205,177);
strokeWeight(2);
fill(250,205,177);
ellipse( _x,_y,105,135);

//ull blanc esquerre
stroke(255);
strokeWeight(2);
fill(255);
ellipse( _x-26,_y+8,51,65);

//ullblanc dret
//stroke(255);
strokeWeight(2);
fill(255);
ellipse( _x+25,_y+8,51,65); 

//pupila esuqerra
stroke(0);
strokeWeight(1);
fill(colorCap);
ellipse(_x+21,_y+10,10,10);
 
//pupila dreta 
stroke(0);
strokeWeight(1);
fill(colorCap);
ellipse( _x-20,_y+10,10,10);
     
  }
  void mousePressed()
   
  {
    colorCap = color (mouseX, mouseY, 10);
}



