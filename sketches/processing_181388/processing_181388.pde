
// AUTO_TSUMEGO_T 

int TATE = 3 ;
int YOKO = 5 ;

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
int BSTN = 0 ;
int EPTN = 0 ;
int EPTmax = 8 ;
int KOU = 0 ;
int GP = 0 ;
int DR = 0 ;
int GI = 0 ;
int Q = 0 ;
int [] PASSED = new int [361] ;

float CLX = 0 ;
float CLY = 0 ;
float CLN = 0 ;


void setup(){
  
  size (700,1000) ;
  strokeWeight( 2 ) ;
   for ( II = 0 ; II < 361 ; II++ ) {
     Z[0][II] = 9 ;
     PASSED[II] = 0 ;
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
    
        
    
    if ( R[N] < Rmax ){
      
      RtoXYI() ;
      
      if ( KYM[N][I] == 0 ){
        
         for ( II = 0 ; II < ( (YOKO+2)*(TATE+2) ) ; II++ ) {
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
          III = I - (YOKO+2) ;
        }
        if ( IIII == 2 ) { 
          III = I - 1 ;
        }
        if ( IIII == 3 ) { 
          III = I + 1 ;
        }
        if ( IIII == 4 ) { 
          III = I + (YOKO+2) ;
        } 

          X = III ; 
          Y = 0 ;
          while ( X > ( (YOKO+2)-1) ) {
            X = X -  (YOKO+2) ;
            Y = Y + 1 ;
          }
          XYloop() ;
          III = I ;

        if ( ( NKYM[III] == KCOL ) ) {

          //X = III ; 
          //Y = 0 ;
          //while ( X > ( (YOKO+2)-1) ) {
          //  X = X -  (YOKO+2) ;
          //  Y = Y + 1 ;
          //}

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
        while ( X > ( (YOKO+2)-1) ) {
          X = X -  (YOKO+2) ;
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
   
      
      
        KOU = 1 ;       
        KOUcheck() ;

        if (  KOU == 1  ) {
          IDOU = 0 ;
        }
        
      
      
      
      
      
      if ( IDOU == 1 ){
        
       NextStep() ;
        
      }else{ Z[N][R[N]] = 6 ; R[N] = R[N] + 1 ; } // IDOU == 1 or not
    
        
     }else{ Z[N][R[N]] = 6 ; R[N] = R[N] + 1 ; } // KYM[N][I] == 0 or not
      
     
           
    } // R[N] < Rmax
    
    if ( R[N] == Rmax ){
    
    for ( II = 0 ; II < ( (YOKO+2)*(TATE+2) ) ; II++ ) {
           NKYM[II] = KYM[N][II] ;
           }
    
    if ( N > 0 ) {      
      
    if (  PASSED[N-1] == 0  ){
      
      PASSED[N] = 1 ;
      NextStep() ;
     
    }else{ Z[N][R[N]] = 0 ; R[N] = R[N] + 1 ; }
    }else{ Z[N][R[N]] = 6 ; R[N] = R[N] + 1 ; }
    
    } // R[N] == Rmax
    
    if ( R[N] > Rmax ) {
      
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
   
      for ( II = 0 ; II < ( (YOKO+2)*(TATE+2) ) ; II++ ) {
           KYM[N][II] = NKYM[II] ;
        }
   
   
    PHASE = 3 ;
   
    NBW[0] = 1 ;
    Rmax = TATE * YOKO ;
            
    WSTNcount() ;
    
    if ( WSTN < 2 ) { PHASE = 2 ; }
    
    EPTNcount() ;
    
    if ( EPTN > EPTmax ) { PHASE = 2 ; }
    
    BSTNcount() ;
    
    if ( BSTN < 2 ) { PHASE = 2 ; }
    
           
  } // PHASE == 2
   
  
  
  
  if ( PHASE == 1 ){
    
    GOBANset() ;
          
  } // PHASE == 1
  
  mousePressed = false ;
    
  
} // draw()


void GOBANset(){
  
  
    if ( GP == 0 ){ 
      
    for ( I = 0 ; I < ( 19 * 19 ) ; I++ ){
      
      NKYM[I] = 0 ;
      
    }
     
      
    X = 0 ; 
    Y = 0 ; 
    N = 0 ;
   

    for ( X = 0 ; X < (YOKO+2) ; X++) {
      I = ( (YOKO+2) * Y ) + X ;
      NKYM [I] = 3 ;
    }

    X = 0 ; 
    Y = 0 ;

    for ( Y = 0 ; Y < (TATE+2) ; Y++) {
      I = ( (YOKO+2) * Y ) + X ;
      NKYM [I] = 3 ;
    }

    X = (YOKO+2)-1 ; 
    Y = 0 ;

    for ( Y = 0 ; Y < (TATE+2) ; Y++) {
      I = ( (YOKO+2) * Y ) + X ;
      NKYM [I] = 3 ;
    }

    X = 0 ; 
    Y = (TATE+2) - 1 ;

    for ( X = 0 ; X < (YOKO+2) ; X++) {
      I = ( (YOKO+2) * Y ) + X ;
      NKYM [I] = 3 ;
    }

  
    
    GP = 1 ;
    DR = 1 ;
    
   
    
    } // GP == 0 
    
     
    if ( mousePressed == true ){
      
    GI = 0 ;    
      
    
       
       if ( ( ( ( mouseX - 400 ) * ( mouseX - 400 ) ) < 400 ) && ( ( ( mouseY - 600 ) * ( mouseY - 600 ) ) < 400 ) ){
        
          PHASE = 2 ; 
        
       }  
       
       if ( ( ( ( mouseX - 100 ) * ( mouseX - 100 ) ) < 400 ) && ( ( ( mouseY - 500 ) * ( mouseY - 500 ) ) < 400 ) ){
        
          TATE = TATE + 1 ; 
          GP = 0 ;        

       }   
       
       if ( ( ( ( mouseX - 200 ) * ( mouseX - 200 ) ) < 400 ) && ( ( ( mouseY - 500 ) * ( mouseY - 500 ) ) < 400 ) ){
        
          TATE = TATE - 1 ; 
          GP = 0 ;        

       }   
       
       if ( ( ( ( mouseX - 300 ) * ( mouseX - 300 ) ) < 400 ) && ( ( ( mouseY - 500 ) * ( mouseY - 500 ) ) < 400 ) ){
        
          YOKO = YOKO + 1 ; 
          GP = 0 ;        

       }   
       
       if ( ( ( ( mouseX - 400 ) * ( mouseX - 400 ) ) < 400 ) && ( ( ( mouseY - 500 ) * ( mouseY - 500 ) ) < 400 ) ){
        
          YOKO = YOKO - 1 ; 
          GP = 0 ;        

       }   
       
       if ( ( ( ( mouseX - 100 ) * ( mouseX - 100 ) ) < 400 ) && ( ( ( mouseY - 600 ) * ( mouseY - 600 ) ) < 400 ) ){
        
          EPTmax = EPTmax - 1 ; 
          GP = 0 ;        

       }   
       
       if ( ( ( ( mouseX - 200 ) * ( mouseX - 200 ) ) < 400 ) && ( ( ( mouseY - 600 ) * ( mouseY - 600 ) ) < 400 ) ){
        
          EPTmax = EPTmax + 1 ; 
          GP = 0 ;        

       }   
       
       if ( YOKO < 3 ){ YOKO = 3 ; }
       if ( YOKO > 5 ){ YOKO = 5 ; }
       if ( TATE < 3 ){ TATE = 3 ; }
       if ( TATE > 5 ){ TATE = 5 ; }
       if ( EPTmax < 3 ){ EPTmax = 3 ; }
       if ( EPTmax > 15 ){ EPTmax = 15 ;}
       DR = 1 ;
       Rmax = TATE * YOKO ;

    } // mousePressed


    if ( DR == 1 ){
      
      background (125,125,0) ;

    X = 0 ; 
    Y = 0 ;

    for ( X = 1 ; X <= (YOKO) ; X++ ) {
      stroke(0, 0, 0);
      line ( 40 + (40*X)  , 80 - 20 , 40 + (40*X) , ( 40 * (TATE) ) + 40 + 20  ) ;
    }
    for ( Y = 1 ; Y <= (TATE) ; Y++ ) {
      line ( 80 - 20 , 40 + (40*Y)  , 40 + ( 40 * (YOKO) ) + 20 , 40 + (40*Y)  ) ;
    }

 

   
    noFill() ;
    stroke(0,0,0) ;
    strokeWeight( 5 ) ; 
    line ( 380 , 580 , 420 , 600 ) ;
    line ( 420 , 600 , 380 , 620 ) ;
    line ( 380 , 620 , 380 , 580 ) ;
    ellipse ( 100 , 600 , 40 , 40 ) ;
    ellipse ( 200 , 600 , 40 , 40 ) ; 
    strokeWeight( 3 ) ;
    line ( 90 , 600 , 110 , 600 ) ;
    line ( 190 , 600 , 210 , 600 ) ;
    line ( 200 , 590 , 200 , 610 ) ;
    line ( 100 , 480 , 100 , 520 ) ;
    line ( 100 , 480 , 90 , 490 ) ;
    line ( 100 , 480 , 110 , 490 ) ;
    line ( 100 , 520 , 90 , 510 ) ;
    line ( 100 , 520 , 110 , 510 ) ;
    line ( 200 , 490 , 200 , 510 ) ;
    line ( 200 , 490 , 190 , 480 ) ;
    line ( 200 , 490 , 210 , 480 ) ;
    line ( 200 , 510 , 190 , 520 ) ;
    line ( 200 , 510 , 210 , 520 ) ;
    line ( 280 , 500 , 320 , 500 ) ;
    line ( 280 , 500 , 290 , 490 ) ;
    line ( 280 , 500 , 290 , 510 ) ;
    line ( 320 , 500 , 310 , 490 ) ;
    line ( 320 , 500 , 310 , 510 ) ;
    line ( 390 , 500 , 410 , 500 ) ;
    line ( 390 , 500 , 380 , 490 ) ;
    line ( 390 , 500 , 380 , 510 ) ;
    line ( 410 , 500 , 420 , 490 ) ;
    line ( 410 , 500 , 420 , 510 ) ;
    strokeWeight( 2 ) ;
    fill (255,255,0) ;
    for ( X = 100 ; X < ( 100 + ( 20 * EPTmax ) ) ; X = X + 20 ){
      ellipse( X , 560 , 16, 16 ) ;
    }
   
  
    DR = 0 ;  

    } // DR == 1

  
} // GOBANset()


void KESUone() {

  I = ( ( YOKO + 2 ) * Y ) + X ;
  NKYM[I] = KCOL + 3 ;

  X = X + 1 ;
  XYloop() ;
  if ( ( X >= 0 ) && ( X < (YOKO+2) ) && ( Y >= 0 ) && ( Y < (TATE+2) ) ) {
    I = ( (YOKO + 2 ) * Y ) + X ;
    if ( NKYM[I] == KCOL ) {
      KESUone() ;
    }
    if ( NKYM[I] == 0 ) {
      Kcancel = 1 ;
    }
  }

  X = X - 1 ;
  Y = Y + 1 ;
  XYloop() ;
  if ( ( X >= 0 ) && ( X < (YOKO+2) ) && ( Y >= 0 ) && ( Y < (TATE+2) ) ) {
    I = ( (YOKO + 2 ) * Y ) + X ;
    if ( NKYM[I] == KCOL ) {
      KESUone() ;
    }
    if ( NKYM[I] == 0 ) {
      Kcancel = 1 ;
    }
  }

  X = X - 1 ;
  Y = Y - 1 ;
  XYloop() ;
  if ( ( X > 0 ) && ( X < (YOKO+2) ) && ( Y > 0 ) && ( Y < (TATE+2 ) ) ) {
    I = ( (YOKO + 2 ) * Y ) + X ;
    if ( NKYM[I] == KCOL ) {
      KESUone() ;
    }
    if ( NKYM[I] == 0 ) {
      Kcancel = 1 ;
    }
  }

  X = X + 1 ;
  Y = Y - 1 ;
  XYloop() ;
  if ( ( X > 0 ) && ( X < (YOKO+2) ) && ( Y > 0 ) && ( Y < (TATE+2) ) ) {
    I = ( (YOKO + 2 ) * Y ) + X ;
    if ( NKYM[I] == KCOL ) {
      KESUone() ;
    }
    if ( NKYM[I] == 0 ) {
      Kcancel = 1 ;
    }
  }

  Y = Y + 1 ;
  XYloop() ;
} // KESUone()


void KESUtwo(){
  
    for ( II = 0 ; II < ((TATE+2)*(YOKO+2)) ; II ++ ) {
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
        for ( II = 0 ; II < ((TATE+2)*(YOKO+2) - 1 ) ; II ++ ) {

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
    for ( I = 0 ; I < ( (TATE+2)*(YOKO+2) ) ; I++) {
      if ( KYM[N][I] == 2 ) {
        WSTN = WSTN + 1 ;
      }
    }
    
} // WSTNcount()


void BSTNcount(){
  
  BSTN = 0 ;
    for ( I = 0 ; I < ( (TATE+2)*(YOKO+2) ) ; I++) {
      if ( KYM[N][I] == 1 ) {
        BSTN = BSTN + 1 ;
      }
    }
    
} // BSTNcount()



void EPTNcount(){
  
  EPTN = 0 ;
    for ( I = 0 ; I < ( (TATE+2)*(YOKO+2) ) ; I++) {
      if ( KYM[N][I] == 0 ) {
        EPTN = EPTN + 1 ;
      }
    }
    
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
    if ( Z[N][III] == 9 ) {
            ZZ = 9999 ;
          }
                    
    } // 0 < R < Rmax
  
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

 
  if ( ( ZT >= 1 ) && ( ZF >= 1 ) && ( N == 0 ) && ( ZZ < 9999 ) ){
   
    
   ZZZ = 1 ;
   PHASE = 4 ;
  
  } 
  
  if ( ( ZZ < 9999  ) && ( N == 0 ) && ( ( ZT == 0 ) || ( ZF == 0 ) ) ){
    
    ZZZ = 0 ;
    PHASE = 4 ;
    
  }  
  
} // Zcheck()



void NextStep(){
  
        N = N + 1 ;
        PASSED[N] = 0 ;
        R[N] = 0 ;
  
        for ( II = 0 ; II < 360 ; II++ ) {
            Z[N][II] = 9 ;
        }
                
        for ( II = 0 ; II < ( (YOKO+2)*(TATE+2) ) ; II++ ) {
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
     
     R[0] = 0 ;
    
     
    PHASE = 2 ;
    N = 0 ;
    ZZZ = 0 ;
    //CLN = 0 ;
           
} // RESET()
  
  
void ANS(){
    

    stroke(0,0,0) ; 
    
    
    X = 0 ; 
    Y = 0 ;

    for ( X = 1 ; X <= (YOKO) ; X++ ) {
      stroke(0, 0, 0);
      line ( 40 + (40*X), (TATE*3*40+160) + 80, 40 + (40*X), (TATE*3*40+160) + ( 40 * (TATE) ) + 40  ) ;
    }
    for ( Y = 1 ; Y <= (TATE) ; Y++ ) {
      line ( 80, (TATE*3*40+160) + 40 + (40*Y), 40 + ( 40 * (YOKO) ), (TATE*3*40+160) + 40 + (40*Y) ) ;
    }


    for ( I = 0 ; I < ( (TATE+2)*(YOKO+2) ) ; I ++ ) {

      X = I ; 
      Y = 0 ;
      while ( X > ( (YOKO+2)-1) ) {
        X = X -  (YOKO+2) ;
        Y = Y + 1 ;
      }

      if ( KYM[0][I] == 1 ) {
        fill(0, 0, 0) ;
        stroke(0, 0, 0) ;
        ellipse( 40 + (40*X),  (TATE*3*40+160) + 40 + (40*Y), 37, 37 ) ;
      }


      if ( KYM[0][I] == 2 ) {
        fill(255, 255, 255) ;
        stroke(0,0,0) ;
        ellipse( 40 + (40*X),  (TATE*3*40+160) + 40 + (40*Y), 37, 37 ) ;
      }
    }  



    for ( II = 0 ; II < ( (TATE+2)*(YOKO+2) ) ; II ++ ) {

      X = II ; 
      Y = 0 ;
      while ( X > ( (YOKO+2)-1) ) {
        X = X -  (YOKO+2) ;
        Y = Y + 1 ;
      }

       
          
       X = X - 1 ;
       Y = Y - 1 ;
       III = (Y*YOKO) + X ;
       
      if ( ( X >= 0 ) && ( X < (YOKO) ) && ( Y >= 0 ) && ( Y < (TATE) ) ){
        
         X = II ; 
          Y = 0 ;
          while ( X > ( (YOKO+2)-1) ) {
            X = X -  (YOKO+2) ;
            Y = Y + 1 ;
          }

      if ( ( Z[0][III] == 1 ) && ( KYM[0][II] == 0 )  ) {
        fill(50, 50, 255) ;
        stroke(0, 0, 0) ;
        ellipse( 40 + (40*X), (TATE*3*40+160) + 40 + (40*Y), 37, 37 ) ;
      }


      if ( ( Z[0][III] == 0 ) && ( KYM[0][II] == 0 ) ) {
        fill(255, 50, 50) ;
        stroke(0, 0, 0) ;
        ellipse( 40 + (40*X), (TATE*3*40+160) + 40 + (40*Y), 37, 37 ) ;
      }
      
      }
      
    }
  } // ANS()
  
  
  
  void RNDGOBAN(){
  
   
    N = 0 ;
    X = 1 ; 
    Y = 1 ;

    while ( Y < (TATE+1) ) {
      
    
      I = ( (YOKO + 2 ) * Y ) + X ;
      NKYM[I] = 0 ;
      RND = int(random(100)) ;
      
      if ( ( RND > 0 ) && ( RND < 30 ) ) {
        NKYM[I] = 1 ;
      }
      if ( ( RND >30 ) && ( RND < 60 ) ) {
        NKYM[I] = 2 ;
      }

      X = X + 1 ;
      if ( X > (YOKO) ) {
        X = 1 ;
        Y = Y + 1 ;
      }
    }


    X = 1 ; 
    Y = 1 ;  

    while ( Y < (TATE+2-1) ) { 

      Kcancel = 0 ; 
      KCOL = 0 ;
      I = ( (YOKO+2) * Y ) + X ;
      if ( ( NKYM[I] == 1 ) || ( NKYM[I] == 2 ) ) {
        KCOL = NKYM[I] ;
        KESUone() ;
        KESUtwo() ;
      
      }

      X = X + 1 ;
      if (X > ( YOKO+2-2) ) {
        X = 1 ;
        Y = Y + 1 ;
      }
    } 

  CLOCKdraw() ;
  

} // RNDGOBAN()



void GOBANdraw(){
  
  
     background (125,125,0) ;
  
    
    X = 0 ; 
    Y = 0 ;

    for ( X = 1 ; X <= ( (YOKO) * 3 ) ; X++ ) {
      stroke(0, 0, 0);
      line ( 40 + (40*X), 80 - 20 , 40 + (40*X), ( 40 * (TATE*3) ) + 40 + 20  ) ;
    }
    
    for ( Y = 1 ; Y <= ( (TATE) * 3 ) ; Y++ ) {
      line ( 80 - 20 , 40 + (40*Y), 40 + ( 40 * (YOKO*3) ) + 20 , 40 + (40*Y) ) ;
    }


    for ( I = 0 ; I < ( (TATE+2)*(YOKO+2) ) ; I ++ ) {

      X = I ; 
      Y = 0 ;
      while ( X > ( (YOKO+2)-1) ) {
        X = X -  (YOKO+2) ;
        Y = Y + 1 ;
      }

      if ( KYM[0][I] == 1 ) {
        fill(0, 0, 0) ;
        stroke(0, 0, 0) ;
        ellipse( 40 + (40*X),  40 + (40*Y), 37, 37 ) ;
        ellipse( 40 + (40*X) + (YOKO*40) , 40 + ( 40 * Y ) , 37 , 37 ) ;
        ellipse( 40 + (40*X) + (YOKO*40*2) , 40 + ( 40 * Y ) , 37 , 37 ) ;
        ellipse( 40 + (40*X),  40 + (40*Y) + (TATE*40) , 37, 37 ) ;
        ellipse( 40 + (40*X) + (YOKO*40) , 40 + ( 40 * Y ) + (TATE*40) , 37 , 37 ) ;
        ellipse( 40 + (40*X) + (YOKO*40*2) , 40 + ( 40 * Y ) + (TATE*40) , 37 , 37 ) ;
        ellipse( 40 + (40*X),  40 + (40*Y) + (TATE*40*2) , 37, 37 ) ;
        ellipse( 40 + (40*X) + (YOKO*40) , 40 + ( 40 * Y ) + (TATE*40*2) , 37 , 37 ) ;
        ellipse( 40 + (40*X) + (YOKO*40*2) , 40 + ( 40 * Y ) + (TATE*40*2) , 37 , 37 ) ;
      }


      if ( KYM[0][I] == 2 ) {
        fill(255, 255, 255) ;
        stroke(0,0,0) ;
        ellipse( 40 + (40*X),  40 + (40*Y), 37, 37 ) ;
        ellipse( 40 + (40*X) + (YOKO*40) , 40 + ( 40 * Y ) , 37 , 37 ) ;
        ellipse( 40 + (40*X) + (YOKO*40*2) , 40 + ( 40 * Y ) , 37 , 37 ) ;
        ellipse( 40 + (40*X),  40 + (40*Y) + (TATE*40) , 37, 37 ) ;
        ellipse( 40 + (40*X) + (YOKO*40) , 40 + ( 40 * Y ) + (TATE*40) , 37 , 37 ) ;
        ellipse( 40 + (40*X) + (YOKO*40*2) , 40 + ( 40 * Y ) + (TATE*40) , 37 , 37 ) ;
        ellipse( 40 + (40*X),  40 + (40*Y) + (TATE*40*2) , 37, 37 ) ;
        ellipse( 40 + (40*X) + (YOKO*40) , 40 + ( 40 * Y ) + (TATE*40*2) , 37 , 37 ) ;
        ellipse( 40 + (40*X) + (YOKO*40*2) , 40 + ( 40 * Y ) + (TATE*40*2) , 37 , 37 ) ;
      }
    }
  
  stroke(255,255,0) ;
  noFill() ;
  rect( 40 + (YOKO*40) + 20 , 40 + (TATE*40) + 20  , (YOKO*40) , (TATE*40) ) ;
 
  for ( II = 0 ; II < 40 ; II++ ){

    stroke(125,125,0,(255-(II*6))) ;
    strokeWeight( 4 ) ;
    
    rect ( 60 + (II*2) , 60 + (II*2) , 20 + (YOKO*40*3) - (II*4) , 20 + (TATE*40*3) - (II*4) ) ;
    //rect ( 40 + int((YOKO*40/255)*II) , 40 + int((TATE*40/255)*II) , 40 + (YOKO*40*3) - int((YOKO*40/255)*II*2) , 40 + (TATE*40*3) - int((TATE*40/255)*II*2) ) ;
    

  }
  strokeWeight( 2 ) ;
  stroke(0,0,0,255) ; 
   
} // GOBANdraw()



void RtoXYI(){
  
    X = R[N] + 1 ; 
    Y = 1 ;
    while ( X > YOKO ) {
      Y = Y + 1 ;
      X = X - YOKO ;
      }
    I = ( (YOKO + 2 ) * Y ) + X ;

} // RtoXYI()



void XYloop(){
  
  if ( X <= 0 ){ X = YOKO + 1 - 1 ; }
  if ( X >= ( YOKO + 1 ) ){ X = 1 ; }
  if ( Y <= 0 ){ Y = TATE + 1 - 1 ; }
  if ( Y >= ( TATE + 1 ) ){ Y = 1 ; }
  
  I = ( ( YOKO + 2 ) * Y ) + X ;
  
}


 
 
void CLOCKdraw(){
  
   background (125,125,0) ;
   strokeWeight( 5 ) ;
   stroke (0,0,0) ;
   noFill() ;

  CLX = 90 * sin( (-1) * CLN * 2 * PI / 12 ) ;
  CLY = 90 * cos( (-1) * CLN * 2 * PI / 12 ) ;
  
  line ( 350 + (CLX/3) , 250 + (CLY/3) , 350 -  CLX  , 250 -  CLY  ) ;
  
  CLX = 60 * sin( (-1) * CLN * 2 * PI / 144 ) ;
  CLY = 60 * cos( (-1) * CLN * 2 * PI / 144 ) ;
  
  line ( 350 + (CLX/5) , 250 + (CLY/5) , 350 - CLX , 250 - CLY ) ;
  
  CLN = CLN + 0.1 ;
  
  if ( CLN > 144 ){
    CLN = 0 ; 
  }
  
  ellipse ( 350 , 250 , 200 , 200 ) ;
  strokeWeight( 2 ) ; 
  
}
   


