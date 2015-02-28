
//PRACTICA 4 Sergi Ullod


int numeroboles = 10;
int colordibuix = 140;

// Fem la matriu de posicioX (una posicio x i una y per a cada bola)

float[] posicionsX = new float[numeroboles];

// Fem la matriu de posicioY

float[] posicionsY = new float[numeroboles];

// Fem la matriu de velocitatX

float[] velocitatX = new float[numeroboles];

// Fem la matriu de velocitatY

float[] velocitatY = new float[numeroboles];


void setup(){
  size(700,700);
  
  //executar desde la bola numero 0 fins la ultima bola (numero de bolas)
  
  for(int i=0; i<numeroboles; i++){
    //Posicions per la posicio de cada bola al atzar,entre tant i tant
    posicionsX[i] = random(width/2-90, width/2+90);
    posicionsY[i] = random(width/2-90, width/2+90);
    
    //Les velocitats de les boles son al atzar entre 1 i 4
    
    velocitatX[i] = random(1,4);
    velocitatY[i] = random(1,4);
    
  }
}

void draw(){
  
  background(180);
  
  //bucle
  
  for(int i = 0; i<numeroboles; i++){
    //Donem noves posicions aleatories, cada bola variara entre 8 i -8.
    posicionsX[i] += random(-8,8);
    posicionsY[i] += random(-8,8);
    
    //marquem els limits
    
    if((posicionsY[i]<0) || (posicionsY[i]<height)){
     
    velocitatY[i] = -velocitatY[i];
    }
    
    //Donem un nom al dibuix i li donem posicio
    
    dibuixarwazobski(posicionsX[i],posicionsY[i]);
  }
}

void dibuixarwazobski (float _x, float _y)
  {
    
int a;
int b;
  
a=300;
b=300;
  

//cos
stroke(0);
strokeWeight(30);
line(_x,_y-80,_x,_y+80);

//cames
line(_x,_y+80,_x+20,_y+100);
line(_x,_y+80,_x-20,_y+100);

//braÃ§os
line(_x+30,_y+40,_x-30,_y+40);

strokeWeight(4);
stroke(0,0,0);
fill(35,175,14);
  
  
//ull
fill(255,255,255);
ellipse(_x,_y-80,a/1.5,b/1.5);
  
//blau Ull
fill(colordibuix);
ellipse(_x,_y-80,a/3,b/3);
  
//nineta Ull
fill(0);
ellipse(_x,_y-80,a/6,b/6);
  
// Ull
fill(255,255,255);
ellipse(_x+10/10,_y-90,a/20,b/20);


    

  
}


 void mousePressed()

{
  colordibuix = color (mouseX, mouseY, 0);
}
    
       
    
    

