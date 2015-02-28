

 //Amb una matriu podem tenir un munt de Kittis voltant
 //només cal canviar el valros de numKity

int sz = 20;
int numKitty = 10;
int colornou;


//creem una matriu de posicionsX con "numBoles" elements:
float[] posicionsX = new float[numKitty];
//el mateix per posicionsY:
float[] posicionsY = new float[numKitty];
//i per velocitatsX:
float[] velocitatsX = new float[numKitty];
//i velocitatsY:
float[] velocitatsY = new float[numKitty];
//i colorpilotes:
color[] colorpilotes = new color[numKitty];

void setup(){
  size (700,600);
  //posicions i velocitats
  
  for(int i=0; i<numKitty; i++){
    posicionsX[i]=random (width/2-100, width/2+100);
    posicionsY[i]=random (height/2-100, height/2+100);
    velocitatsX[i]=random(1,4);
    velocitatsY[i]=random(1,4);
    colorpilotes[i] = color(random(255),random(255),random(255));
  }
    
}


void draw(){
  background(0);
  
  //iniciem bucle perque faci les mateixes accions
  //a tots els valors de les matrius
  for(int i = 0; i<numKitty; i++){
    //actualitzem posicions
    posicionsX[i] += random(-5,5);
    posicionsY[i] += random (-5,5);

 //Delimitem amb els limits de la finestra:
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
   

  
   //i dibuixem
   fill(colorpilotes[i]);
  dibuixKitty (posicionsX[i],posicionsY[i]);
  }
}

void dibuixKitty (float _x, float _y){
  
  int mySz=10;
  
  //personatge
  //cara
  stroke(0);
  strokeWeight(4); 
  fill(255,255,255);
  ellipse(_x,_y-25,160,120);
  
  //nas
  strokeWeight(3); 
  fill(255,255,0);
  ellipse(_x,_y,15,10);
  
  //ull esquerre
  strokeWeight(2); 
  fill(0);
  ellipse(_x-42,_y-12,10,15);
  
  //ull dret
  ellipse(_x+42,_y-12,10,15);
  
  //bigoti
   stroke(0);
  strokeWeight(4); 
  line(_x+70,_y-20,_x+98,_y-18);
  line(_x+69,_y-9,_x+93,_y-5);
  line(_x+62,_y+2,_x+85,_y+8);
  
  line(_x-70,_y-20,_x-98,_y-18);
  line(_x-69,_y-9,_x-93,_y-5);
  line(_x-62,_y+2,_x-85,_y+8);
  
  //orelles
  fill(255);
  arc(_x-15, _y-75, 100, 80, PI*0.9,PI*1.2); 
  arc(_x+15, _y-75, 100, 80,PI*-0.2,PI*0.1); 
  noFill();
  arc(_x-175, _y-75, 300, 80,PI*-0.2,-0.15); 
  arc(_x+175, _y-75, 300, 80,PI*0.9,PI*1.2);
  
  //llaç
  strokeWeight(3); 
  fill(colornou);
  ellipse(_x+32,_y-80,40,40);
  ellipse(_x+52,_y-60,40,40);
  ellipse(_x+32,_y-80,15,15);
  ellipse(_x+52,_y-60,15,15);
  ellipse(_x+42,_y-70,30,30);
  
  
}

void mousePressed(){
  
 colornou = color (mouseX, mouseY, 0);
}



