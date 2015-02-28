
// CCA   Cyclic Cellular Automata  with the von neumann  neighborhood
// Mario Vincent Turp    from the Qbasic version of Sjoerd.J.Schaper  (Primordial soup)

//  MOUSE Click  To STOP or reSTART the process  ***********************************

int [][][] cell ;
int [] TL;

//    CHOISIR ici les valeurs nbSTATE, rayon du voisinage von neumann et  THRESHOLD (SEUIL) :
//    Choose  here your own values  here :
int nbSTATE = 12;  //     Nb of Colors  
int RANGE=3;       //     Range of the neighborhood 
int THR=3;         //     THRESHOLD
//  others good results with   12, 4, 4    //    8 ,4 , 6  etc...
//////////////////////////////////////////////////////////
int sw=0;
boolean NoPause=true;
int tt=0;
int germe;

void setup()
{
  size(300  ,300);
  colorMode(HSB,1.0); 
  frameRate(15);           // speed of the simulation
  germe= 241164;
  randomSeed(germe);

  cell = new int [width][height][2];

  TL = new int [nbSTATE+1] ;    

  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {

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

  if(tt>300) NoPause=false;   //  for SAFETY  ONLY  (online version) 

}

/////////////////////////////
void work()  {

  int ival;
  float amt, u;
  int dins, ix,iy ,i, j ;


  for (int y = 0; y < height ; y++) {
    for (int x = 0; x <  width ; x++) {


      for (int ii=0; ii< nbSTATE ; ii++)  {

        TL[ii] = 0 ;   // initialisation

      }

      for( int rn= y-RANGE ; rn<=y+RANGE; rn++)  {   

        dins = RANGE -abs(rn-y);       //    von neumann

        for(int sn= x-dins;  sn<= x+dins; sn++)  {

          ix=  (sn + width) % width ;
          iy=  ( rn + height) % height ;
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


      amt = map(cell[x][y][1-sw], 0, nbSTATE, 0,1);

      set(x,y,color(amt,0.9,0.9));   


    }  //  x
  }//  y


  sw=1 - sw ;



}
//////////////////////////////

void mousePressed()  {

  NoPause = !NoPause ;
}
//////////////////////////////

//void keyPressed()  {                        //   for SAVING the IMAGE    
//  NoPause=false ;
//  String svaleur = "bidon" ;                  
//
//  svaleur= "g64_VN" + str(tt)+"_ST_" + str(nbSTATE) + "_TH_" + str(THR) + "_R_" + str(RANGE) ;
//  save(svaleur + ".png");
//
//  println(svaleur);
//
//}




