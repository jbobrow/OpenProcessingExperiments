

int TATE = 4 ;
int YOKO = 3 ;

int PHASE = 1 ;

int X = 0 ; int Y = 0 ;
int RND = 0 ;

int [][] KYM = new int[361][361] ;
int [] NKYM = new int[361] ;
int T = 0 ;
int N = 0 ;
int [] R = new int [361] ;
int Rmax = TATE * YOKO ;
int [] NBW = new int[361] ;
int KCOL = 0 ;
int IDOU = 0 ;
int Kcancel = 0 ;
int I = 0 ; int II = 0 ; int III = 0 ; int IIII = 0 ;
int [][] Z = new int [361][361] ; 
int ZT = 0 ; int ZF = 0 ; int ZZ = 0 ;
int ZZZ = 0 ;
int WSTN = 0 ;
int EPTN = 0 ;
int KOU = 0 ;
int KouN = 0 ;
int [] SKOU = new int [361] ;


void setup(){
  
   size (700,800) ;
       
} // setup()

void draw(){
  
   
  while ( PHASE == 2 ){
    
    WSTNcount() ;
    
    if ( WSTN < 3 ){
      
      Z[N-1][R[N-1]] = 1 ;
      Z[N][R[N]] = 1 ;
      N = N - 1 ;
      Zcheck() ;
      R[N] = R[N] + 1 ;
                  
    } // WSTN < 3
    
    if ( ( N > ( Rmax * 1.5 ) ) || mousePressed ){
      
      ZZZ = 0 ;
      PHASE = 3 ;
      
    }
    
    
    
    if ( R[N] < Rmax ){
      
      RtoXYI() ;
      
      if ( KYM[N][I] == 0 ){
        
         for ( II = 0 ; II < ( (YOKO+4)*(TATE+4) ) ; II++ ) {
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

        RtoXYI() ;
        
        if ( IIII == 1 ) { 
          III = I - (YOKO+4) ;
        }
        if ( IIII == 2 ) { 
          III = I - 1 ;
        }
        if ( IIII == 3 ) { 
          III = I + 1 ;
        }
        if ( IIII == 4 ) { 
          III = I + (YOKO+4) ;
        }          

        if ( ( NKYM[III] == KCOL ) ) {

          X = III ; 
          Y = 0 ;
          while ( X > ( (YOKO+4)-1) ) {
            X = X -  (YOKO+4) ;
            Y = Y + 1 ;
          }

          Kcancel = 0 ;
          KESUone() ;    
          KESUtwo() ;

          
        }

        IIII = IIII + 1 ;
      }/// IIII < 4 

      RtoXYI() ;
      
      if ( NBW[N] == 1 ) { 
        KCOL = 1 ;
      }
      if ( NBW[N] == 2 ) { 
        KCOL = 2 ;
      }


      III = I ;


      if ( ( NKYM[III] == KCOL ) ) {

        X = III ; 
        Y = 0 ;
        while ( X > ( (YOKO+4)-1) ) {
          X = X -  (YOKO+4) ;
          Y = Y + 1 ;
        }

        Kcancel = 0 ;
        KESUone() ; 
        KESUtwo() ;

    
      }


      RtoXYI() ;
     
      IDOU = 0 ; 

      if ( NKYM[I] == 0 ) {
        IDOU = 0 ;
      }
      else {
        IDOU = 1 ;
      }
   
      if ( ( ( NBW[N] == 1 ) && ( SKOU[N] == 0 ) ) || ( ( NBW[N] == 2 ) && ( SKOU[N] == 1 ) ) )  {
      
        KOU = 1 ;       
        KOUcheck() ;

        if (  KOU == 1  ) {
          IDOU = 0 ;
        }
        
      }
      
      
      
      
      if ( IDOU == 1 ){
        
       NextStep() ;
        
      }else{ Z[N][R[N]] = 6 ; R[N] = R[N] + 1 ; } // IDOU == 1 or not
    
        
     }else{ Z[N][R[N]] = 6 ; R[N] = R[N] + 1 ; } // KYM[N][I] == 0 or not
      
     
           
    } // R[N] < Rmax
    
    if ( R[N] == Rmax ){
    
    for ( II = 0 ; II < ( (YOKO+4)*(TATE+4) ) ; II++ ) {
           NKYM[II] = KYM[N][II] ;
           }
           
    KOU = 1 ;       
    KOUcheck() ;
    
    if ( ( KOU == 0 ) ||   ( NBW[N] == 2 )  ){
      
      NextStep() ;
      
    }else{ Z[N][R[N]] = 6 ; R[N] = R[N] + 1 ; }
    
    } // R[N] == Rmax
    
    if ( R[N] > Rmax ) {
      
      Zcheck() ;
      R[N] = R[N] + 1 ;
      
    }

         
  } // PHASE == 2
  
  if ( PHASE == 3 ){
    
     if ( ZZZ == 1 ) {
       
      ANS() ;
      
      ZZZ = 2 ;
      
    }
    
    if ( ZZZ == 2 && mousePressed ){
      ZZZ = 0 ;
    }
    
    if ( ZZZ == 0 ){
    RESET() ;
    }
    
  } // PHASE == 3
  
  if ( PHASE == 1 ){
    
    for ( I = 0 ; I < 360 ; I ++ ) {
    for ( II = 0 ; II < 360 ; II++ ) {
     Z[I][II] = 9 ;
    }
    }
    
    background(125,125,0) ;
    RNDGOBAN() ;
    
    for ( II = 0 ; II < ( (YOKO+4)*(TATE+4) ) ; II++ ) {
           KYM[0][II] = NKYM[II] ;
           }
    
    PHASE = 2 ;
    NBW[0] = 1 ;
            
    WSTNcount() ;
    
    if ( WSTN < 4 ) { PHASE = 1 ;  }
    
    EPTNcount() ;
    
    if ( EPTN > 10 ) { PHASE = 1 ; }
    
  } // PHASE == 1  
   
} // draw()


