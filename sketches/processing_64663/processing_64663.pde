
/*
Included functions:
  getVectorToLine 
    Returns a PVector pointing from the point to the closest point on the line.
  getDistToLine
    Returns a float containing the distance from a point to a line.
  getDist2ToLine
    Returns a float containing the distance squared from a point to a line.
    Skips the sqrt() step to save computational time.
  getVectorToLineSegment:
    Returns a PVector pointing from the point to the closest point on the line segment.
  getDistToLineSegment:
    Returns a float containing the distance from a point to a line segment.
  getDist2ToLineSegment:
    Returns a float containing the distance squared from a point to a line segment.
    Skips the sqrt() step to save computational time.

Syntax:
  For any function in this file, the parameters take the same format as the following:
  
  getVectorToLine(px, py, pz, x1, y1, z1, x2, y2, z2)
    <px, py, pz> - the point's location
    <x1, y1, z1> - the starting point of a line segment or one of the points on a line
    <x2, y2, z2> - the ending point of a line segment or another one of the points on a line

  In 2D applications, the parameters pz, z1, and z2 can be left out. Example:
    getVectorToLine(px, py, x1, y1, x2, y2)
*/




PVector getVectorToLine(float px, float py, float x1, float y1, float x2, float y2) {
  float ax = px - x1, ay = py - y1;
  float bx = x2 - x1, by = y2 - y1;
  float t = (ax*bx + ay*by)/(bx*bx + by*by);
  return new PVector(t*bx - ax, t*by - ay);
}

float getDistToLine(float px, float py, float x1, float y1, float x2, float y2) {
  float ax = px - x1, ay = py - y1;
  float bx = x2 - x1, by = y2 - y1;
  float t = (ax*bx + ay*by)/(bx*bx + by*by);
  bx = t*bx - ax;
  by = t*by - ay;
  return sqrt(bx*bx + by*by);
}

float getDist2ToLine(float px, float py, float x1, float y1, float x2, float y2) {
  float ax = px - x1, ay = py - y1;
  float bx = x2 - x1, by = y2 - y1;
  float t = (ax*bx + ay*by)/(bx*bx + by*by);
  bx = t*bx - ax;
  by = t*by - ay;
  return bx*bx + by*by;
}

PVector getVectorToLineSegment(float px, float py, float x1, float y1, float x2, float y2) {
  float ax = px - x1, ay = py - y1;
  float bx = x2 - x1, by = y2 - y1;
  float t = (ax*bx + ay*by)/(bx*bx + by*by);
  float projx = t*bx, projy = t*by;
  float bdotproj = bx*projx + by*projy;
  if(bdotproj < 0)
    return new PVector(-ax, -ay);
  if(bx*bx + by*by < projx*projx + projy*projy)
    return new PVector(x2 - px, y2 - py);
  return new PVector(projx - ax, projy - ay);
}

float getDistToLineSegment(float px, float py, float x1, float y1, float x2, float y2) {
  float ax = px - x1, ay = py - y1;
  float bx = x2 - x1, by = y2 - y1;
  float t = (ax*bx + ay*by)/(bx*bx + by*by);
  float projx = t*bx, projy = t*by;
  float bdotproj = bx*projx + by*projy;
  float dx, dy;
  if(bdotproj < 0) {
    dx = ax;
    dy = ay;
  }
  else if(bx*bx + by*by < projx*projx + projy*projy) {
    dx = x2 - px;
    dy = y2 - py;
  }
  else {
    dx = projx - ax;
    dy = projy - ay;
  }
  return sqrt(dx*dx + dy*dy);
}

float getDist2ToLineSegment(float px, float py, float x1, float y1, float x2, float y2) {
  float ax = px - x1, ay = py - y1;
  float bx = x2 - x1, by = y2 - y1;
  float t = (ax*bx + ay*by)/(bx*bx + by*by);
  float projx = t*bx, projy = t*by;
  float bdotproj = bx*projx + by*projy;
  float dx, dy;
  if(bdotproj < 0) {
    dx = ax;
    dy = ay;
  }
  else if(bx*bx + by*by < projx*projx + projy*projy) {
    dx = x2 - px;
    dy = y2 - py;
  }
  else {
    dx = projx - ax;
    dy = projy - ay;
  }
  return dx*dx + dy*dy;
}

