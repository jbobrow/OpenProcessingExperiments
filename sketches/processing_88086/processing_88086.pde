
class creature {
 
  int localX = 400 ;
  int localY = 400 ;
  float r = 150 ;
  float g = 0 ;
  float b = 0 ;
  int spawnx ;
  int spawny ;
  int x ;
  int y ;
  boolean isActive = false;
  
  creature ( int _x , int _y ) {
     x = _x ;
     y = _y ;
    //println ( _x + " " + _y);
    isActive = false ;
  }
  
  void reposition ( int _x , int _y ) {
    if ( isActive ) {
      x = _x ;
      y = _y ;
      println ( _x + " " + _y);
    }
  }
  
  void select ( int _x , int _y ) {
    if ( ( abs ( _x - x ) < 160/2 )  &&  ( abs ( _y - y ) < 100/2 ) ) {
      isActive = true;
    }
  }

  void deselect( int _x , int _y ) {
    isActive = false;
  }
 
  void display () {

    draw_arms () ;
    draw_legs () ;
    draw_body () ;
    draw_head () ; 
  }
  
  void jiggle ( int spawnx , int spawny ) {
    
    int tx = x ;
    int ty = y ;
    x = x + spawnx ;
    y = y + spawny ;
    display () ;
    x = tx ;
    y = ty ;
  }
  
  void draw_arms () {
   
    //  arms objects
    strokeWeight ( 4 ) ;
    line ( x - 20 , y , x - 60 , y + 40 ) ;  //  left arm
    line ( x + 20 , y , x + 60 , y + 40 ) ;  //  right arm
  }
   
  void draw_legs () {  
    
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
  void draw_body () {  
    
    rectMode ( CENTER ) ;   
    ellipseMode ( CENTER ) ;
    //  body object
    fill(187);          //  COLOR 1 for Char
    rect( x, y + 30 , 40 , 60 ) ;  //  body
  }  
    
  void draw_head () { 
    
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
}