void RtoXYI(){
  
    X = R[N] + 1 ; 
    Y = 3 ;
    while ( X > YOKO ) {
      Y = Y + 1 ;
      X = X - YOKO ;
      }
    I = ( (YOKO + 4 ) * Y ) + X ;

} // RtoXYI()


void RNDGOBAN(){
  
    X = 0 ; 
    Y = 0 ; 
    N = 0 ;
   

    for ( X = 0 ; X < (YOKO+4) ; X++) {
      I = ( (YOKO+4) * Y ) + X ;
      NKYM [I] = 3 ;
    }

    X = 0 ; 
    Y = 0 ;

    for ( Y = 0 ; Y < (TATE+4) ; Y++) {
      I = ( (YOKO+4) * Y ) + X ;
      NKYM [I] = 3 ;
    }

    X = (YOKO+4)-1 ; 
    Y = 0 ;

    for ( Y = 0 ; Y < (TATE+4) ; Y++) {
      I = ( (YOKO+4) * Y ) + X ;
      NKYM [I] = 3 ;
    }

    X = 0 ; 
    Y = (TATE+4) - 1 ;

    for ( X = 0 ; X < (YOKO+4) ; X++) {
      I = ( (YOKO+4) * Y ) + X ;
      NKYM [I] = 3 ;
    }

    X = 1 ; 
    Y = 1 ;

    for ( X = 1 ; X < (YOKO+4)-1 ; X++) {
      I = ( (YOKO+4) * Y ) + X ;
      NKYM [I] = 0 ;
    }

    X = 1 ; 
    Y = 2 ;

    for ( X = 1 ; X < (YOKO+4)-1 ; X++) {
      I = ( (YOKO+4) * Y ) + X ;
      NKYM [I] = 1 ;
    }

    X = (YOKO+4) - 3 ; 
    Y = 0 ;

    for ( Y = 2 ; Y < (TATE+4)-1 ; Y++) {
      I = ( (YOKO+4) * Y ) + X ;
      NKYM [I] = 1 ;
    }

    X = (YOKO+4)-2 ; 
    Y = 0 ;

    for ( Y = 1 ; Y < (TATE+4)-1 ; Y++ ) {
      I = ( (YOKO+4) * Y ) + X ;
      NKYM [I] = 0 ;
    }

    X = 1 ; 
    Y = 3 ;

    while ( Y < (TATE+3) ) {
      
    
      I = ( (YOKO + 4 ) * Y ) + X ;
      NKYM[I] = 0 ;
      RND = int(random(100)) ;
      
      if ( ( RND > 0 ) && ( RND < 20 ) ) {
        NKYM[I] = 1 ;
      }
      if ( ( RND > 20 ) && ( RND < 60 ) ) {
        NKYM[I] = 2 ;
      }

      X = X + 1 ;
      if ( X > (YOKO) ) {
        X = 1 ;
        Y = Y + 1 ;
      }
    }


    X = 1 ; 
    Y = 3 ;  

    while ( Y < (TATE+4-1) ) { 

      Kcancel = 0 ; 
      KCOL = 0 ;
      I = ( (YOKO+4) * Y ) + X ;
      if ( ( NKYM[I] == 1 ) || ( NKYM[I] == 2 ) ) {
        KCOL = NKYM[I] ;
        KESUone() ;
        KESUtwo() ;
      
      }

      X = X + 1 ;
      if (X > ( YOKO+4-2) ) {
        X = 1 ;
        Y = Y + 1 ;
      }
    } 


    X = 0 ; 
    Y = 0 ;

    for ( X = 0 ; X < (YOKO+4) ; X++ ) {
      stroke(0, 0, 0);
      line ( 80 + (40*X), 20, 80 + (40*X), ( 40 * (TATE+4) ) - 40  ) ;
    }
    for ( Y = 0 ; Y < (TATE+4-1) ; Y++ ) {
      line ( 80, 40 + (40*Y), 60 + ( 40 * (YOKO+4) ), 40 + (40*Y) ) ;
    }

    for ( I = 0 ; I < ( (TATE+4)*(YOKO+4) ) ; I ++ ) {

      X = I ; 
      Y = 0 ;
      while ( X > ( (YOKO+4)-1) ) {
        X = X -  (YOKO+4) ;
        Y = Y + 1 ;
      }

      if ( NKYM[I] == 1 ) {
        fill(0, 0, 0) ;
        stroke(0, 0, 0) ;
        ellipse( 40 + (40*X), 40 + (40*Y), 37, 37 ) ;
      }


      if ( NKYM[I] == 2 ) {
        fill(255, 255, 255) ;
        stroke(255, 255, 255) ;
        ellipse( 40 + (40*X), 40 + (40*Y), 37, 37 ) ;
      }
    }  

  
} // RNDGOBAN()


