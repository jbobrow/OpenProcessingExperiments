
// AUTO_TSUMEGO_dodecagon

int PHASE = 1 ;

int X = 0 ; int Y = 0 ;
int RND = 0 ;

int [][] KYM = new int[361][361] ;
int [] NKYM = new int[361] ;
int T = 0 ;
int N = 0 ;
int [] R = new int [361] ;
int Rmax = 12 ;
int [] NBW = new int[361] ;
int KCOL = 0 ;
int IDOU = 0 ;
int Kcancel = 0 ;
int I = 0 ; int II = 0 ; int III = 0 ; int IIII = 0 ;
int [][] Z = new int [361][361] ; 
int ZT = 0 ; int ZF = 0 ; int ZZ = 0 ;
int ZZZ = 0 ;
int WSTN = 0 ;
int BSTN = 0 ;
int EPTN = 0 ;
int EPTmax = 8 ;
int KOU = 0 ;
int Q = 0 ;
int QQ = 0 ;
int [] PASSED = new int [361] ;

float CLX = 0 ;
float CLY = 0 ;
float CLN = 0 ;

int [] PX = new int [13] ;
int [] PY = new int [13] ;
int [][] LK = new int [13][5] ;
int P = 1 ; 
int PPX = 0 ; int PPY = 0 ;

int GP = 0 ;
int DR = 0 ;
int GI = 0 ;
int [] GX = new int [361] ;
int [] GY = new int [361] ;
int PCOL = 1 ;




void setup(){
  
  size (900,500) ;
  background(125,125,0) ;
  strokeWeight( 2 ) ;
   for ( II = 0 ; II < 361 ; II++ ) {
     Z[0][II] = 9 ;
     PASSED[II] = 0 ;
     }
     R[0] = 1 ;
     
 for ( I = 1 ; I <= 12 ; I++ ){
  PX[I] = int( 150 * (sin(2*PI*I/12)) ) ;
  PY[I] = int( 150 * (cos(2*PI*I/12)) ) ; 
 }
  
} // setup()

