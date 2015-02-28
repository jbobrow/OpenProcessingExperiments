



void Auge (int pos1, int pos2, int rad1, int rad2)

{
  pushStyle();
  noStroke();
  fill(0);
  ellipse( pos1, pos2, rad1, rad2);
  fill(random (100), 0, 0 );
  stroke(255, 230, 0);
  
  // version 1
  //ellipse(pos1 + map(mouseX,0,width, -rad1/3, rad1/3), pos2 + map(mouseY,0,height, -rad2/3, rad2/3), rad1/3, rad2/3);

  // version 2
  float a = atan2( mouseY-pos2, mouseX-pos1 );
  float d = dist( mouseX, mouseY, pos1, pos2 );
  pushMatrix();
    translate( pos1, pos2 );
    rotate(a);
    translate( d / 20, 0 );
    ellipse( 0,0, rad1/3, rad2/3 );
  popMatrix();
  popStyle();
}

