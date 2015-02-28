
//  FROM Nat Sarkissian  Boids + Perlin Noise Flow Field.
//  http://www.openprocessing.org/visuals/?visualID=8407
//  I like this sketch. 
//  Here, one way of viewing directions.
//  RED    toward   WEST    //  around 270 degrees  toward NORTH   BLUE
//  GREEN  toward   EAST    //  around 90 degrees   toward SOUTH  YELLOW
//  PRESS  '1', '2' or '4' to change the OCTAVE for PERLIN. Default '1' .


float incX = 0.01;
float incY = 0.01;
int germe;
int octave = 1;
float PARAnd;

void setup(){  

  size(int(screen.width/1.5),int(screen.height/1.5));  

  background(255);  


  germe = (int)random(100000, 200000);   
  randomSeed(germe) ;
  noiseSeed(germe) ;

  noiseDetail(1,0.50) ;
  PARAnd = 2.0;      // FOR OCTAVE = 1 PARAnd = 2.0    else  PARAnd= 1.0


    dPERLIN() ;

}  
///////////////////
void draw(){  

}  
/////////////////////////////////////

/////////////////
void mousePressed(){  

  germe = (int)random(100000, 200000);   
  randomSeed(germe) ;
  noiseSeed(germe) ;
  dPERLIN() ;



}  
//
void keyPressed(){  


  if(key == '1') {
    octave= 1;
    PARAnd= 2.0 ;
  }
  else if(key=='2') {
    octave= 2;
    PARAnd= 1.0 ;

  }
  else if(key=='4') {
    octave= 4;
    PARAnd= 1.0 ;
  }
  else{
    octave= 1;
    PARAnd= 2.0 ;
  }

  noiseDetail(octave,0.50) ;

}  
//////////////////////////////////////////////////////////////////

void dPERLIN()  {


  float Xnoise = 0.0 ;
  float Ynoise, rval, rval2, ROUGE, VERT, BLEU, rvalX, rvalY;
  float ANGLE, dANGLE;
  int ival, iVELO;


  for (int y=0; y<height; y++)  {

    for (int x=0; x<width; x++)  {

      rvalX = (PARAnd*noise(incX*x  + PI,incY*y))*2.0 - 1.0;
      rvalY = (PARAnd*noise(incX*x - PI,incY*y))*2.0- 1.0 ;


      ANGLE = atan2(rvalY,rvalX) ;
      dANGLE = degrees(ANGLE) ;
      if(dANGLE<0.0)  {
        dANGLE = 360.0 + dANGLE;
      }


      if(dANGLE>=0.0 && dANGLE<180.0)  {              
        rval= map(dANGLE,0.0,180.0,0.0,1.0) ;
        ROUGE = (rval*250.0) ;                 // RED  toward   WEST      
        VERT =  (1.0 - rval)*250.0;            // GREEN  toward EAST    //  around 90 degrees  toward SOUTH  YELLOW
        BLEU = 0.0;
      }
      else if(dANGLE>=180.0 && dANGLE<270.0)  {        //  around 270 degrees  toward NORTH   BLUE
        rval= map(dANGLE,180.0,270.0,0.0,1.0) ;    
        BLEU = (rval*250.0) ;       
        ROUGE =  (1.0 - rval)*250.0;         
        VERT = 0.0;
      }
      else{

        rval= map(dANGLE,270.0,360.0,0.0,1.0) ;
        VERT = (rval*250.0) ;       
        BLEU =  (1.0 - rval)*250.0;     //  270 sera BLEU
        ROUGE = 0.0;

      }
      stroke(ROUGE, VERT, BLEU) ;
      point(x,y) ;


    }//  x


  } // y


   //save("g2_Perlin_DepPI_mPI_p01_p01.png") ;
}
/////////////////


