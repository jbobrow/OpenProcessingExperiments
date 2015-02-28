


void setup()
{
  size( 720, 600 );
  background( #6CD2FF );
  
}

void draw()
{
  strokeWeight(4);
  line( 240, 0, 240, 600);
  line( 480, 0, 480, 600);
  line( 0, 200, 720, 200);
  line( 0, 400, 720, 400);
  
  fill(#FF5B52); 
  rect(80, 220, 100, 150);
  fill(#52FF5F);
  rect(80, 20, 100, 150);
  fill(#E524FF);
  rect(80, 420, 100, 150);
  
  fill(#52FF5F);
  triangle( 300, 20, 360, 160, 420, 20 );
  fill(#FF5B52);
  triangle( 300, 220, 360, 360, 420, 220);
  fill(#E524FF);
  triangle( 300, 420, 360, 560, 420, 420);
  
  fill(#52FF5F);
  ellipse( 600, 100, 120, 120);
  fill(#FF5B52);
  ellipse( 600, 300, 120, 120);
  fill(100, 150, 150);
  ellipse( 600, 500, 120, 120);
  
  fill( 25, 200, 10);
  quad( 510, 490, 690, 480, 500, 550, 700, 540);
  
  strokeWeight(20);
  point( 600, 420);
}



