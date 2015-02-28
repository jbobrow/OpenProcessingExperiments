
void renderGlobe() 
{
  pushMatrix();
  translate(0,0,0);
  fill(255);
  stroke(0);
  //sphere(r);
  noFill();
  pushMatrix();
  rotateY(radians(270));
  rotateZ(radians(90));
  noStroke();
  textureMode(IMAGE);  
  texturedSphere(r, texmap);
  popMatrix();  
  popMatrix();
}

// Converts 3D cartesian coordinates to polar coordinates
// 
// theVector : vector to convert
// returns   : vector containing 'length', 'angleY' and 'angleZ', 
//             so that rotating a point (length, 0, 0) first  
//             around the y-axis with angleY and then around the  
//             z-axis with angleZ results again in point (x, y, z)

PVector cartesianToPolar(PVector theVector) {
  PVector res = new PVector();
  res.x = theVector.mag();
  if (res.x > 0) {
    res.y = -atan2(theVector.z, theVector.x);
    res.z = asin(theVector.y / res.x);
  } 
  else {
    res.y = 0;
    res.z = 0;
  }
  return res;
}

