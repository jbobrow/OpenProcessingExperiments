
int i, j;

size(200,200);
background(255);

for( i=20; i<=180; i+=3){
  for( j=20; j<=180; j+=3){
  
    if( i<60 || j<60 || i>140 || j>140 ){
  
      point( i, j );
    }
  }
}
