
void setup () {
  size (370, 600);
  background (80,20,30);
  smooth ();
  noLoop ();
}


 
void draw () {
  
  stroke (80);
  for (int i=0; i < width; i += 5) {
  float r = random (10, 30);
  rect (i, r, 1, 500);
 
}
 
 
  stroke (210);
  strokeWeight (5);
  line (150, 140, 210, 200);
  line (210, 140, 150, 200);
 
  }



 
    



