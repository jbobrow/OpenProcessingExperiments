
void setup() {
  size (640,640);
  noStroke();
}
void draw() {
 background (0) ;
 
  fill(#7600FF);
ellipse(438, 197, 208, 188);

  fill(#7600FF);
ellipse(190, 197, 208, 188);
 
 fill(#FF0505);
ellipse(314, 336, 238, 238);


fill(#F7F7F7);
arc(314, 346, 222, 210, 0, PI);

ellipse(252, 273, 57, 57);

ellipse(375, 273, 57, 57);

 fill(#00AA42) ;
for (int i = 0 ; i < 101 ; i++) {
  for (int j = 0 ; j < 101 ; j++) {
    rect(35*i, 10*j, 10, 33) ; 
  }
}
 
}



