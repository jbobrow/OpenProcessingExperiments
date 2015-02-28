
float[] tableau;
int index;

void setup() {  //setup function called initially, only once
  size(200, 200);
  
  tableau = new float[200];
  
  for ( int i =0; i < 200;i++) {
   tableau[i] = random(0,200);
  }
}

void draw() {  //draw function loops 
 background(255);

  tableau[index] =  random(0,200);
  index = ( index + 1 ) % 200;

  for ( int i =0; i < 200;i++) {
   int offset = (i + index) % 200;
   line( 0, i, tableau[offset], i );
  }
  
  
}
