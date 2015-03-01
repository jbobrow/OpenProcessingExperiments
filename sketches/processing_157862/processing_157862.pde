
int counter;

void setup() {  //setup function called initially, only once
  s = 20;    //cell size
  sX = 22;   //cells per row
  sY = 22;   // cells per colume
  
  
  size(s * sX, s * sY);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  cX = 0;    //pos X counter
  cY = 0;    //pos Y counter
  col = random(255);   //cell color
  ver = false;         //derection
}

void draw() {  //draw function loops 

  col += random(-25,25);    //sets new color
  if (col < 0) col += 255;
  if (col > 255) col -= 255;

  noStroke();
  fill(col,200,255,110);
  
  rect(cX * s, cY * s, s*2, s*2); //draws
  
  if (ver == false) {   //set X and Y to new pos and if its done
    cX++;
    if (cX == sX) {
      cX = 0;
      cY++;
      if (cY == sY) {
        ver = true;
        cX = 0;
        cY = 0;
      }
    }
  } else {
    cY++;  
    if (cY == sY) {
      cY = 0;
      cX++;
      if (cX == sX) {
        ver = false;
        cX = 0;
        cY = 0;
      }
    }
  }
}
