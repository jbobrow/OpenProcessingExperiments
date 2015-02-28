

int y;
int y1;

void setup(){
size ( 400, 600 );
background( 255 );
fill( 0 );
}


void draw(){
y = 10;
y1 = 20;

for ( int x = 0; x < width; x = x + 30 ){         // verschiebe 1. spalte / wiederholung
  for ( int c1 = 0; c1 < height; c1 = c1 + 40 ){ // 1. spalte
      rect( x, c1 , 10, 20 );
    }
  }

for ( int x1 = 10; x1 < width; x1 = x1 + 30 ){  // verschiebe 2. spalte / wiederholung
  for ( int c1 = 0; c1 < height; c1 = c1 +40 ){ // 2. spalte
    rect( x1, y + c1, 10, 30 ); 
    }
  }

for ( int x2 = 20; x2 < width; x2 = x2 + 30 ){  // verschiebe 3. spalte / wiederholung
  for ( int c1 = 0; c1 < height; c1 = c1 +40 ){ // 3. spalte
      rect( x2, y1 + c1, 10, 10 );
    }
  }
}



