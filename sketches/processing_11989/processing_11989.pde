
// CCA   Cyclic Cellular Automata with the Greenberg-Hastings model (Version 2) .
// Mario Vincent Turp

//  MOUSE Click to STOP or CONTINUE the process  ***********************************

int [][][] cell ;
int [] VTL;

//    CHOISIR ici les valeurs nbSTATE, rayon du voisinage von neumann et  THRESHOLD (SEUIL) :
//    Choose  here your own values  here :
int nbSTATE = 6;  //     Nb of Colors  
int RANGE= 5;       //     Range of the neighborhood 
int THR= 15;         //     THRESHOLD
//  others good results (FROM Mirek's Celebration)  with   8,3,5  //  GH weak spiral  7,4,9  
//                                GH Percolation Mix  8,5,10   
//                                GH Multistrands  6,5,15  // Macaroni  5, 2 ,4
//////////////////////////////////////////////////////////
int sw=0;
boolean NoPause=true;
int tt=0;
int germe;

void setup()
{
  size(300  ,300);
  background(0);

  colorMode(HSB,1.0); 
  // frameRate(30);           // speed of the simulation
  germe= 241164;
  randomSeed(germe);

  cell = new int [width][height][2];

  VTL = new int [nbSTATE+1] ;    

  for (int x = 40; x < width-40; x++) {
    for (int y = 40; y < height-40; y++) {

      cell[x][y][sw]  = int(random(0,nbSTATE)  ) ;
      cell[x][y][1-sw]  =  0  ; 

      float amt = map(cell[x][y][sw], 0, nbSTATE, 0,1);

      set(x,y,color(amt,0.9,0.9));   
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

        VTL[ii] = 0 ;   // initialisation

      }

      for( int rn= y-RANGE ; rn<=y+RANGE; rn++)  {   


        //   dins = RANGE -abs(rn-y);       //    von neumann
        dins=RANGE ;                        //  Moore

        for(int sn= x-dins;  sn<= x+dins; sn++)  {

          ix=  (sn + width) % width ;
          iy=  ( rn + height) % height ;
          i=cell[ix][iy][sw] ;
          VTL[i]= VTL[i]+1    ;            

        }  // sn
      } // rn


      i= cell[x][y][sw];
      j= (1 + i) % nbSTATE  ;

      if(VTL[j] >= THR && i==0)   {    
        cell[x][y][1-sw] = j;
      }

      else if(i>0) {
        cell[x][y][1-sw] = j ;  
      } 
      else {
        cell[x][y][1-sw] = i;
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
//  svaleur= "g64_GH_v2" + str(tt)+"_ST_" + str(nbSTATE) + "_TH_" + str(THR) + "_R_" + str(RANGE) ;
//  save(svaleur + ".png");
//
//  println(svaleur);
//
//}







