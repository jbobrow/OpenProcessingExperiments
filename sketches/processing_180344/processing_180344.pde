
size (800, 800);
background(0, 45, 56);

int arcX = 20;
int arcY = 20;

for (int i = 1; i < (width - 40); i = i+40){
  for(int j = 1; j < (height - 40); j = j + 40){
    int r = floor(random(5));
    if(r == 1){
      rotate(radians(random(0, 45)));
    } else if ( r==2 ) {
      rotate(radians(random(46, 90)));
    } else if ( r==3 ) {
      rotate(radians(random(91, 135)));
    }
    noStroke();
    fill( 58, 214, 137 );
    arc((arcX+i), (arcY+j), 40, 40, radians(45), radians(260));
  }
}