PVector getVectorToLine(float px, float py, float pz, float x1, float y1, float z1, float x2, float y2, float z2) {
  float ax = px - x1, ay = py - y1, az = pz - z1;
  float bx = x2 - x1, by = y2 - y1, bz = z2 - z1;
  float t = (ax*bx + ay*by + az*bz)/(bx*bx + by*by + bz*bz);
  return new PVector(t*bx - ax, t*by - ay, t*bz - az);
}

float getDistToLine(float px, float py, float pz, float x1, float y1, float z1, float x2, float y2, float z2) {
  float ax = px - x1, ay = py - y1, az = pz - z1;
  float bx = x2 - x1, by = y2 - y1, bz = z2 - z1;
  float t = (ax*bx + ay*by + az*bz)/(bx*bx + by*by + bz*bz);
  bx = t*bx - ax;
  by = t*by - ay;
  bz = t*bz - az;
  return sqrt(bx*bx + by*by + bz*bz);
}

float getDist2ToLine(float px, float py, float pz, float x1, float y1, float z1, float x2, float y2, float z2) {
  float ax = px - x1, ay = py - y1, az = pz - z1;
  float bx = x2 - x1, by = y2 - y1, bz = z2 - z1;
  float t = (ax*bx + ay*by + az*bz)/(bx*bx + by*by + bz*bz);
  bx = t*bx - ax;
  by = t*by - ay;
  bz = t*bz - az;
  return bx*bx + by*by + bz*bz;
}

PVector getVectorToLineSegment(float px, float py, float pz, float x1, float y1, float z1, float x2, float y2, float z2) {
  float ax = px - x1, ay = py - y1, az = pz - z1;
  float bx = x2 - x1, by = y2 - y1, bz = z2 - z1;
  float t = (ax*bx + ay*by + az*bz)/(bx*bx + by*by + bz*bz);
  float projx = t*bx, projy = t*by, projz = t*bz;
  float bdotproj = bx*projx + by*projy + bz*projz;
  if(bdotproj < 0)
    return new PVector(-ax, -ay, -az);
  if(bx*bx + by*by + bz*bz < projx*projx + projy*projy + projz*projz)
    return new PVector(x2 - px, y2 - py, z2 - pz);
  return new PVector(projx - ax, projy - ay, projz - az);
}

float getDistToLineSegment(float px, float py, float pz, float x1, float y1, float z1, float x2, float y2, float z2) {
  float ax = px - x1, ay = py - y1, az = pz - z1;
  float bx = x2 - x1, by = y2 - y1, bz = z2 - z1;
  float t = (ax*bx + ay*by + az*bz)/(bx*bx + by*by + bz*bz);
  float projx = t*bx, projy = t*by, projz = t*bz;
  float bdotproj = bx*projx + by*projy + bz*projz;
  float dx, dy, dz;
  if(bdotproj < 0) {
    dx = ax;
    dy = ay;
    dz = az;
  }
  else if(bx*bx + by*by < projx*projx + projy*projy) {
    dx = x2 - px;
    dy = y2 - py;
    dz = z2 - pz;
  }
  else {
    dx = projx - ax;
    dy = projy - ay;
    dz = projz - az;
  }
  return sqrt(dx*dx + dy*dy + dz*dz);
}

float getDist2ToLineSegment(float px, float py, float pz, float x1, float y1, float z1, float x2, float y2, float z2) {
  float ax = px - x1, ay = py - y1, az = pz - z1;
  float bx = x2 - x1, by = y2 - y1, bz = z2 - z1;
  float t = (ax*bx + ay*by + az*bz)/(bx*bx + by*by + bz*bz);
  float projx = t*bx, projy = t*by, projz = t*bz;
  float bdotproj = bx*projx + by*projy + bz*projz;
  float dx, dy, dz;
  if(bdotproj < 0) {
    dx = ax;
    dy = ay;
    dz = az;
  }
  else if(bx*bx + by*by < projx*projx + projy*projy) {
    dx = x2 - px;
    dy = y2 - py;
    dz = z2 - pz;
  }
  else {
    dx = projx - ax;
    dy = projy - ay;
    dz = projz - az;
  }
  return dx*dx + dy*dy + dz*dz;
}




