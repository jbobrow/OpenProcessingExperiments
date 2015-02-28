
void setup() {  //setup function called initially, only once
  s = 14;    //cell size
  sX = 40;   //cells per row
  sY = 40;   // cells per colume
  
  size(s * sX, s * sY);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  cX = int(sX/2);    //pos X counter
  cY = int(sY/2);    //pos Y counter
  col = random(255);   //cell color
}

void draw() {  //draw function loops 

  col += random(-13,13);    //sets new color
  if (col < 0) col += 255;
  if (col > 255) col -= 255;

  noStroke();
  fill(col,150,255,60);
  
  rect(cX * s, cY * s, s, s); //draws
  
  if (int(random(2)) == 0) {
    cX += int(random(-2,2));
    if (cX < 0) cX += sX;
    if (cX > sX) cX -= sX;
  } else {
    cY += int(random(-2,2));
    if (cY < 0) cY += sY;
    if (cY > sY) cY -= sY
  }
}