void draw(){
  
  
  if ( PHASE == 7 ){
    
    if ( mousePressed == true ){
      RESET() ;
    }
    
  } // PHASE == 7
  
  
  if ( PHASE == 6 ){
    
    ANS() ;
    DR = 1 ;
    PPX = 80 + 150 ; PPY = 80 + 150 ;
    PHASE = 7 ;
    
  } //PHASE == 6 
  
  
  
  if ( PHASE == 5 ){
    
    if ( mousePressed == true ){
      PHASE = 6 ;
    }
    
  } // PHASE == 5
  
  
  if ( PHASE == 4 ){
    
    if ( ZZZ == 0 ){
      
      RESET() ; 
      
    } // ZZZ == 0
    
    if ( ZZZ == 1 ){

      background(125,125,0) ;    
      PPX = 80 + 150  ; PPY = 80 + 150 ;
      GOBANdraw() ;
      PHASE = 5 ;
      
    } // ZZZ == 1
  
  } // PHASE == 4
  
 
  if ( PHASE == 3 ){
    
    for ( Q = 0 ; Q < 10000 ; Q++ ){
    
     
    WSTNcount() ;
    
    if ( ( WSTN < 2 ) && ( N > 0 ) ){
      
      Z[N-1][R[N-1]] = 1 ;
      Z[N][R[N]] = 1 ;
      N = N - 1 ;
      Zcheck() ;
      R[N] = R[N] + 1 ;
                 
    } // WSTN < 1
    
    BSTNcount() ;
    
    if ( ( BSTN < 2 ) && ( N > 0 ) ){
      
      Z[N-1][R[N-1]] = 0 ;
      Z[N][R[N]] = 0 ;
      N = N - 1 ;
      Zcheck() ;
      R[N] = R[N] + 1 ;
                 
    } // BSTN < 1
    
     if (  N > ( Rmax * 1.5 )  ){
      
      ZZZ = 0  ;
      PHASE = 4 ;
      
    }
    
        
    
    if ( R[N] <= Rmax ){
      
      I = R[N] ;
      
      if ( KYM[N][I] == 0 ){
        
         for ( II = 1 ; II <= 12 ; II++ ) {
           NKYM[II] = KYM[N][II] ;
           }

      NKYM[I] = NBW[N] ;

      if ( NBW[N] == 1 ) { 
        KCOL = 2 ;
      }
      if ( NBW[N] == 2 ) { 
        KCOL = 1 ;
      }

      IIII = 1 ;

      while ( IIII <= 4 ) {

        I = R[N]  ;
        
        III = LK[I][IIII]  ;
        
        if ( ( NKYM[III] == KCOL ) ) {

          I = III ;
          Kcancel = 0 ;
          KESUone() ;    
          KESUtwo() ;
          
        }

        IIII = IIII + 1 ;
      }/// IIII <= 4 

      I = R[N]  ;
      
      if ( NBW[N] == 1 ) { 
        KCOL = 1 ;
      }
      if ( NBW[N] == 2 ) { 
        KCOL = 2 ;
      }


      III = I ;


      if ( ( NKYM[III] == KCOL ) ) {

        I = III ;
        Kcancel = 0 ;
        KESUone() ; 
        KESUtwo() ;
    
      }


      I = R[N]  ;
     
      IDOU = 0 ; 

      if ( NKYM[I] == 0 ) {
        IDOU = 0 ;
      }
      else {
        IDOU = 1 ;
      }
   
      
      
        KOU = 1 ;       
        KOUcheck() ;

        if (  KOU == 1  ) {
          IDOU = 0 ;
        }
        
      
      
      
      
      
      if ( IDOU == 1 ){
        
       NextStep() ;
        
      }else{ Z[N][R[N]] = 6 ; R[N] = R[N] + 1 ; } // IDOU == 1 or not
    
        
     }else{ Z[N][R[N]] = 6 ; R[N] = R[N] + 1 ; } // KYM[N][I] == 0 or not
      
     
           
    } // R[N] <= Rmax
    
    if ( R[N] == (Rmax+1) ){
    
    for ( II = 1 ; II <= 12 ; II++ ) {
           NKYM[II] = KYM[N][II] ;
           }
    
    if ( N > 0 ) {      
      
    if (  PASSED[N-1] == 0  ){
      
      PASSED[N] = 1 ;
      NextStep() ;
     
    }else{ Z[N][R[N]] = 0 ; R[N] = R[N] + 1 ; }
    }else{ Z[N][R[N]] = 6 ; R[N] = R[N] + 1 ; }
    
    } // R[N] == (Rmax+1)
    
    if ( R[N] > (Rmax+1) ) {
      
      Zcheck() ;
      R[N] = R[N] + 1 ;
      
      
    }
    
    if ( PHASE == 4 ){ Q = 1000000 ; }
    
    } // Q
    
    CLOCKdraw() ;
    
    if ( ( mousePressed == true ) || ( CLN > 144 ) ){ RESET() ; }
    
  } // PHASE == 3
  
 
  if ( PHASE == 2 ){
   
    RNDGOBAN() ; 
    N = 0 ;
   
      for ( II = 1 ; II <= 12 ; II++ ) {
           KYM[N][II] = NKYM[II] ;
        }
   
   
    PHASE = 3 ;
   
    NBW[0] = 1 ;
    Rmax = 12 ;
            
    WSTNcount() ;
    
    if ( WSTN < 1 ) { PHASE = 2 ; }
    
    EPTNcount() ;
    
    if ( EPTN < 1 ) { PHASE = 2 ; }
    
    BSTNcount() ;
    
    if ( BSTN < 1 ) { PHASE = 2 ; }

   
       
  } // PHASE == 2
   
  if ( PHASE == 15 ){
    
     
    RNDlink() ;
    if ( QQ <= 100 )
      { PHASE = 2 ; }
    
  } // PHASE == 15
  
  
  if ( PHASE == 1 ){
    
    PHASE = 15  ;
          
  } // PHASE == 1
  
  mousePressed = false ;
    
  
} // draw()




void KESUone() {

  
  NKYM[I] = KCOL + 3 ;

  I = LK[I][1] ;
  
    
    if ( NKYM[I] == KCOL ) {
      KESUone() ;
    }
    if ( NKYM[I] == 0 ) {
      Kcancel = 1 ;
    }
  

  I = LK[I][1] ;
  I = LK[I][2] ;
  
    
    if ( NKYM[I] == KCOL ) {
      KESUone() ;
    }
    if ( NKYM[I] == 0 ) {
      Kcancel = 1 ;
    }
  

  I = LK[I][2] ;
  I = LK[I][3] ;
  
  
    if ( NKYM[I] == KCOL ) {
      KESUone() ;
    }
    if ( NKYM[I] == 0 ) {
      Kcancel = 1 ;
    }
  

  I = LK[I][3] ;
  I = LK[I][4] ;
  
  
    if ( NKYM[I] == KCOL ) {
      KESUone() ;
    }
    if ( NKYM[I] == 0 ) {
      Kcancel = 1 ;
    }
  

  I = LK[I][4] ;
  
} // KESUone()


