
// Practice: cross product (1)

void setup(){
  size(600,600); 
}

void draw(){
 
  //triangle origin
  float x = random(0, width);
  float y = random(0, height);
 
 
  // vector r =[rx ry] for one side
  float rx = random(0, width);
  float ry = random(0, height);
 
  // vector s =[sx sy] for the otherside
  float sx = random(0, width);
  float sy = random(0, height);
 
  //compute tri area size(size of cross product/2)
  float triSz = abs(rx*sy -ry*sx) /2;
  
  float brightness = map(triSz, 0, 60000, 0, 255);
  
  fill(brightness, 0, 0);
  triangle(x,y, x+rx, y+ry, x+sx, y+sy);
  
  
  
}
