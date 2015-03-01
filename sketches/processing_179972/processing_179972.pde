
void setup(){
  size(400,400);
}

void draw(){
  int h = hour();    // Values from 0 - 23   
  int m = minute();  // Values from 0 - 59
  int s = second();  // Values from 0 - 59

  float r = map( h ,0,23,0,255);
  float g = map( m ,0,59,0,255);
  float b = map( s ,0,59,0,255);
  
  background(r,g,b);
}
