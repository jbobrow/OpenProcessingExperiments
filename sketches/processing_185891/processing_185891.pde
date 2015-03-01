
int counter;

void setup() { 
  size(400, 400);
  background(255);
  // colorMode(HSB);
  String intent = "FF006699123456789";
  strlst = split(intent, intent[8]);
  String st = strlst[0];
  color culr = colo(unhex(st));
  x = unhex(st);
  println(x);
  /*for( int i = 6; i < 6 ; i++){
      
  }*/
}

void draw() {
    fill(culr);
    rect(30, 20, 55, 55);  
  
}