void KESUone() {

  I = ( (YOKO + 4 ) * Y ) + X ;
  NKYM[I] = KCOL + 3 ;

  X = X + 1 ;
  if ( ( X >= 0 ) && ( X < (YOKO+4) ) && ( Y >= 0 ) && ( Y < (TATE+4 ) ) ) {
    I = ( (YOKO + 4 ) * Y ) + X ;
    if ( NKYM[I] == KCOL ) {
      KESUone() ;
    }
    if ( NKYM[I] == 0 ) {
      Kcancel = 1 ;
    }
  }

  X = X - 1 ;
  Y = Y + 1 ;
  if ( ( X >= 0 ) && ( X < (YOKO+4) ) && ( Y >= 0 ) && ( Y < (TATE+4 ) ) ) {
    I = ( (YOKO + 4 ) * Y ) + X ;
    if ( NKYM[I] == KCOL ) {
      KESUone() ;
    }
    if ( NKYM[I] == 0 ) {
      Kcancel = 1 ;
    }
  }

  X = X - 1 ;
  Y = Y - 1 ;
  if ( ( X > 0 ) && ( X < (YOKO+4) ) && ( Y > 0 ) && ( Y < (TATE+4 ) ) ) {
    I = ( (YOKO + 4 ) * Y ) + X ;
    if ( NKYM[I] == KCOL ) {
      KESUone() ;
    }
    if ( NKYM[I] == 0 ) {
      Kcancel = 1 ;
    }
  }

  X = X + 1 ;
  Y = Y - 1 ;
  if ( ( X > 0 ) && ( X < (YOKO+4) ) && ( Y > 0 ) && ( Y < (TATE+4 ) ) ) {
    I = ( (YOKO + 4 ) * Y ) + X ;
    if ( NKYM[I] == KCOL ) {
      KESUone() ;
    }
    if ( NKYM[I] == 0 ) {
      Kcancel = 1 ;
    }
  }

  Y = Y + 1 ;
} // KESUone()


void KESUtwo(){
  
    for ( II = 0 ; II < ((TATE+4)*(YOKO+4)) ; II ++ ) {
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
        for ( II = 0 ; II < ((TATE+4)*(YOKO+4) -1 ) ; II ++ ) {

          if ( KYM[N-1][II] != NKYM[II] ) {
            KOU = 0 ;
          }
        }
      }
      else {
        KOU = 0 ;
      }
     
} // KOUcheck()


void WSTNcount(){
  
  WSTN = 0 ;
    for ( I = 0 ; I < ( (TATE+4)*(YOKO+4) ) ; I++) {
      if ( KYM[N][I] == 2 ) {
        WSTN = WSTN + 1 ;
      }
    }
    
} // WSTNcount()


void EPTNcount(){
  
  EPTN = 0 ;
    for ( IIII = 0 ; IIII < Rmax ; IIII++) {
      
       X = IIII + 1 ; 
       Y = 3 ;
       while ( X > YOKO ) {
       Y = Y + 1 ;
       X = X - YOKO ;
       }
       I = ( (YOKO + 4 ) * Y ) + X ;
      
       if ( KYM[N][I] == 0 ) {
        EPTN = EPTN + 1 ;
       }
    }
    IIII = 0 ;
    
} // EPTNcount()


