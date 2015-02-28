
// en aquesta pràctica s'utilitza les matrius per tenir diferents dibuixos(cotxes) que es mouen de forma random walker. 
//A més a més, si els cotxes es troben més avall de mitja pantalla els llums augmenten.
//També s'utilitza la funció mousePressed per controlar un dels cotxes i on es cliqui amb el ratolí aquest canvii de posició.

int numCotxes = 5;
int a;
int b;
int c;
int d;
int i;
int cotxeControlat;
color colorback;

//creem una matriu de posicionsX con "numCotxes" elements:
float[] posicionsX = new float[numCotxes];

float[] posicionsY = new float[numCotxes];

float[] velocitatsX = new float[numCotxes];

float[] velocitatsY = new float[numCotxes];

void setup(){
  size(700,700);
  a=10;
  b=10;
  c=10;
  d=10;
  i=0;
  colorback=color(255);
  
  //inicialitzem posicions i:
  for(int i = 0; i<numCotxes; i++){
    posicionsX[i] = width/2;
    posicionsY[i] = height/2;
    velocitatsX[i]= random(-a,b);
   velocitatsY[i]= random(-c,d);
  }
}

void draw(){
  background(colorback);


  //iniciem un bucle perque faci les mateixes accions
  //a tots els valors de les matrius
  for(i = 0; i<numCotxes; i++){
    
    posicionsX[i] += velocitatsX[i];
    posicionsY[i] += velocitatsY[i];
    
   
    //comprobem limits X
    if(((posicionsX[i]-55)<=0)||((posicionsX[i]+55)>=width)){
      velocitatsX[i]= -velocitatsX[i];
    } 
    else{
     velocitatsX[i]= random(-a,b);
    }
    
    //comprobem limits Y
  
    if(((posicionsY[i]-50)<=0)||((posicionsY[i]+50)>=height)){
      velocitatsY[i] = -velocitatsY[i];
    }
   else{
     velocitatsY[i]= random(-c,d);
   }
    
  
 // i dibuixem el cotxe
  
   //miralls
ellipse(posicionsX[i]-55,posicionsY[i]-10,15,10);
ellipse(posicionsX[i]+55,posicionsY[i]-10,15,10);

//vidre
stroke(0);
strokeWeight(4);
fill(182,242,250);
 rect(posicionsX[i]-50,posicionsY[i]-50,100,60,40,40,0,0);
 
 //parabrises
strokeWeight(2);
line(posicionsX[i]+2,posicionsY[i]-5,posicionsX[i]+30,posicionsY[i]-30);

 
 //rodes
 fill(0);
 rect(posicionsX[i]-50,posicionsY[i]+2,15,50,0,0,5,5);
 
 rect(posicionsX[i]+35,posicionsY[i]+2,15,50,0,0,5,5);
 
 //part central
 fill(255,0,0);
 rect(posicionsX[i]-60,posicionsY[i]-10,120,50,30,30,15,15);
 
 //llums esquerra
 strokeWeight(1);
 fill(255,247,3);
 ellipse(posicionsX[i]-45,posicionsY[i]+5,15,15);
 ellipse(posicionsX[i]-35,posicionsY[i]+20,10,10);
 
 //si el cotxe esta a la part superior els llums mantenen la mida, sino es fan més grans
 if (posicionsY[i]<=height/2){
   ellipse(posicionsX[i]-45,posicionsY[i]+5,15,15);
   ellipse(posicionsX[i]-35,posicionsY[i]+20,10,10);
 }
 else {
   ellipse(posicionsX[i]-45,posicionsY[i]+5,25,25);
   ellipse(posicionsX[i]-35,posicionsY[i]+20,15,15);
 }

 //llums dreta
 ellipse(posicionsX[i]+45,posicionsY[i]+5,15,15);
 ellipse(posicionsX[i]+35,posicionsY[i]+20,10,10);
 
 if (posicionsY[i]<=height/2){
   ellipse(posicionsX[i]+45,posicionsY[i]+5,15,15);
   ellipse(posicionsX[i]+35,posicionsY[i]+20,10,10);
 }
 else {
   ellipse(posicionsX[i]+45,posicionsY[i]+5,25,25);
   ellipse(posicionsX[i]+35,posicionsY[i]+20,15,15);
 }
 
 //matricula
 fill(255);
 rect(posicionsX[i]-20,posicionsY[i]+25,40,10);
 
 //lletres matricula
textSize(7);
fill(0);
 text("0637 FHP",posicionsX[i]-14,posicionsY[i]+33);
 
 //mercedes
 fill(200);
ellipse(posicionsX[i],posicionsY[i],12,12);
line(posicionsX[i],posicionsY[i],posicionsX[i],posicionsY[i]-6);
line(posicionsX[i],posicionsY[i],posicionsX[i]-4.5,posicionsY[i]+3);
line(posicionsX[i],posicionsY[i],posicionsX[i]+4.5,posicionsY[i]+3);

//radiador
line(posicionsX[i]-22,posicionsY[i]+12,posicionsX[i]+22,posicionsY[i]+12);
line(posicionsX[i]-22,posicionsY[i]+14,posicionsX[i]+22,posicionsY[i]+14);  
line(posicionsX[i]-22,posicionsY[i]+16,posicionsX[i]+22,posicionsY[i]+16);
line(posicionsX[i]-22,posicionsY[i]+18,posicionsX[i]+22,posicionsY[i]+18);

}
//es canvïa el color del fons en función del quadrant en el que es troba el cotxe controlat,1er i 3er quadrant=granate i 2n i 4rt quadrant=verd
  if((posicionsY[cotxeControlat]<=height/2)&&(posicionsX[cotxeControlat]<=width/2)){colorback=color(100,0,0);
  }
   
  if((posicionsY[cotxeControlat]<=height/2)&&(posicionsX[cotxeControlat]>=width/2)){colorback=color(0,100,0);
  }
  
  if((posicionsY[cotxeControlat]>=height/2)&&(posicionsX[cotxeControlat]<=width/2)){colorback=color(0,100,0);
  }
  
  if((posicionsY[cotxeControlat]>=height/2)&&(posicionsX[cotxeControlat]>=width/2)){colorback=color(100,0,0);
  }
}

//quan es cliqui a un lloc, el cotxe controlat es col·locara en el lloc on es cliqui
void mousePressed()
{
posicionsX[cotxeControlat]=(mouseX);//en funcio de la posició X on cliques, el cotxe canvia a una posició X o una altra
posicionsY[cotxeControlat]=(mouseY);//en funcio de la posició Y on cliques, el cotxe canvia a una posició Y o una altra

 if(mouseX<55){
  posicionsX[cotxeControlat]=mouseX+55;
 }

 if(mouseY<50){
  posicionsY[cotxeControlat]=mouseY+50;
 }

 if(mouseX>width-55){
  posicionsX[cotxeControlat]=mouseX-55;
 }

 if(mouseY>height-50){
  posicionsY[cotxeControlat]=mouseY-55;
 }

}



