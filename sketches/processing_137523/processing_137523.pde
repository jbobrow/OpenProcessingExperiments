
PShape svg;

void setup(){
  size( 400, 400 );
  svg = loadShape( "Example.svg" );
}

void draw(){
  background( frameCount % 255 );
  shape( svg, 0, 0, 400, 400 );
  shape( svg, mouseX, mouseY, width-mouseX, height-mouseY );
}