void Zcheck(){
  
  
  
  ZZ = 0 ; ZT = 0 ; ZF = 0 ;
  
  for ( III = 0 ; III <= Rmax ; III ++ ){
    
    if ( Z[N][III] == 1 ) {
            ZT = ZT + 1 ;
            ZZ = ZZ + 1 ;
          }
    if ( Z[N][III] == 0 ) { 
            ZF = ZF + 1 ;
            ZZ = ZZ + 1 ;
          }
    if ( Z[N][III] == 9 ){
            ZZ = 9999 ;
            
          }
                    
    } // 0 < R <= Rmax
  
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
  
  if ( ( ZT == 0 ) && ( ZF == 0 ) && ( ZZ == 0 ) ){
    
    Z[N-1][R[N-1]] = 0 ;
    N = N - 1 ;
    Zcheck() ;
    
  }
 
  if ( ( ZT >= 1 ) && ( ZF >= 1 ) && ( N == 0 ) && ( ZZ < 9999 ) ){
   
   ZZZ = 1 ;
   PHASE = 3 ;
  
  } 
  
  if ( ( ZZ < 9999  ) && ( N == 0 ) && ( ( ZT == 0 ) || ( ZF == 0 ) ) ){
    
    ZZZ = 0 ;
    PHASE = 3 ;
    
  }  
  
} // Zcheck()



void NextStep(){
  
        N = N + 1 ;
        
        R[N] = 0 ;
  
        for ( II = 0 ; II < 360 ; II++ ) {
            Z[N][II] = 9 ;
        }
                
        for ( II = 0 ; II < ( (YOKO+4)*(TATE+4) ) ; II++ ) {
           KYM[N][II] = NKYM[II] ;
        }
        
               
        if ( NBW[N-1] == 1 ){ NBW[N] = 2 ; }
        if ( NBW[N-1] == 2 ){ NBW[N] = 1 ; } 
       
        SKOU[N] = 0 ;
        KouN = 0 ;
        for ( II = 0 ; II < N ; II++ ){
          
          KOU = 1 ;
          for ( III = 0 ; III < ( (YOKO+4)*(TATE+4) ) ; III++ ){
            if ( KYM[N][III] != KYM[II][III] ){
              KOU = 0 ;
            }
          }
          if ( KOU == 1 ){
            KouN = KouN + 1 ;
          }
          
        }
        
        if ( KouN > 3 ){
          SKOU[N] = 1 ;
        }
                 
} // NextStep() ;


void RESET(){
  
   
    for ( II = 0 ; II < 360 ; II++ ) {
     Z[0][II] = 9 ;
     }
     
     R[0] = 0 ;
    
     
    PHASE = 1 ;
    N = 0 ;
    ZZZ = 0 ;
           
} // RESET()
  
  
void ANS(){
    

    stroke(0,0,0) ; 
    
     for ( X = 0 ; X < (YOKO+4) ; X++ ) {
      line ( 80 + (40*X), 420, 80 + (40*X), ( 40 * (TATE+4) ) + 360  ) ;
     }
     for ( Y = 0 ; Y < (TATE+4-1) ; Y++ ) {
      line ( 80, 440 + (40*Y), 60 + ( 40 * (YOKO+4) ), 440 + (40*Y) ) ;
     }



    for ( II = 0 ; II < ( (TATE+4)*(YOKO+4) ) ; II ++ ) {

      X = II ; 
      Y = 0 ;
      while ( X > ( (YOKO+4)-1) ) {
        X = X -  (YOKO+4) ;
        Y = Y + 1 ;
      }

      if ( KYM[0][II] == 1 ) {
        fill(0, 0, 0) ;
        stroke(0, 0, 0) ;
        ellipse( 40 + (40*X), 440 + (40*Y), 37, 37 ) ;
      }


      if ( KYM[0][II] == 2 ) {
        fill(255, 255, 255) ;
        stroke(255, 255, 255) ;
        ellipse( 40 + (40*X), 440 + (40*Y), 37, 37 ) ;
      }
      
       
          
       X = X - 1 ;
       Y = Y - 3 ;
       III = (Y*YOKO) + X ;
       
      if ( ( X >= 0 ) && ( X < (YOKO) ) && ( Y >= 0 ) && ( Y < (TATE) ) ){
        
         X = II ; 
          Y = 0 ;
          while ( X > ( (YOKO+4)-1) ) {
            X = X -  (YOKO+4) ;
            Y = Y + 1 ;
          }

      if ( Z[0][III] == 1 ) {
        fill(50, 50, 255) ;
        stroke(0, 0, 0) ;
        ellipse( 40 + (40*X), 440 + (40*Y), 37, 37 ) ;
      }


      if ( Z[0][III] == 0 ) {
        fill(255, 50, 50) ;
        stroke(0, 0, 0) ;
        ellipse( 40 + (40*X), 440 + (40*Y), 37, 37 ) ;
      }
      
      }
      
    }
  } // ANS()


