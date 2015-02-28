
//Júlia Fort Muñoz
//P4 random walker

int sz = 10;
int numcares = 6;
 
 
//matriu amb les posicions de x i y del numcares

float[] posX = new float[numcares];
float[] posY = new float[numcares];

//matriu amb les velocitats de x i y del numcares
float[] velX = new float[numcares];
float[] velY = new float[numcares];
 
 
 
void setup(){
  size (800,800);
  
  //inici posicions i velocitats 
  for(int i=0; i<numcares; i++){
    posX[i]=random (width/2-100, width/2+100);
    posY[i]=random (height/2-100, height/2+100);
    velX[i]=random(1,4);
    velY[i]=random(1,4);
  }
     
}
 
 
void draw(){
  
  background(255);
   
  //executem els walkers
  for(int i = 0; i<numcares; i++){
    
    //actualitzem pos X i Y
    posX[i] += random(-5,5);
    posY[i] += random (-5,5);
 
 //Delimitem:
    if(posX[i]<20)
    {
      posX[i] = 20;
    }
    if(posX[i]>width-20)
    {
      posX[i] = width-20;
    }
    if(posY[i]<20)
    {
      posY[i] = 20;
    }
    if(posY[i]>height-20)
    {
      posY[i] = height-20;
    }
    
 
   
  dibuixcares (posX[i],posY[i]);
  }
}
 
void dibuixcares (float _x, float _y){
   
  int mySz=10;
   


//personatge
  
  
 //cap
fill(255, 212, 57);
stroke(252,200,30);
strokeWeight(15);
ellipse(_x, _y, 200, 200);

//boca
strokeWeight(5);
stroke(1);
ellipse(_x, _y, 50, 50);
noStroke();
fill(255,212,57);
rect(_x-50, _y-50, 100, 55);

//ulls
fill(255, 255, 255);
strokeWeight(2);
stroke(1);
ellipse(_x+20, _y-30, 35, 35);
ellipse(_x-20, _y-30, 35, 35);

//dins ulls
fill(1);
noStroke();
ellipse(_x+20, _y-30, 25, 25);
ellipse(_x-20, _y-30, 25, 25);

//reflexe ulls
fill(255,255,255);
noStroke();
ellipse(_x+25, _y-35, 15, 15);
ellipse(_x-15,_y-35, 15, 15);

//ratjos
fill(252,200,30);
triangle(_x-150, _y, _x-100, _y-30, _x-100, _y+30);
triangle(_x+150, _y, _x+100, _y+30, _x+100, _y-30);

triangle(_x, _y-150, _x+30, _y-100, _x-30, _y-100);
triangle(_x, _y+150, _x-30, _y+100, _x+30, _y+100);

triangle(_x+85, _y+45, _x+45, _y+85, _x+100, _y+100);
triangle(_x-85, _y-45, _x-45, _y-85, _x-100, _y-100);
triangle(_x+85, _y-45, _x+45, _y-85, _x+100, _y-100);
triangle(_x-85, _y+45, _x-45, _y+85, _x-100, _y+100);
   
}


