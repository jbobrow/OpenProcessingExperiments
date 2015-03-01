
PImage fingerpoint;
PImage racket;
PImage back;
int score=0,bonus=0,r=30,a=3; 
float x=300;
float y=300;
float disx, disy; 
float posx, posy;
void setup()
{
  size(600,600);
  smooth();
  noStroke();
  //reset();
  
  //image//
  fingerpoint = loadImage("fingerpoint.png");
  racket = loadImage("racket.png");
  back = loadImage("backgroundtest.png");
}


void draw(){
  image(back,0,0);
  
  //background(0);
  
  
//ball//
bouncyball(); //
   
}

void bouncyball() { 
  //distance between the ball and racquet
  disx=x-mouseX;
  disy=y-mouseY; 
  
  //Pan receiver//
  
  image(racket,mouseX-100,mouseY-95);
  racket.resize(150,260);
  

  //ball animation//
    if(r>95 || r<30){ 
          a*=-1; 
          r=r+a;}
            
          r=r+a; //hold the ball and bouncy bouncy
    if(r==30){
        x+=disx*0.2;
        y+=disy*0.2;
        posx=disx;
        posy=disy;
        }
  //ball moves//
  else { 
    //float x=width/2;y=height/2;
    
    x+=posx*0.07; 
    y+=posy*0.07;
    
    if(x>width ||x<0){posx=-posx;}
    if(y>height ||y<0){posy=-posy;}
    }
    fill(255);
    ellipse( x,y,r,r); 
    fill(0);
  }