void KESUtwo(){
  
    for ( II = 1 ; II <= 12 ; II ++ ) {
          if ( NKYM[II] == KCOL+3 ) {
            if ( Kcancel == 0 ) {
              NKYM[II] = 0 ;
            }
            if ( Kcancel == 1 ) {
              NKYM[II] = KCOL ;
            }
          }
        }
        
    
        
} // KESUtwo()


void KOUcheck(){
  
   if (  N > 0  ) {
    
       for ( III = N ; III > 0 ; III-- ){
        
        KOU = 1 ; 
        for ( II = 1 ; II <= 12 ; II ++ ) {

          if ( KYM[III-1][II] != NKYM[II] ) {
            KOU = 0 ;
          }
        }
        
        if ( KOU == 1 ){ III = 0 ; }
        
       }
        
      }else {
        KOU = 0 ;
      }
     
} // KOUcheck()



void WSTNcount(){
  
  WSTN = 0 ;
    for ( I = 1 ; I <= 12 ; I++) {
      if ( KYM[N][I] == 2 ) {
        WSTN = WSTN + 1 ;
      }
    }
    
} // WSTNcount()


void BSTNcount(){
  
  BSTN = 0 ;
    for ( I = 1 ; I <= 12 ; I++) {
      if ( KYM[N][I] == 1 ) {
        BSTN = BSTN + 1 ;
      }
    }
    
} // BSTNcount()



void EPTNcount(){
  
  EPTN = 0 ;
    for ( I = 1 ; I <= 12 ; I++) {
      if ( KYM[N][I] == 0 ) {
        EPTN = EPTN + 1 ;
      }
    }
    
} // EPTNcount()



void Zcheck(){
  
  
  
  ZZ = 0 ; ZT = 0 ; ZF = 0 ;
  
  for ( III = 1 ; III <= (Rmax+1) ; III ++ ){
    
    if ( Z[N][III] == 1 ) {
            ZT = ZT + 1 ;
            ZZ = ZZ + 1 ;
          }
    if ( Z[N][III] == 0 ) { 
            ZF = ZF + 1 ;
            ZZ = ZZ + 1 ;
          }
    if ( Z[N][III] == 9 ) {
            ZZ = 9999 ;
          }
                    
    } // 0 < R <= (Rmax+1)
  
  if ( ( ZT >= 1 ) && ( NBW[N] == 1 ) && ( N > 0 ) ){
    
   Z[N-1][R[N-1]] = 1 ;
   N = N - 1 ;
   Zcheck() ;
  
  }
  
  if ( ( ZT == ZZ ) && ( NBW[N] == 2 ) && ( N > 0 ) && ( ZZ > 0 ) ){
    
   Z[N-1][R[N-1]] = 1 ;
   N = N - 1 ;
   Zcheck() ;
  
  }
 
  if ( ( ZF >= 1 ) && ( NBW[N] == 2 ) && ( N > 0 ) ){
 
   Z[N-1][R[N-1]] = 0 ;
   N = N - 1 ;
   Zcheck() ;
  
  }
  
  if ( ( ZF == ZZ ) && ( NBW[N] == 1 ) && ( N > 0 ) && ( ZZ > 0 ) ){
    
   Z[N-1][R[N-1]] = 0 ;
   N = N - 1 ;
   Zcheck() ;
  
  }

 
  if ( ( ZT == 1 ) && ( ZF >= 1 ) && ( N == 0 ) && ( ZZ < 9999 ) ){
   
    
   ZZZ = 1 ;
   PHASE = 4 ;
  
  } 
  
  if ( ( ZZ < 9999  ) && ( N == 0 ) && ( ( ZT == 0 ) || ( ZT > 1 ) ) ){
    
    ZZZ = 0 ;
    PHASE = 4 ;
    
  }  
  
} // Zcheck()



