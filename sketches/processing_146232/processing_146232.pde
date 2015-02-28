
//A partir d'una matriu, obtenim una certa quantitat de Doraemons 
//voltant per la pantalla només cal canviar el valors de numBoles.


int sz= 30;
int numBoles= 30;
int colorcos= 180;

//crear una matriu de posicionsX amb "numBoles" elements:
float[]posicionsX= new float[numBoles];
//el mateix per posicionsY:
float[]posicionsY=new float[numBoles];
//i per velocitatsX:
float[]velocitatsX=new float[numBoles];
//i velocitatsY:
float[]velocitatsY=new float[numBoles];
//i colorDoraemon:
color[]colorDoraemon= new color[numBoles];

void setup(){
  size(800,800);
  //posicions i velocitats
  for(int i =0; i<numBoles; i++){
    posicionsX[i]= random(width/2-100,width/2+100);
    posicionsY[i]=random(height/2-100,height/2+100);
    velocitatsX[i]= random(1,5);
    velocitatsY[i]= random(1,5);
    
    colorDoraemon[i]=color(random(255),random(255),random(255));
  }
}

void draw(){
  background(247,217,241);
  
  //iniciar el bucle perquè faci les mateixes accions
  //a tots els valors de les matrius
  for(int i = 0; i<numBoles; i++){
    //actualitzar les posicions
  posicionsX[i] += random(-5,5);
  posicionsY[i] += random(-5,5);
  
  //comprovar els límits X
  if((posicionsX[i]<0)||(posicionsX[i]>width)){
    velocitatsX[i]= -velocitatsX[i];
  }
    //comprovar límits Y
    if((posicionsY[i]<0)||(posicionsY[i]>height)){
      velocitatsY[i] = -velocitatsY[i];
    }
    
    //dibuixar
  fill (colorDoraemon[i]);
  dibuixarDoraemon(posicionsX[i],posicionsY[i]);
 }
}

void dibuixarDoraemon (float _x, float _y) 

{

  
  //CAP
  fill(colorcos);
  stroke(0);
    ellipse(_x,_y,150,150);
   
//COS BLANC
  fill(255);
  strokeWeight(1);
  ellipse(_x,_y+10,130,120);
   
//ULL ESQUERRE
  ellipse(_x-20,_y-40,40,50);
   
//ULL DRET
    ellipse(_x+20,_y-40,40,50);
   
//ULL NEGRE ESQUERRE
  fill(0);
   ellipse(_x-15,_y-35,15,20);
   
   
//ULL NEGRE DRET
  ellipse(_x+15,_y-35,15,20);
   
//ULL BLANC DRET
  stroke(255);
  fill(255);
  ellipse(_x+12,_y-35,4,7);
   
   
//ULL BLANC ESQUERRE
  ellipse(_x-12,_y-35,4,7);
  //BOCA
  arc(_x,_y+10,100,80,0,PI);
   line(_x,_y,_x,_y+50);
line(_x,_y,_x,_y-7);
 
//NAS
  stroke(0);
  fill(250,76,79);
  ellipse(_x,_y-16,20,20);
  fill(255);
  stroke(255);
  ellipse(_x-2,_y-22,4,4);
   
   
 
   
//CASCAVELL
stroke(0);
 fill(247,203,40);
 ellipse(_x,_y+73,28,28);
  rect(_x+1,_y+67,27,2,4);
 fill(198,160,18);
 ellipse(_x,_y+76,5,5);
 
 
    //BOCA
    fill(255);
  arc(_x,_y+10,100,80,0,PI);
   line(_x,_y,_x,_y+50);
line(_x,_y,_x,_y-7);
 
//BIGOTIS
line(_x-15,_y+5,_x-60,_y+5);
line(_x+15,_y+5,_x+60,_y+5);
line(_x-14,_y+15,_x-55,_y+25);
line(_x+14,_y+15,_x+55,_y+25);
line(_x-14,_y-1.5,_x-54,_y-20);
line(_x+14,_y-1.5,_x+54,_y-20);

}

void mousePressed()
{
colorcos= color (mouseX, mouseY, 0);
  
}



  
  



