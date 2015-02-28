
void setup(){
  size( 400, 400 );
}

void draw() {
  fill( 200, 0, 0, 10 );
  rect( 0, 0, width, height );
  rect( width/2 - 80, height/2 - 80, 160, 160 );
  
  pushMatrix();
  translate( width/2 + 80, height/2 - 80 );
  float angle = map( mouseY, 0, height, PI/2, -PI/2 );
  rotate( angle );
  fill( angle*100, mouseX, 200 );
  rect( 0, 0, 20, 20 );
  popMatrix();
  
  rect( width/2 - 80 - 20, height/2 - 80, 20, 20 );
}