void NextStep(){
  
        N = N + 1 ;
        PASSED[N] = 0 ;
        R[N] = 1 ;
  
        for ( II = 0 ; II < 360 ; II++ ) {
            Z[N][II] = 9 ;
        }
                
        for ( II = 1 ; II <= 12 ; II++ ) {
           KYM[N][II] = NKYM[II] ;
        }
        
               
        if ( NBW[N-1] == 1 ){ NBW[N] = 2 ; }
        if ( NBW[N-1] == 2 ){ NBW[N] = 1 ; } 
       
 
                 
} // NextStep() ;


void RESET(){
  
   
    for ( II = 0 ; II < 360 ; II++ ) {
     Z[0][II] = 9 ;
     PASSED[II] = 0 ;
     }
     
     R[0] = 1 ;
     
      for ( I = 0 ; I <= 12 ; I ++ ){
      for ( II = 0 ; II <= 4 ; II++ ){
        LK[I][II] = 0 ;
       }
      }
    
     
    PHASE = 15 ;
    N = 0 ;
    ZZZ = 0 ;
    //CLN = 0 ;
           
} // RESET()
  
  
void ANS(){
    

    PPX = 480 + 150 ; 
    PPY = 80 + 150 ;

    GOBANdraw() ;

    for ( III = 1 ; III <= 12 ; III++ ){
  
     if ( Z[0][III] == 1 ){
       fill (50,50,255) ;
       ellipse( (PX[III])+PPX , (PY[III])+PPY , 40 , 40 ) ;
     }
     
     if ( Z[0][III] == 0 ){
       fill (255,50,50) ;
       ellipse( (PX[III])+PPX , (PY[III])+PPY , 40 , 40 ) ;
     }
      
    }    

    
} // ANS()
  
  
  
void RNDGOBAN(){
  
   
    for ( I = 1 ; I <= 12 ; I++ ) {
      
    
      NKYM[I] = 0 ;
      RND = int(random(100)) ;
      
      if ( ( RND > 0 ) && ( RND < 30 ) ) {
        NKYM[I] = 1 ;
      }
      if ( ( RND >30 ) && ( RND < 60 ) ) {
        NKYM[I] = 2 ;
      }

      
    }


    for ( III = 1 ; III <= 12 ; III++ ) { 

      Kcancel = 0 ; 
      KCOL = 0 ;
      I = III ;
      
      if ( ( NKYM[I] == 1 ) || ( NKYM[I] == 2 ) ) {
        KCOL = NKYM[I] ;
        KESUone() ;
        KESUtwo() ;
      
      }

      
    } 

  CLOCKdraw() ;
  

} // RNDGOBAN()



void GOBANdraw(){
  
  stroke(0,0,0) ;
  
  for ( I = 1 ; I <= 12 ; I++ ){
    
    strokeWeight(2) ;
    stroke(50,50,50) ; 
    line ( (PX[I])+PPX , (PY[I])+PPY , (PX[LK[I][1]])+PPX , (PY[LK[I][1]])+PPY ) ;
    
  }   
  
  for ( I = 1 ; I <= 12 ; I++ ){
    
    strokeWeight(2) ;
    stroke(50,50,50) ; 
    line ( (PX[I])+PPX , (PY[I])+PPY , (PX[LK[I][2]])+PPX , (PY[LK[I][2]])+PPY ) ;
    
  }   
  
  for ( I = 1 ; I <= 12 ; I++ ){
    
    strokeWeight(6) ;
    stroke(125,125,0) ; 
    line ( (PX[I])+PPX , (PY[I])+PPY , (PX[LK[I][3]])+PPX , (PY[LK[I][3]])+PPY ) ;
    strokeWeight(2) ;
    stroke(50,50,50) ; 
    line ( (PX[I])+PPX , (PY[I])+PPY , (PX[LK[I][3]])+PPX , (PY[LK[I][3]])+PPY ) ;
    
  }
   
  for ( I = 1 ; I <= 12 ; I++ ){
    
    strokeWeight(6) ;
    stroke(125,125,0) ;
    line ( (PX[I])+PPX , (PY[I])+PPY , (PX[LK[I][4]])+PPX , (PY[LK[I][4]])+PPY ) ;
    strokeWeight(2) ;
    stroke(50,50,50) ; 
    line ( (PX[I])+PPX , (PY[I])+PPY , (PX[LK[I][4]])+PPX , (PY[LK[I][4]])+PPY ) ;
    
  }  
     
 
     
  for ( I = 1 ; I <= 12 ; I++ ){
    
    fill(50,50,50);
    stroke(50,50,50);
    ellipse( (PX[I])+PPX , (PY[I])+PPY , 20 , 20 ) ;
  
  }
  
  for ( I = 1 ; I <= 12 ; I++ ){
  
     if ( KYM[0][I] == 1 ){
       fill (0,0,0) ;
       stroke (0,0,0) ;
       ellipse( (PX[I])+PPX , (PY[I])+PPY , 40 , 40 ) ;
     }
     
     if ( KYM[0][I] == 2 ){
       fill (255,255,255) ;
       stroke(0,0,0) ;
       ellipse( (PX[I])+PPX , (PY[I])+PPY , 40 , 40 ) ;
     }
      
    }    
     
} // GOBANdraw() 


 
 
