
//  FROM Nat Sarkissian  Boids + Perlin Noise Flow Field.
//  http://www.openprocessing.org/visuals/?visualID=8407
//  Here, one way of viewing directions.

//  MOUSE CLICK FOR A NEW PICTURE

//  RED    toward   WEST    //  around 270 degrees  toward NORTH   BLUE
//  GREEN  toward   EAST    //  around 90 degrees   toward SOUTH  YELLOW
//  PRESS  '1', '2' or '4' to change the OCTAVE for PERLIN. Default '1' .


int fishNum = 800; 

int [][] MATRICE = new int [900][500] ;
//int [][] mCOULEUR = new int [900][500] ;

Fish[] fish = new Fish[fishNum];  
float [] XX0 = new float [fishNum] ;
float [] YY0 = new float [fishNum] ;
boolean [] bFISH = new boolean [fishNum] ;
int LEQUEL ;
float PARAnd = 1.0;
boolean vLOOP = true;

int germe ;
int TT;

float incX = 0.01;
float incY = 0.01;

void setup(){  

  size(900,500) ;
  background(255);  

  germe = (int)random(100000, 200000); 
  println(germe) ;
  randomSeed(germe) ;
  noiseSeed(germe) ;
  noiseDetail(1,0.50) ;
  PARAnd = 2.0;

  float widthM20 = (float)width - 20.0 ;
  float heightM20 = (float)height - 20.0 ;

  for(int i=0; i<fishNum; i++){  

    XX0[i] = random(20.0,widthM20);          // orig random(width)  avec random(height)
    YY0[i] = random(20.0,heightM20);
    fish[i] = new Fish(XX0[i], YY0[i] );    // ORIG
    bFISH[i] = true;

  }  

  dPERLIN() ;


  TT=0;
}  
///////////////////


void draw(){  

  if(vLOOP == true) {

    for(int i=0; i<fishNum; i++){  
      LEQUEL = i;
      fish[i].update();  
    }  

    TT=TT+1;
    if(TT>300) {
      noLoop() ;
      // MOUSE CLICK FOR NEW
    }
  }  

}  
/////////////////////////////////////
void mousePressed(){  

  germe = (int)random(100000, 200000);   
  println(germe) ;
  randomSeed(germe) ;
  noiseSeed(germe) ;
  background(100) ;

  for(int i=0; i<fishNum; i++){  
    LEQUEL = i;
    fish[i].init();  
  }

  dPERLIN() ; 
  loop() ;
  vLOOP = true;
  TT=0;

}  
/////////////////

//////////////////////////////////////////////////////////////////
class Fish {  

  float x,y;  

  float xv = random(-1,1), yv = 0.0 ;  // random(-1,1);  

  float tailStep = 0, tailSpeed = random(2,3);  

  float s = random(.05,.2);  

  float sx = -90, sy = 0;  
  float ex = 10, ey = 0;  

  float animOff = random(TWO_PI);  
  ////////////////////////  

  Fish(float x, float y){  

    this.x = x;  
    this.y = y;  

  }  

  void init() {

    float widthM20 = (float)width - 20.0 ;
    float heightM20 = (float)height - 20.0 ;

    fish[LEQUEL] = new Fish(random(20.0,widthM20) , random(20.0,heightM20) ) ; 
    bFISH[LEQUEL] = true;

  }

  void update(){  
    int ix,iy, imod;
    float rval, rn, rval2, rval3;

    this.tailStep += this.tailSpeed;  


    //// VOIR VITESSE non ACCUMULER  faire sans constrain
    this.xv = 5.0*(  PARAnd*noise(  this.x*incX + PI,this.y*incY, 0.0 )*2-1  )*.3;  
    this.yv = 5.0*(  PARAnd*noise(  this.x*incX - PI,this.y*incY, 0.0  )*2-1  )*.3;  

    //=========== HERE FOR ACCUMULATION OF SPEED
    //   this.xv += (  PARAnd*(noise(  this.x*incX + PI,this.y*incY, 0.0 )*2-1  )*.3;  
    //   this.yv += (  PARAnd*noise(  this.x*incX - PI,this.y*incY, 0.0  )*2-1  )*.3;  


    // this.xv = constrain(this.xv, -2,2);  
    // this.yv = constrain(this.yv, -2,2);  
    //===========

    this.x += this.xv;  
    this.y += this.yv;  

    if(bFISH[LEQUEL]==true)  {                            // NO WRAP on VERTICAL
                //   if(x>0.0 && x<width && y>0.0 && y<height)  {
                //   if(TT>30 && mCOULEUR[(int)x][(int)y] < 100)  {    // Discrimination of COLOR possible
      if(TT>30)  {
        drawFish();    
      }  
                //   } // FRONT
  } //   FISH true ou false


    ///////////////////////////////////////////


    if(this.x<-10){  
      this.x = width+10;  
    }  

    else if(this.x>width+10){  
      this.x = -10;  
    }  

    if(this.y<-10){  

      this.y = height+10;  
      bFISH[LEQUEL] = false;      // no Wrap on Vertical
    }  

    else if(this.y>height+10){  
      this.y = -10;  
      bFISH[LEQUEL] = false;     // no Wrap on Vertical
    }  


  }   
  /////////////////////////////////////////////////////

  void drawFish(){  

    int ix, iy;

    sy =0.0; 

    pushMatrix();  

    translate(this.x, this.y);  
    scale(this.s,this.s);  

    rotate( atan2(this.yv, this.xv) );  

    stroke(0) ;
    line( this.sx,this.sy, this.ex,this.ey);  

    popMatrix();  
  }  
} 
/////////////////////////////



