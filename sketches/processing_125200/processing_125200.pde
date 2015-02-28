
void setup(){
  size (620, 620);
  frameRate (10);
  noStroke ();
  background (255);
  smooth();
}
 
void draw (){
  for ( int x=4; x < 600; x += 44){
    for ( int y=4; y < 600; y += 44){
      fill (55+random(255),55+random(255),55+random(255));
      rect (x,y,40,40);
    }
  }
  filter(BLUR,1);
}