void CLOCKdraw(){
  
   background (125,125,0) ;
   strokeWeight( 5 ) ;
   stroke (0,0,0) ;
   noFill() ;

  CLX = 90 * sin( (-1) * CLN * 2 * PI / 12 ) ;
  CLY = 90 * cos( (-1) * CLN * 2 * PI / 12 ) ;
  
  line ( 450 + (CLX/3) , 200 + (CLY/3) , 450 -  CLX  , 200 -  CLY  ) ;
  
  CLX = 60 * sin( (-1) * CLN * 2 * PI / 144 ) ;
  CLY = 60 * cos( (-1) * CLN * 2 * PI / 144 ) ;
  
  line ( 450 + (CLX/5) , 200 + (CLY/5) , 450 - CLX , 200 - CLY ) ;
  
  CLN = CLN + 0.1 ;
  
  if ( CLN > 144 ){
    CLN = 0 ; 
  }
  
  ellipse ( 450 , 200 , 200 , 200 ) ;
  strokeWeight( 2 ) ; 
  
} // CLOCKdraw()



void RNDlink(){
  
   
      for ( I = 0 ; I <= 12 ; I ++ ){
      for ( II = 0 ; II <= 4 ; II++ ){
        LK[I][II] = 0 ;
       }
      }
  
  
  
   for ( I = 1 ; I < 12 ; I = I + 2 ){
     LK[I][1] = I + 1 ;
     LK[I+1][1] = I ;
   }
   for ( I = 2 ; I < 12 ; I = I + 2 ){
     LK[I][2] = I + 1 ;
     LK[I+1][2] = I ;
   }
   LK[12][2] = 1 ; LK[1][2] = 12 ;

   QQ = 0 ;

   for ( I = 1 ; I <= 12 ; I++ ){

     Q = 0 ;      
     while ( Q == 0 ){
      
       
      if ( LK[I][3] == 0 ){
       
       RND = 13 ;
       while( ( RND < 1 ) || ( RND > 12 ) ){ 
       
        RND = int(random(13))   ;
       
       }
       
       
       if ( ( I != RND ) &&  ( LK[RND][3] == 0 ) ){
      
         LK[I][3] = RND ;
         LK[RND][3] = I ;
         
         if ( ( LK[I][3] == LK[I][1] ) || ( LK[I][3] == LK[I][2] ) ){
           Q = 0 ;
           LK[I][3] = 0 ;
           LK[RND][3] = 0 ;
         }else{ Q = 1 ; }
        
        } 

       }else{
       Q = 1 ;
       }
  
      QQ = QQ + 1 ;
      if ( QQ > 100 ){ Q = 1 ; }
  
      }   
  
   if ( QQ <= 100 ) { QQ = 0 ; }
  
   }
   
    for ( I = 1 ; I <= 12 ; I++ ){

     Q = 0 ;      
     while ( Q == 0 ){
      
      if ( LK[I][4] == 0 ){
        
        RND = 0 ;
        while( ( RND < 1 ) || ( RND > 12 ) ){ 
       
         RND = int(random(13))   ;
       
        }
       
       if ( ( I != RND ) &&  ( LK[RND][4] == 0 )  ){
      
         LK[I][4] = RND ;
         LK[RND][4] = I ;
         
         if ( ( LK[I][4] == LK[I][1] ) || ( LK[I][4] == LK[I][2] ) || ( LK[I][4] == LK[I][3] ) ){
           Q = 0 ;
           LK[I][4] = 0 ;
           LK[RND][4] = 0 ;
         }else{ Q = 1 ; }
        
        } 
       }else{
        Q = 1 ;
      }
      
     QQ = QQ + 1 ;
     if ( QQ > 100 ){ Q = 1 ; }
      
     }   
  
     }

   CLOCKdraw() ;
  
 
   
} // RNDlink() 
   



