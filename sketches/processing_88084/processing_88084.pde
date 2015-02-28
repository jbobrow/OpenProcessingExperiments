

int localX = 400 ;
int localY = 400 ;
float r = 150 ;
float g = 0 ;
float b = 0 ;
int spawnx ;
int spawny ;
 

void setup() {
  
  size( 800 , 800 ) ;      
  
}

void draw () {
  
  background( r , g , b ) ;      
  
  smooth() ;           
    
  draw_creature ( localX , localY ) ;
 
  int i = 0 ;
  spawnx =  ( int ) random ( -30 , 30 ) ;
  spawny =  ( int ) random ( -30 , 30 ) ;
 
  if ( keyPressed ) {
  
    if ( key == 'b' || key == 'B' ) {
    
      for ( i = -1 ; i < 2 ; i++ ) {
        draw_creature ( localX + spawnx + ( i * 200 ) , localY + spawny ) ;
      }
    }
   
    if (key == 'n' || key == 'N') {
   
      for ( i = -1 ; i < 2 ; i++ ) {
        draw_creature ( localX + spawnx , localY + spawny );
      }
    }
  } 
  if ( keyPressed ) {
  
    if ( key == 'v' || key == 'V' ) {
  
      background( r , g , b ) ;
   
      if( mouseX > width/3 && mouseX < width/3*2 ) {
      r = r + 1 ;
      b = b - 1 ;
      } else {
      r = r - 1 ;
      b = b + 1 ;
        }
    }
  }
 
 if ( mousePressed && ( mouseButton == LEFT ) ) {
   localX = mouseX ;
   localY = mouseY ;
   
  if ( r > 255 ) {
    r = 255 ; 
  } else if ( r < 0 ) {
    r = 0 ; 
    }
  
   if ( b > 255 ) {
    b = 255 ; 
   } else if ( b < 0 ) {
    b = 0 ; 
     }
 }  
 
    for ( i = -1 ; i < 2 ; i++ ) {
      draw_creature ( localX + ( i * 200 ), localY ) ;
  }
}

void draw_creature ( int x , int y ) {

  rectMode ( CENTER ) ;   
  ellipseMode ( CENTER ) ;
  draw_arms ( x , y ) ;
  draw_legs ( x , y ) ;
  draw_body ( x , y ) ;
  draw_head ( x , y ) ;   
}    
  
void draw_arms ( int x , int y ) {
 
  rectMode ( CENTER ) ;   
  ellipseMode ( CENTER ) ;
  //  arms objects
  strokeWeight ( 4 ) ;
  line ( x - 20 , y , x - 60 , y + 40 ) ;  //  left arm
  line ( x + 20 , y , x + 60 , y + 40 ) ;  //  right arm
}
 
void draw_legs ( int x , int y ) {  
  
  rectMode ( CENTER ) ;   
  ellipseMode ( CENTER ) ;
  //leg objects
  line ( x - 20 , y + 60 , x - 20 , y + 100 ) ;  //  left leg
  line( x + 20 , y + 60 , x + 20, y + 100 ) ;  //  right leg
  strokeWeight( 1 ) ;
  fill( 187 ) ;
  ellipse(x - 20 , y + 80 , 20 , 20 ) ;  //  left plate
  ellipse( x + 20 , y + 80 , 20 , 20 ) ;  //  right plate
  rect( x - 20 , y + 100 , 20 , 10 ) ;
  rect(x + 20 , y + 100 , 20 , 10 );
}  
void draw_body ( int x , int y ) {  
  
  rectMode ( CENTER ) ;   
  ellipseMode ( CENTER ) ;
  //  body object
  fill(187);          //  COLOR 1 for Char
  rect( x, y + 30 , 40 , 60 ) ;  //  body
}  
  
void draw_head ( int x , int y ) { 
  
  rectMode ( CENTER ) ;   
  ellipseMode ( CENTER ) ;
  //  neck object
  strokeWeight( 4 ) ;
  line( x , y - 20 , x , y ) ;  //neck
  
  //  head objects
  strokeWeight( 1 ) ;
  fill( 187 ) ;                                                    //COLOR 1 for Char
  stroke( 0 ) ;
  rect( x , y -70 , 80 , 60 ) ;
  fill( 250 , 215 , 199 ) ;                                            //SKIN for Char
  rect( x , y - 30 , 70 , 20 ) ;
  fill( 60 ) ;                                                     //eye color
  rect( x + 20 , y - 60 , 20 , 20 ) ;                            //right eye
  rect( x - 20 , y - 60 , 20 , 20 ) ;                            //left eye
  noStroke() ;                                                   //stop stroke for eye
  fill( 245 ) ;                                                    //sclera color
  rect( x + 20 , y - 60 , 10 , 10 ) ;                            //right sclera
  rect( x - 20 , y - 60 , 10 , 10 ) ;                            //left sclera
  fill( 237 , 50 , 50 ) ;                                              //pupil color
  rect( x + 20 , y - 60 , 5 , 5 ) ;                              //right pupil
  rect( x - 20 , y - 60 , 5 , 5 ) ;                              //left pupil
  fill( 0 ) ;                                                      //Black
  stroke( 0 ) ;                                                    //stroke back to normal
  rect( x , y - 36 , 20 , 5 ) ;                             //mouth
  line( x + 30 , y - 85 , x + 10 , y - 75 ) ;            //right eyebrow
  line( x - 30 , y - 85 , x - 10 , y - 75 ) ;            //left eyebrow
  fill( 235 ) ;
  triangle( x + 10 , y - 100 , x - 10 , y - 100 , x , y - 130 ) ;
  triangle( x - 30 , y - 100 , x - 20 , y - 100 , x - 25 , y - 110 ) ;
  triangle( x + 20 , y - 100 , x + 30 , y - 100 , x + 25 , y - 110 ) ;
  
  //  beard
  fill( 126 , 92 , 70 ) ;
  noStroke();
  rect( x + 30 , y - 30 , 10 , 20 ) ;
  rect( x - 30 , y - 30 , 10 , 20 ) ;
  rect( x + 12 , y - 30 , 5 , 20 ) ;
  rect( x - 12 , y - 30 , 5 , 20 ) ;
  rect( x , y - 20 , 70 , 10 ) ;
  ellipse( x , y - 23 , 40 , 15 ) ;
  ellipse( x , y - 13 , 70 , 25 ) ;
  ellipse( x , y - 3 , 60 , 25 ) ;
  ellipse( x , y + 7 , 40 , 20 ) ;
  ellipse( x , y + 12 , 25 , 20 ) ;
  stroke( 0 ) ;  
}



