

float X,Y,Z;
float[] centerX = new float[40]; // variables globals
float[] centerY = new float[40];
float stepT=1;  
float T=0; 
float x0=100;
float y0=500;
float x1=750;
float y1=300;
float vx=mouseX-x0;
float vy=mouseY-y0;

int accio = 0;


PImage pilota;
PImage canasta;
PImage punt;


void setup()
{
  // background(255, 204, 0);
  size(900,800);  
  smooth(); 
  loadPixels();
  canasta = loadImage("canasta.gif");
  pilota = loadImage("pilota.gif");
  punt = loadImage("punt.gif");
}



void draw() 
{

  strokeWeight(4); 
  background(255, 204, 0); // Al posar el backgroun al draw, la pilota no deixa rasetre.
  point(800,310);
  image(canasta,x1,y1);
  
  if(accio==0)
  { //quad(x0,y0,x0,y0-100,x0+100,y0-100,x0+100,y0);
    line(x0,y0,mouseX,mouseY);
    image(pilota,x0,y0);
  }  

  if(accio==1)
  {
    T=T+stepT;  // el temps avança
    trajectoria();
   // if(centerX[0]>750)
   if((centerX[0]-x1)*(centerX[0]-x1)+(centerY[0]-y1)*(centerY[0]-y1)<2000)  // O sigui: si la distancia 
                               //  del centre de la bola a l'origen de la canasta es < 100 . Hi podeu posar mes 
                               // condicions amb l'operador & (and).
    {
     background(0,255,0);
     image(punt,0,0);
     image(canasta,x1,y1);
    } 
  
     image(pilota,centerX[0],centerY[0]);
    
  
  
  if(centerY[0]>1000)   
  {                  
    accio=0;        // reiniciem variables
    T=0;            
    x0=100;         
    y0=500;         
  }           

    if(centerY[0]<0)   // rebot al sostre - DIONIS
  {                  
    
    x0=centerX[0];     // comencem un nou tir parabolic
    y0=centerY[0]+10;  
    vy=-(vy+T/10); 
    T=0;         
  }        
  
  
  if(centerX[0]>900)  
  {                    // rebot en paret vertical x = 900
    x0=centerX[0]-10;     // comencem un nou tir parabolic
    y0=centerY[0];
    vx=-vx;   
    vy=vy+T/10; 
    T=0;  
  }   

  
  if(centerX[0]<0)   
  {                    // rebot en paret horizontal y = 0
    x0=centerX[0]+10;     // comencem un nou tir parabolic
    y0=centerY[0];
    vx=-vx;   
    vy=vy+T/10; 
    T=0;  
  }                 
 
} // Fi d'accio 1
}  // Fi de draw()





void trajectoria()
{

//  centerX[0]=x0+vx*T;        // p. ex. una parabola
  centerX[0]=x0+vx*T;  
  centerY[0]=y0+vy*T+T*T/20; 
  
  
}
void mouseClicked()
{
  accio = 1;
  {
    vx=(mouseX-x0)/20;
    vy=(mouseY-y0)/20;
  }
}



