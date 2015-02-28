
void draw() {
  float a = 10;
  float f = val( a );
  println(f);
  
  map(f,0,20,0,width);
}

float val (float dval) {
  dval = (dval*360)/180 ;
  return dval ; 
}

