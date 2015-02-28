
size(200, 200);
background(255);
strokeWeight(8);
smooth();
 
float space = width/7;
 
for (float x = space; x <= width-space; x = x + space) {
 
  for (float y = space; y <= height-space; y = y + space)
 
    point(x, y);
 
}


