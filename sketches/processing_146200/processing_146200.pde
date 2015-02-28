

 
int sz = 20;
int numPorc = 10;
int colornou;
 
 
//creem una matriu de posicionsX amb "numPorc" elements:
float[] posicionsX = new float[numPorc];
//el mateix per posicionsY:
float[] posicionsY = new float[numPorc];
//i per velocitatsX:
float[] velocitatsX = new float[numPorc];
//i velocitatsY:
float[] velocitatsY = new float[numPorc];
//i colorpilotes:
color[] colorpilotes = new color[numPorc];
 
void setup(){
  size (700,600);
  //posicions i velocitats
   
  for(int i=0; i<numPorc; i++){
    posicionsX[i]=random (width/2-100, width/2+100);
    posicionsY[i]=random (height/2-100, height/2+100);
    velocitatsX[i]=random(1,4);
    velocitatsY[i]=random(1,4);
    colorpilotes[i] = color(random(255),random(255),random(255));
  }
     
}
 
 
void draw(){
  background(0);
   
  //iniciem el bucle perque, d'aquesta manera es puguin realitsar les mateixes accións
  //a tots els valors de les matrius
  for(int i = 0; i<numPorc; i++){
    //actualitzem posicions
    posicionsX[i] += random(-5,5);
    posicionsY[i] += random (-5,5);
 
 //Delimitem els elements, amb els limits de la finestra:
    //posX:
    if(posicionsX[i]<2*10)
    {
      posicionsX[i] = 10*2;
    }
    if(posicionsX[i]>width-9*10/2)
    {
      posicionsX[i] = width-9*10/2;
    }
    //posY
    if(posicionsY[i]<2*10)
    {
      posicionsY[i] = 10*2;
    }
    if(posicionsY[i]>height-2*10)
    {
      posicionsY[i] = height-2*10;
    }
    
 
   
   //i comencem a dibuixar
   fill(colorpilotes[i]);
  dibuixPorc (posicionsX[i],posicionsY[i]);
  }
}
 
void dibuixPorc (float _x, float _y){
   
  int mySz=10;
   
  //personatge
  //cara
  stroke(0);
  strokeWeight(2);
  fill(247,202,224);
  ellipse(_x,_y-25,160,160);
   
  //nas
  strokeWeight(2.5);
  fill(173,110,140);
  ellipse(_x,_y,55,32);
  fill(0);
  ellipse(_x-10,_y,10,14);
  ellipse(_x+10,_y,10,14);
   
  //ull esquerre
  strokeWeight(2);
  fill(255,255,255);
  ellipse(_x-32,_y-51,50,55);
  fill(colornou);
  ellipse(_x-22,_y-58,8,8);
   
  //ull dret
  fill(255,255,255);
  ellipse(_x+22,_y-52,50,50);
  fill(colornou);
  ellipse(_x+10,_y-58,8,8);
  
  //boca
  fill(0);
  ellipse(_x,_y+28,30,15);
  
  //dents
  fill(255,255,255);
  rect(_x-1,_y+21,8,10);
  rect(_x-6,_y+21,5,8); 
   
 }
 
 void mousePressed(){
   
 colornou = color (mouseX, mouseY, 0);
}



