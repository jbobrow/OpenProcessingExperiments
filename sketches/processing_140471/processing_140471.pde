
int x = 0;

void setup(){
  
}

void draw(){
  background( 255 );
  if ( keyPressed && ( key == CODED ) ){
    if ( keyCode == LEFT ){
      x--;
    }
    else if ( keyCode == RIGHT ){
      x++;
    }
  }
  
  if ( keyPressed ){
    println( key );
    if ( (key == 'h') || (key == 'H') ){
      fill( 200, 0, 0 );
    }
    else if ( (key == 'g') || (key == 'G') ){
      fill( 0, 200, 0 );
    }
    else { 
      fill( 50 );
    }
  }
  else {
    fill( 150 );
  }
  
  ellipse( width/2 + x, height/2, 50, 50 );
}


