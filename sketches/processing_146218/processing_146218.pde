
//Marina Sarto
//Pràctica4_Random walker
//Múltiples personatges movent-se per pantalla. En prémer el ratolí, algunes de les seves propietats canvien

int sz = 20;
int numMickey = 5;
int noucolor = 170;
 
//fem una matriu de posicions X i Y, i velocitats X i Y amb "numMickey" com a element:
  //posicions X i Y
float[] posicionsX = new float[numMickey];
float[] posicionsY = new float[numMickey];
  //velocitats X i Y:
float[] velocitatsX = new float[numMickey];
float[] velocitatsY = new float[numMickey];
 
 
void setup(){
  size(600,600);
  //posicions i velocitats dels Mickeys:
  for(int i = 0; i<numMickey; i++){
    posicionsX[i] = random(width/2-150, width/2+150);
    posicionsY[i] = random(height/2-80, height/2+120);
    //Cada velocitat pot anar diferent
    velocitatsX[i] = random(1,7);
    velocitatsY[i] = random(1,8);
 
  }
}
 
void draw(){
  background(230,255,255);
 
  //iniciem un bucle perque faci les mateixes accions
  //a tots els valors de les matrius
  for(int i = 0; i<numMickey; i++){
    //actualitzem posicions
    posicionsX[i] += random(-3,3);
    posicionsY[i] += random(-3,3);
 
    //Defimin límits X i Y
      //X
    if((posicionsX[i]<0)||(posicionsX[i]>width)){
      velocitatsX[i] = -velocitatsX[i];
    }
      //Y
    if((posicionsY[i]<0)||(posicionsY[i]>height)){
      velocitatsY[i] = -velocitatsY[i];
    }
   
   //Dibuixem
   dibuixarMickey(posicionsX[i],posicionsY[i]);
  }
}
void dibuixarMickey (float _x, float _y)
   
  {
    int mySz = 10;
    
    
//MICKEY
  //forma cap
  stroke(0);
  fill(0);
  ellipse(_x,_y,160,160);
  
  //orella esquerra
  ellipse(_x-65,_y-75,80,80);
 
  //orella dreta
  ellipse(_x+65,_y-75,80,80); 
  
  //forma cara
  stroke(255);
  fill(255);
  ellipse(_x-30,_y-25,65,80);
  ellipse(_x+30,_y-25,65,80);
  ellipse(_x-60,_y+20,35,40);
  ellipse(_x+60,_y+20,35,40);
  ellipse(_x-60,_y+20,35,40);
  ellipse(_x,_y+40,127,80);
  ellipse(_x-58,_y+30,34,25);
  ellipse(_x+58,_y+30,34,25);
  ellipse(_x-55,_y+26,35,55);
  ellipse(_x+55,_y+26,35,55);
  ellipse(_x-53,_y+30,36,55);
  ellipse(_x+53,_y+30,36,55); 
  ellipse(_x,_y,20,20);
  ellipse(_x,_y+50,85,75);
 
  //boca
  stroke(0);
  fill(255);
  arc(_x,_y+10,115,155,PI*0.3,PI*0.7);
  fill(0);
  arc(_x,_y+8,120,135,0,PI);
  fill(255);
  arc(_x,_y+7,125,85,0,PI);
  noStroke();
  fill(noucolor);
  ellipse(_x,_y+70,30,10);
 
  //ulls
  stroke(0);
  fill(255);
  ellipse(_x-15,_y-15,15,40);
  ellipse(_x+15,_y-15,15,40);
  fill(0);
  ellipse(_x-15,_y-2,5,10);
  ellipse(_x+15,_y-2,5,10);
 
  //nas
  fill(255);
  arc(_x,_y+15,60,25,PI*1.2,PI*1.8);
  fill(0);
  ellipse(_x,_y+20,30,15);
  fill(255);
  ellipse(_x-5,_y+17,10,5);
 
  
  }
  void mousePressed()
   
  {
    noucolor = color (mouseX, mouseY, 0);
}


