
///////////
// creates an integer spiral (similar to the one used in the Ulam Spiral
// and gives each integer a colour based on its "stoping time" with regards
// to the Collatz conjecture
///////////

void setup () {
  size(600,600);
  background(0);
  fill(0);
  stroke(0);
  draw();
  saveFrame("output.png");
  noLoop();
}

void draw () {
  int xCoord = (height)/2;
  int yCoord = (width)/2;
  int scaling = 1;
  double n = 1;
  
  for(int i = 1; i <= 570;){ 
    // right
    for (int j = 0; j < scaling*i; j++){ 
      
      colourFunc(collatz(n));
      n++;  
      point ( xCoord + j , yCoord );
    } 
    xCoord += scaling*i;
    i++; 
    
    // up
    for (int j = 0; j < scaling*i; j++){ 
      colourFunc(collatz(n));
      n++;  
      point ( xCoord , yCoord - j);
    } 
    yCoord -= scaling*i;
    i++;
    
    // left
    for (int j = 0; j < scaling*i; j++){
      colourFunc(collatz(n));
      n++;   
      point ( xCoord - j , yCoord );
    }    
    xCoord -= scaling*i;
    i++; 
    
    // down
    for (int j = 0; j < scaling*i; j++){
      colourFunc(collatz(n));
      n++;  
      point ( xCoord , yCoord +j);
    }
    yCoord += scaling*i;
    i++;
  } 
 
}

int collatz (double n) {
  int output = 0;
  while (n != 1){
    if ( n % 2 == 0 ){
      n /= 2;
    } else {
      n *= 3;
      n++;
    }
    output++;
  }
  return output; 
}

void colourFunc (int n) {
   if (n < 64) {
     stroke(0);
   } else if (n < 255){
     stroke (n);
   } else if (n < 511){
     stroke (255, n);
   } else {
     stroke (255,255,n );
   }
     
}


