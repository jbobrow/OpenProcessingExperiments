
float x1 = 0;
float y1 = 0;
float d = 1.6;

void setup(){
size ( 400, 400 );
background( 255 );
fill( 0 );
}

void draw(){
rectMode(CENTER);
  for ( float y = height/2; y <= height; y = (y + 20) ){ // 1. Hälfte     
  for ( float x = 10; x <= width; x = (x + 20)){  
      rect( x, y , x1, y1 );
}
      x1 = x1-d;
      y1 = y1-d;
} 

  for ( float y = 0; y <= height/2; y = (y + 20) ){ // 2.Hälfte    
  for ( float x = 10; x <= width; x = (x + 20)){  
        rect( x, y , x1, y1 );
}
      x1 = x1+d;
      y1 = y1+d;
} 

}


