
int x = 100;
float y = 100;
float rand = random(1);

void setup(){
  println( "original x: " + x );
  println( "original y: " + y );
  x = setToRandomInteger( 50 );
  y = setToRandomFloat( 100 );
  setRandVariableToRandomNumber();
  println( rand );
  println( "x after: " + x );
  println( "y after: " + y );
}

void setRandVariableToRandomNumber(){
  rand = random(1);
}

int setToRandomInteger(int maxNumber){
  println( maxNumber );
  int n =  int( random( maxNumber ) );
  return n;
}

float setToRandomFloat( int maxNumber ){
  println( maxNumber );
  float n = random( maxNumber );
  return n;
}


