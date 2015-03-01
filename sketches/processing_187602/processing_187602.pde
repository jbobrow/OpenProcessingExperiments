
// random_YOSE_problem

int TATE = 16 ;
int YOKO = 7 ;

int PHASE = 1 ;

int X = 0 ; int Y = 0 ;
int RND = 0 ;

int [][] KYM = new int[30000][361] ;
int [] NKYM = new int[30000] ;
long T = 0 ;
int N = 0 ;
int Nmax = 0 ;
int [] D = new int [30000] ;
int [] B = new int [30000] ;
int [] R = new int [30000] ;
int Rmax = TATE * YOKO ;
int [] NBW = new int[30000] ;
int KCOL = 0 ;
int IDOU = 0 ;
int Kcancel = 0 ;
int I = 0 ; int II = 0 ; int III = 0 ; int IIII = 0 ;
int [][] Z = new int [30000][361] ; 
int Zmax = 0 ; int Zmin = 0 ;
int ZT = 0 ; int ZF = 0 ; int ZZ = 0 ;
int ZZZ = 0 ;
int WSTN = 0 ;
int BSTN = 0 ;
int EPTN = 0 ;
int EPTmax = 9 ;
int KOU = 0 ;
int GP = 0 ;
int DR = 0 ;
int GI = 0 ;
int Q = 0 ;
int [] PASSED = new int [30000] ;

float CLX = 0 ;
float CLY = 0 ;
float CLN = 0 ;

int [] TJNB = new int [30000] ; 
int TJNBmax = 0 ;
int [] TJNW = new int [30000] ; 
int TJNWmax = 0 ;
int [][] F = new int [30000][360] ;
int maxI = 0 ; int minI = 0 ;



void setup(){
  
  size (400,800) ;
  strokeWeight( 2 ) ;
   for ( II = 0 ; II < 361 ; II++ ) {
     Z[0][II] = 9 ;
     PASSED[II] = 0 ;
     }
  
} // setup()

