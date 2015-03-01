

void setup (){
  size (400, 400);
  background (252);
}
 int cir=4;

void draw () {
 noFill ();
 strokeWeight(1);
  if ( mousePressed == true ) {
  ellipse ( mouseX, mouseY, cir,cir );
  cir = cir+5;
  }
}

