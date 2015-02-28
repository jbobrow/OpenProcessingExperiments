
void setup() {
size (450,450);
background (250);
smooth ();

}


void draw (){
 frameRate(15);
  float h = random(1,450);
  float v = random(1,450);
  noStroke();
  fill (250,100,0,200);
  ellipse (5+h,5+v,200,200);
  if (keyPressed){background (250);}
}


