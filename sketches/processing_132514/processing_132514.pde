
size(800, 500);
colorMode(RGB, 100);
smooth();
noStroke();
background(15);

//red and purple triangles
for (int i = 0; i < 1000; i++) {
  float c1 = random(height);    //first corner on one side of the screen
  float c2 = c1 + random(30);    //other corners on the opposite side
  float c3 = c1 - random(30);    //within 40 pixels
  float r = random(50, 90);    //red
  float g = random(20);    //green
  float b = map(c1, 0, height, 100, 0);//blue is mapped to the y axis via c1 
  float a_h = map(c1, 0, height, 0, 93);//height component of alpha (fades out at bottom)
  float a_i = map(i, 0, 1000, 100, 20);//index component of alpha(layers fade out)
  float alph = a_i - a_h; 
  fill(r, g, b, alph);
  if (i % 2 == 0) {    //every other triangle faces the opposite direction
    triangle(0, c1, width, c2, width, c3);
  }
  else {
    triangle(width, c1, 0, c2, 0, c3);
  }
}

//black ellipses to add texture
fill(0, 2);
for (int i = 0; i < 2000; i++) {
  float x = random(width);
  float y = random(height);
  ellipse(x, y, 200, 20);//they are long so they help chop up the triangles
}

//darkening the top
for (int i = 0; i < 2000; i++) {
  float x = random(-90, width + 90);
  float y = random(height/3);
  float f = map(y, 0, height/8, 5, 0);//mapping alpha to y for a fade out
  fill(int(random(0, 30)), 0, int(random(5, 40)), f);
  ellipse(x, y, 150, 30);   
}

//some happy little hills on the bottom
for (int i = 0; i < 200; i++) {
  float x = random(-90, width + 90);
  float y = random(height - 30, height + 20);
  float f = map(y, 0, height/8, 0, 2);//mapping alpha to y for a fade out
  fill(int(random(0, 10)), 5, 0, f);
  ellipse(x, y, random(150, 180), 30);   
}

//stars
for(int i = 0; i < 800; i++) {
  strokeWeight(int(random(0.5, 2)));
  float y = random(height/3);
  float alpha = random(height/3) - y/1.1;//fade out from top to bottom
  stroke(100, alpha-20);
  point(random(width), y);
}
