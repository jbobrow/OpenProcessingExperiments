
void area () {
  

  
  fill(0,0,20,10);
  noStroke();
  beginShape();
  for( int i=0; i<area.length; i++ ) vertex( area[ i ].x, area[ i ].y );
  endShape( CLOSE );
  
}

void areamouse () {
  
  float distance = 10000000;
  float distance_x ;
  float distance_y ;
  float pythagore ;
  float distancea ;

  for(int i=0; i<area.length; i++) {
  
    distance_x = abs (area[i].x) - mouseX;
    distance_y = abs (area[i].y) - mouseY;
    distancea = sqrt( (distance_x * distance_x) + (distance_y * distance_y) );
    if (distancea < distance) {
       plus_proche2 = i;
       distance = distancea; 
      
      
    }
  }
}

void areadragged() {

  
  area[plus_proche2].x = mouseX;
  area[plus_proche2].y = mouseY;
  
}

  

