
// CCA   Cyclic Cellular Automata  with  CROSS  neighborhood
// Mario Vincent Turp

//  MOUSE Click  To STOP or reSTART the process  ***********************************

int [][][] cell ;
int [] VTL;

//    CHOISIR ici les valeurs nbSTATE, THRESHOLD (SEUIL) et rayon du voisinage :
//    Choose  here your own values :
int nbSTATE = 8;     //     Nb of Colors  
int RANGE=3;         //     Range of the neighborhood 
int THR= 3 ;         //     THRESHOLD
// 
//////////////////////////////////////////////////////////
int sw=0;
boolean NoPause=true;
int tt=0;
int germe;
int vHeight;

void setup()
{
  size(300  ,400);
  background(0);

  colorMode(HSB,1.0); 
  frameRate(45);           // speed of the simulation
  germe= 241164;
  randomSeed(germe);
  vHeight= 300 ;

  cell = new int [width][vHeight][2];

  VTL = new int [nbSTATE+1] ;    

  for (int x = 0; x < width; x++) {
    for (int y = 0; y < vHeight; y++) {

      cell[x][y][sw]  = int(random(0,nbSTATE)  ) ;
      cell[x][y][1-sw]  =  0  ; 


    }
  }
}

///////////////
void draw()  {


  if(NoPause)  {
    work();   
    tt=tt+1;      
  }



  if(tt>2397)  noLoop() ;   //   for SAFETY  ONLY  (online version)

}

/////////////////////////////
void work()  {

  int ival, ivalu  ;
  float amt, rval, rmoy;
  int  ix,iy ,i, j ;
  int mRANGE= -1*RANGE;

  int SOM =0;                   

  for (int y = 0; y < vHeight ; y++) {
    for (int x = 0; x <  width ; x++) {


      for (int ii=0; ii< nbSTATE ; ii++)  {

        VTL[ii] = 0 ;   // initialisation

      }

      // CROSS neighborhood
      for(int val= mRANGE;  val<= RANGE; val++)  {

        ix=  ( x + val + width) % width ;
        iy=  ( y + val +  vHeight) % vHeight ;
        i=cell[ix][iy][sw] ;
        VTL[i]= VTL[i]+1    ;     

        // the other diagonal

        ix=  ( x + val + width) % width ;
        iy=  ( y +  (-1*val) +  vHeight) % vHeight ;
        i=cell[ix][iy][sw] ;
        VTL[i]= VTL[i]+1    ;            



      } // val


      i= cell[x][y][sw];
      j= (1 + i) % nbSTATE  ;

      if(VTL[j] >= THR )   {    
        cell[x][y][1-sw] = j;
      }
      else{
        cell[x][y][1-sw] = i ;   
      }

      SOM= SOM + cell[x][y][1-sw]  ;

      amt = map(cell[x][y][1-sw], 0, nbSTATE, 0,1);

      set(x,y,color(amt,0.9,0.9));   


    }  //  x
  }//  y


  sw=1 - sw ;


  rval= float(SOM);
  rmoy=rval/float(vHeight*width)  ;
  ivalu = int( map(rmoy, 0, nbSTATE-1 ,0,100)  );  

  if(tt%width ==0 ) {

    fill(0) ;
    noStroke();
    rect(0,301,300,99);
    noFill();

  }
  stroke(250,250,250) ;


  point(tt % width , height - ivalu)  ;         

}
//////////////////////////////

void mousePressed()  {

  NoPause = !NoPause ;
}
//////////////////////////////

//void keyPressed()  {                        //   for SAVING the IMAGE   
//
//   NoPause=false;
//  
//   String svaleur = "bidon" ;                  
//   
//    svaleur= "g64Cr_" + str(tt)+"_ST_" + str(nbSTATE) + "_TH_" + str(THR) + "_R_" + str(RANGE) ;
//    save(svaleur + ".png");
//  
//  println(svaleur);
//  
//}


