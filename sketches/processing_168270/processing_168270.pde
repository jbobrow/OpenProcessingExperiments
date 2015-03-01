
// don’t need to re-use the result?
// here’s an even simpler version
void draw() {  
  println(absolute(-4.2));
  noLoop();
}

int absolute(int a) {
 
  if( a < 0){
  a =a*-1;
  return a;
  }
}
