
// CCA   Cyclic Cellular Automata  with  MOORE  neighborhood
// Mario Vincent Turp   from the Qbasic version of Sjoerd.J.Schaper  (Primordial soup)

//  MOUSE Click  To STOP or reSTART the process  ***********************************

int [][][] cell ;
int [] TL;

//    CHOISIR ici les valeurs nbSTATE, THRESHOLD (SEUIL) et rayon du voisinage :
//    Choose  here your own values :
int nbSTATE = 4;     //     Nb of Colors  
int RANGE=1;         //     Range of the neighborhood 
int THR= 2 ;        //      THRESHOLD

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
  frameRate(10);           // speed of the simulation
  germe= 241164;
  randomSeed(germe);
  vHeight= 300 ;

  cell = new int [width][vHeight][2];

  TL = new int [nbSTATE+1] ;    

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



  if(tt>298)  noLoop() ;   //   for SAFETY  ONLY  (online version)

}

/////////////////////////////
void work()  {

  int ival, ivalu ;
  float amt, rval, rmoy;
  int dins, ix,iy ,i, j ;

  int SOM =0;                   

  for (int y = 0; y < vHeight ; y++) {
    for (int x = 0; x <  width ; x++) {


      for (int ii=0; ii< nbSTATE ; ii++)  {

        TL[ii] = 0 ;   // initialisation

      }

      for( int rn= y-RANGE ; rn<=y+RANGE; rn++)  {   

        //   dins = RANGE -abs(rn-y);       //    von neumann
        dins=RANGE ;                        //  Moore


        for(int sn= x-dins;  sn<= x+dins; sn++)  {

          ix=  (sn + width) % width ;
          iy=  ( rn + vHeight) % vHeight ;
          i=cell[ix][iy][sw] ;
          TL[i]= TL[i]+1    ;            

        }  // sn
      } // rn


      i= cell[x][y][sw];
      j= (1 + i) % nbSTATE  ;

      if(TL[j] >= THR )   {    
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


  stroke(250,250,250) ;
  point(tt, height - ivalu)  ;         

}
//////////////////////////////

void mousePressed()  {

  NoPause = !NoPause ;
}
//////////////////////////////

//void keyPressed()  {                        //   for SAVING the IMAGE   
//  NoPause = false;
//  
//   String svaleur = "bidon" ;                  
//   
//    svaleur= "g64M_" + str(tt)+"_ST_" + str(nbSTATE) + "_TH_" + str(THR) + "_R_" + str(RANGE) ;
//    save(svaleur + ".png");
//  
//  println(svaleur);
//  
//}



