
/* homework 4 sijiaw

      copyright shirley wang 2013 */
      
float x, y, wd, ht;
PImage m;
int counter = 0 ; 
float value = ( 0 );

void setup ( ) {
  smooth ( );
  size ( 800, 400 );
  background ( 0 );
  
  x  = 100;
  y  = 100;
  wd = width ;
  ht = height;

}

void draw ( ) {
  
  //meerkat
   m = loadImage ( "meerkat.png");
    image ( m, 0, 0 );
   
  //directions 
   pushMatrix ( );
   fill ( 255 );
   textSize ( 20 );
   text ( "Click and drag the mouse to find the meerkat.", 180, 160 );
   text ( "Press space to start and change frames.", 180, 200 );
   popMatrix ( );
   
   
  //frames 
    if ( key == ' ' && counter == 0 ) {
      background ( mouseY, 255 , 200 );
    
    }
    else if ( key == ' ' && counter == 1 ) {
      background ( mouseY, mouseX, 224 );
  }
  
    else if ( key == ' ' && counter == 2 ) {
      background ( mouseY, 20, 100 );
    }
    
    else if ( key == ' ' && counter == 3 ) {
      background ( 200, mouseX, 30 );
    }
    
    else if ( key == ' ' && counter == 4 ) {
      background ( 150, mouseX, 150 ) ;
    }
    
    else if ( key == ' ' && counter == 5 ) {
      background ( mouseX, mouseY, mouseX);
    }
    
    else if ( key == ' ' && counter == 6 ) {
      background ( 255, mouseX, mouseY );
    }
    
    else if ( key == ' ' && counter == 7 ) {
      background ( 60, mouseY, mouseX );
    }
    
    else if ( key == ' ' && counter == 8) {
      background ( mouseY, 255 , 200 );
    
    }
    else if ( key == ' ' && counter == 9 ) {
      background ( mouseY, mouseX, 224 );
  }
  
    else if ( key == ' ' && counter == 10 ) {
      background ( mouseY, 20, 100 );
    }
    
    else if ( key == ' ' && counter == 11 ) {
      background ( 200, mouseX, 30 );
    }
    
    else if ( key == ' ' && counter == 12 ) {
      background ( 150, mouseX, 150 ) ;
    }
    
    else if ( key == ' ' && counter == 13 ) {
      background ( mouseX, mouseY, mouseX);
    }
    
    else if ( key == ' ' && counter == 14 ) {
      background ( 255, mouseX, mouseY );
    }
  
  
  // meerkat finder  
  fill ( 100 );
  noStroke ( );
  ellipse ( mouseX, mouseY, 2 * x, 2 * y );
  

}

void keyPressed ( ) {
    
  counter ++;
  if (counter == 15 ){
    counter = 0;
    
     }
}
   
    
  void mouseDragged ( ) {
   
    //meerkat location
    value =  ( 0 ) ;
    if ( mouseX < wd * .2 && mouseY < ht * .3 && counter == 4 ) {
      image ( m, wd * .1, ht * .15 );
     }
     else if ( mouseX > wd * .2 && mouseX < wd * .4 && mouseY < ht * .3 && counter == 6 ){
       image ( m, wd * .3, ht * .2 );
     }
     else if ( mouseX > wd * .4 && mouseX < wd * .6 &&  mouseY < ht * .3 && counter == 13 ){
       image ( m, wd * .5, ht * .1 );
     }
     else if ( mouseX > wd * .6 && mouseX < wd * .8 &&  mouseY < ht * .3 && counter == 5 ){
       image ( m, wd * .7, ht * .15 );
     }
     else if ( mouseX > wd * .8 && mouseX < wd      &&  mouseY < ht * .3 && counter == 12 ){
       image ( m, wd * .9, ht * .2 );
     }
     else if ( mouseX < wd * .2 && mouseY > ht * .3 &&  mouseY < ht * .6 && counter == 0){
       image ( m, wd * .1 , ht * .4 ); 
     }
     else if ( mouseX > wd * .2 && mouseX < wd * .4 &&  mouseY > ht * .3 && mouseY < ht * .6 && counter == 1 ){
       image ( m, wd * .3, ht * .5 );
     }
     else if ( mouseX > wd * .4 && mouseX < wd * .6 &&  mouseY > ht * .3 && mouseY < ht * .6 && counter == 7 ){
       image ( m, wd * .5, ht * .45 );
     }
     else if ( mouseX > wd * .6 && mouseX < wd * .8 &&  mouseY > ht * .3 && mouseY < ht * .6 && counter == 9 ){
       image ( m, wd * .7, ht * .38); 
     }
     else if ( mouseX > wd * .8 && mouseX < wd      &&  mouseY > ht * .3 && mouseY < ht * .6 && counter == 3 ){
       image ( m, wd * .9, ht * .5 );
     }
     else if ( mouseX < wd * .2 &&  mouseY > ht * .6 && mouseY < ht && counter == 10 ){
       image ( m, wd * .1, ht * .7 );
     }
     else if ( mouseX > wd * .2 && mouseX < wd * .4 &&  mouseY > ht * .6 && mouseY < ht && counter == 14 ){
       image ( m, wd * .3, ht * .8 );
     }
     else if ( mouseX > wd * .4 && mouseX < wd * .6 &&  mouseY > ht * .6 && mouseY < ht && counter == 2 ){
       image ( m, wd * .5, ht * .75 );
     }
     else if ( mouseX > wd * .6 && mouseX < wd * .8 &&  mouseY > ht * .6 && mouseY < ht && counter == 8 ){
       image ( m, wd * .7, ht * .83 );
     }
     else if ( mouseX > wd * .8 && mouseX < wd      &&  mouseY > ht * .6 && mouseY < ht && counter == 11 ){
       image ( m, wd * .9, ht * .7 );
     }
  }
  
  

  
  
  


