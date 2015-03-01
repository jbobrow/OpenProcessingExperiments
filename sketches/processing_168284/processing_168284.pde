
{
size(200,480);
background(0,255);

smooth();
}

void draw()
{
  background(0,255);
  //translate(mouseX, mouseY);
  //println(mouseX);
  fill(255);
  stroke(0,0,0);
  rotate(radians(second())*180);
  triangle( 0, 90, 200, 45, 0, 0 );
  triangle( 0, 180, 170, 135, 0, 90 );
  triangle( 0, 260, 140, 225, 0, 180 );
  triangle( 0, 260, 110, 305, 0, 340 );
  triangle( 0, 340, 80, 370, 0, 400 );
  triangle( 0, 400, 55, 425, 0, 450 );
  triangle( 0, 450, 35, 465, 0, 480 );
}