void draw(){
  
  
 
  
  if ( PHASE == 6 ){
    
    ANS() ;
    
    if ( mousePressed == true ){
      RESET() ;
    }
    
  } //PHASE == 6 
  
  
  
  if ( PHASE == 5 ){
    
    if ( mousePressed == true ){
      PHASE = 6 ;
      N = 0 ; II = 1 ; IIII = 0 ;
      T = millis() ;
    }
    
  } // PHASE == 5
  
  
  
  if ( PHASE == 4 ){
    
    
      GOBANdraw() ;
      TEJUNfind() ;
      PHASE = 5 ;
      
   
  
  } // PHASE == 4
  
 
  if ( PHASE == 3 ){
    
    for ( Q = 0 ; Q < 10000 ; Q++ ){
    
     
        
    if ( ( Nmax >= 29998 ) ){
      
      ZZZ = 0  ;
      RESET() ;
      //println( "TimeOut" ) ;
      
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
      
      if ( NBW[N] == 1 ) { 
        KCOL = 2 ;
      }
      if ( NBW[N] == 2 ) { 
        KCOL = 1 ;
      }

      if ( NKYM[I] == KCOL ) {
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
        
       RtoXYI() ; 
       if ( ( Y < 3 ) || ( Y > (TATE-2) ) ){
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
      
    if (  PASSED[B[N]] == 0  ){
      
      PASSED[N] = 1 ;
      NextStep() ;
     
     }else{ 
      SCOREcount() ;
      R[N] = R[N] + 1 ;
     }
    }else{
      
      PASSED[N] = 0 ;
      NextStep() ;
      
    } // N > 0 or not
    
    } // R[N] == Rmax
    
    if ( R[N] > Rmax ) {
      
      Zcheck() ;
      R[N] = R[N] + 1 ;
      
      
    }
    
    if ( PHASE != 3 ){ Q = 1000000 ; }
    
    } // Q
    
    CLOCKdraw() ;
    
    if ( ( mousePressed == true ) ){ RESET() ; }
    
  } // PHASE == 3
  
 
  if ( PHASE == 2 ){
    
    RESET() ;
    RNDGOBAN() ; 
    N = 0 ;
   
      for ( II = 0 ; II < ( (YOKO+2)*(TATE+2) ) ; II++ ) {
           KYM[N][II] = NKYM[II] ;
        }
   
   
    PHASE = 3 ;
   
    NBW[0] = 1 ;
    Rmax = TATE * YOKO ;
    
    EPTNcount() ;
    
    if ( EPTN > EPTmax ) { PHASE = 2 ; }
            
             
  } // PHASE == 2
   
  
  
  
  if ( PHASE == 1 ){
    
    GOBANset() ;
    PHASE = 2 ;
          
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
    
    Rmax = TATE * YOKO ;
     
} // GOBANset()


void KESUone() {

  I = ( ( YOKO + 2 ) * Y ) + X ;
  NKYM[I] = KCOL + 3 ;

  X = X + 1 ;
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
} // KESUone()


void KESUtwo(){
  
    for ( II = 0 ; II < ((TATE+2)*(YOKO+2)) ; II ++ ) {
          if ( NKYM[II] == KCOL+3 ) {
            if ( Kcancel == 0 ) {
              
              if ( KCOL == 1 ){ NKYM[II] = 2 ; }
              if ( KCOL == 2 ){ NKYM[II] = 1 ; }
              
            }
            if ( Kcancel == 1 ) {
              NKYM[II] = KCOL ;
            }
          }
        }
        
} // KESUtwo()


void KOUcheck(){
  
   if (  D[N] > 0  ) {
     
       III = N ;
       while ( III > 0 ){
        
        KOU = 1 ; 
        for ( II = 0 ; II < ((TATE+2)*(YOKO+2) - 1 ) ; II ++ ) {

          if ( KYM[B[III]][II] != NKYM[II] ) {
            KOU = 0 ;
          }
        }
        
        if ( KOU == 1 ){ III = 0 ; }
        
        III = B[III] ;
        
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
  Zmax = 100 ; Zmin = 500 ;
  
  for ( III = 0 ; III <= Rmax ; III ++ ){
    
    if ( ( Z[N][III] > 100 ) && ( Z[N][III] < 500 ) ) {
            
            if ( Zmax < Z[N][III] ){ Zmax = Z[N][III] ; }
            if ( Zmin > Z[N][III] ){ Zmin = Z[N][III] ; }
      
          }
    if ( Z[N][III] == 9 ) {
            ZZ = 9 ;
          }
                    
    } // 0 < R < Rmax
  
  if ( ( NBW[N] == 1 ) && ( D[N] > 0 ) && ( ZZ != 9 ) ){
    
   Z[B[N]][R[B[N]]] = Zmax ;
   N = B[N] ;
   Zcheck() ;
  
  }
  
  if ( ( NBW[N] == 2 ) && ( D[N] > 0 ) && ( ZZ != 9 ) ){
    
   Z[B[N]][R[B[N]]] = Zmin ;
   N = B[N] ;
   Zcheck() ;
  
  }
 

 
 
  if (  ( N == 0 ) && ( ZZ != 9 ) ){
   
    
   ZZZ = 1 ;
   PHASE = 4 ;
  
  } 
  
 
  
} // Zcheck()



void NextStep(){
 
        B[Nmax+1] = N ;
        F[N][R[N]] = Nmax + 1 ;
        N = Nmax + 1 ;
        D[N] = D[B[N]] + 1 ;
        Nmax = Nmax + 1 ;
        PASSED[N] = 0 ;
        R[N] = 0 ;
  
        for ( II = 0 ; II < 360 ; II++ ) {
            Z[N][II] = 9 ;
        }
                
        for ( II = 0 ; II < ( (YOKO+2)*(TATE+2) ) ; II++ ) {
           KYM[N][II] = NKYM[II] ;
        }
        
               
        if ( NBW[B[N]] == 1 ){ NBW[N] = 2 ; }
        if ( NBW[B[N]] == 2 ){ NBW[N] = 1 ; } 
       
 
                 
} // NextStep() ;


void RESET(){
  
    for ( I = 0 ; I < 30000 ; I++ ){
    for ( II = 0 ; II < 360 ; II++ ) {
     Z[I][II] = 9 ;
     PASSED[II] = 0 ;
     TJNB[II] = 0 ;
     TJNW[II] = 0 ;
     
     }
     }
     
     R[0] = 0 ;
     Nmax = 0 ;
     NBW[0] = 1 ;
     
    PHASE = 2 ;
    N = 0 ;
    ZZZ = 0 ;
    
           
} // RESET()
  
  
void ANS(){
    

    background(125,125,0) ;
    stroke(0,0,0) ;
    
    
    X = 0 ; 
    Y = 0 ;

    for ( X = 1 ; X <= (YOKO) ; X++ ) {
      stroke(0, 0, 0);
      line ( 40 + (40*X),  80, 40 + (40*X),  ( 40 * (TATE) ) + 40  ) ;
    }
    for ( Y = 1 ; Y <= (TATE) ; Y++ ) {
      line ( 80,  40 + (40*Y), 40 + ( 40 * (YOKO) ),  40 + (40*Y) ) ;
    }


    for ( I = 0 ; I < ( (TATE+2)*(YOKO+2) ) ; I ++ ) {

      X = I ; 
      Y = 0 ;
      while ( X > ( (YOKO+2)-1) ) {
        X = X -  (YOKO+2) ;
        Y = Y + 1 ;
      }

      if ( KYM[N][I] == 1 ) {
        fill(0, 0, 0) ;
        stroke(0, 0, 0) ;
        ellipse( 40 + (40*X),   40 + (40*Y), 37, 37 ) ;
      }


      if ( KYM[N][I] == 2 ) {
        fill(255, 255, 255) ;
        stroke(0,0,0) ;
        ellipse( 40 + (40*X),   40 + (40*Y), 37, 37 ) ;
      }
    }  

   if ( ( millis() - T ) > 750 ){
     
     T = millis() ; 
     
     if ( IIII == 0 ){
     if ( II < TJNBmax ){
       
       N = TJNB[II] ;
       II = II + 1 ;
       
     }else{
       
       N = 0 ; II = 1 ; IIII = 1 ;
       
     }
     }
     
     
     if ( IIII == 1 ){
     if ( II < TJNWmax ){
       
       N = TJNW[II] ;
       II = II + 1 ;
       
     }else{
       
       N = 0 ; II = 1 ; IIII = 0 ;
       
     }
     }
     
     
   }
   
  

  } // ANS()
  
  
  
void RNDGOBAN(){
  
   
    N = 0 ;
    X = 1 ; 
    Y = 1  ;
    I = ( (YOKO + 2 ) * Y ) + X ;

    Y = 1 ;
    for ( X = 1 ; X <= YOKO ; X++){     
      I = ( (YOKO + 2 ) * Y ) + X ;
      NKYM[I] = 2 ;       
    }
    
    Y = 2 ;
    for ( X = 1 ; X <= YOKO ; X++){     
      I = ( (YOKO + 2 ) * Y ) + X ;
      NKYM[I] = 2 ;       
    }
    
    Y = TATE - 1 ;
    for ( X = 1 ; X <= YOKO ; X++){     
      I = ( (YOKO + 2 ) * Y ) + X ;
      NKYM[I] = 1 ;       
    }
    
    Y = TATE ;
    for ( X = 1 ; X <= YOKO ; X++){     
      I = ( (YOKO + 2 ) * Y ) + X ;
      NKYM[I] = 1 ;       
    }
    
    for ( X = 1 ; X <= YOKO ; X = X + 2 ){
      for ( Y = 3 ; Y <= (TATE-2) ; Y++ ){
        I = ( (YOKO + 2 ) * Y ) + X ;
        NKYM[I] = 2 ; 
      }
    }
    
    for ( X = 2 ; X <= YOKO ; X = X + 2 ){
      for ( Y = 3 ; Y <= (TATE-2) ; Y++ ){
        I = ( (YOKO + 2 ) * Y ) + X ;
        NKYM[I] = 1 ; 
      }
    }
    
    X = 1 ; Y = 1 ; I = ( (YOKO + 2 ) * Y ) + X ; NKYM[I] = 0 ;
    X = YOKO ; Y = 1 ; I = ( (YOKO + 2 ) * Y ) + X ; NKYM[I] = 0 ;
    X = 1 ; Y = TATE ; I = ( (YOKO + 2 ) * Y ) + X ; NKYM[I] = 0 ;
    X = YOKO ; Y = TATE ; I = ( (YOKO + 2 ) * Y ) + X ; NKYM[I] = 0 ;
   
    
    for ( II = 0 ; II < 5 ; II++ ){
        
      X = int(random(2.5,(YOKO-0.5))) ;  
      Y = int(random(3.5,(TATE-1))) ;
      I = ( (YOKO + 2 ) * Y ) + X ; 
      NKYM[I] = 0 ;
           
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

    for ( X = 1 ; X <= (YOKO) ; X++ ) {
      stroke(0, 0, 0);
      line ( 40 + (40*X), 80, 40 + (40*X), ( 40 * (TATE) ) + 40  ) ;
    }
    for ( Y = 1 ; Y <= (TATE) ; Y++ ) {
      line ( 80, 40 + (40*Y), 40 + ( 40 * (YOKO) ), 40 + (40*Y) ) ;
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
      }


      if ( KYM[0][I] == 2 ) {
        fill(255, 255, 255) ;
        stroke(0,0,0) ;
        ellipse( 40 + (40*X),  40 + (40*Y), 37, 37 ) ;
      }
    }  

  
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

 
 
void CLOCKdraw(){
  
   background (125,125,0) ;
   strokeWeight( 5 ) ;
   stroke (0,0,0) ;
   noFill() ;

  CLX = 90 * sin( (-1) * CLN * 2 * PI / 12 ) ;
  CLY = 90 * cos( (-1) * CLN * 2 * PI / 12 ) ;
  
  line ( 200 + (CLX/3) , 200 + (CLY/3) , 200 -  CLX  , 200 -  CLY  ) ;
  
  CLX = 60 * sin( (-1) * CLN * 2 * PI / 144 ) ;
  CLY = 60 * cos( (-1) * CLN * 2 * PI / 144 ) ;
  
  line ( 200 + (CLX/5) , 200 + (CLY/5) , 200 - CLX , 200 - CLY ) ;
  
  CLN = CLN + 0.1 ;
  
  if ( CLN > 144 ){
    CLN = 0 ; 
  }
  
  ellipse ( 200 , 200 , 200 , 200 ) ;
  strokeWeight( 2 ) ; 
  
} // CLOCKdraw
   
   

void SCOREcount(){
  
  WSTNcount() ; 
  BSTNcount() ;
  
      
    Z[N][R[N]] = 300 + ( BSTN - WSTN ) ;
    
  
} // SCOREcount



void TEJUNfind() {
  
  I = 0 ; N = 0 ; 
  
  while ( I <= 361 ){
    
   Zmax = 100 ; Zmin = 500 ; 
  
   for ( III = 0 ; III <= Rmax ; III ++ ){
    
    if ( ( Z[N][III] > 100 ) && ( Z[N][III] < 500 ) ) {
            
            if ( Zmax < Z[N][III] ){ Zmax = Z[N][III] ; maxI = III ; }
            if ( Zmin > Z[N][III] ){ Zmin = Z[N][III] ; minI = III ; }
      
          }
                      
    } // 0 < R < Rmax
    
    TJNB[I] = N ;
    if ( NBW[N] == 1 ){ 
      N = F[N][maxI] ;
      if ( maxI >= Rmax ){ TJNBmax = I + 1 ; I = 361 ; }
    }else{
      N = F[N][minI] ;
      if ( minI >= Rmax ){ TJNBmax = I + 1 ; I = 361 ; }
    }
    I = I + 1 ;
    
   
  } // I <= D[Nmax] black
 
  
  I = 0 ; N = 0 ; 
  TJNW[I] = N ;
  N = F[N][Rmax] ;
  I = I + 1 ;
  
  
  while ( I <= 361 ){
    
   Zmax = 100 ; Zmin = 500 ; 
  
   for ( III = 0 ; III <= Rmax ; III ++ ){
    
    if ( ( Z[N][III] > 100 ) && ( Z[N][III] < 500 ) ) {
            
            if ( Zmax < Z[N][III] ){ Zmax = Z[N][III] ; maxI = III ; }
            if ( Zmin > Z[N][III] ){ Zmin = Z[N][III] ; minI = III ; }
      
          }
                      
    } // 0 < R < Rmax
    
    TJNW[I] = N ;
    if ( NBW[N] == 1 ){ 
      N = F[N][maxI] ;
      if ( maxI >= Rmax ){ TJNWmax = I + 1 ; I = 361 ; }
    }else{
      N = F[N][minI] ;
      if ( minI >= Rmax ){ TJNWmax = I + 1 ; I = 361 ; }
    }
    I = I + 1 ;
    
   
  } // I <= D[Nmax] white
  
  
} // TEJUNfind 






