
int s = 2;    //cell size
int sX = 400;   //cells per row
int sY = 400;   // cells per colume
int fX = 200;
int fY = 200;
int v = 300;
int u = 500;        //number of moving cells
  
int[] cX = new int[u];
Int[] cY = new int[u];
Int[] col = new float[u];

int[] bX = new int[u];
Int[] bY = new int[u];
Int[] vol = new float[u];
  
void setup() {  //setup function called initially, only once

  
  size(s * sX, s * sY);
  background(0);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  


  for (int i = 0; i < u; i++) {
    cX[i] = int(sX/2);           //pos X counter
    cY[i] = int(sY/2);           //pos Y counter
    col[i] +=(200,255);        //cell color
    
  
  }
}

void draw() {  //draw function loops 
   
  rect(cX[1]*s, cY[2]*s, s, s);
   
  for (int i = 0; i < u; i++) {
    
    if (col[i] < 0) col[i] += 255;
    if (col[i] > 255) col[i] -= 255;

    noStroke();
    fill(col[i],150+random(50),255,60);
  
    rect(cX[i] * s, cY[i] * s, s, s); //draws
  
  
    if (int(random(2)) == 0) {  //sets new pos
      cX[i] += int(random(-2,2));
      if (cX[i] < 0) cX[i] += sX;
      if (cX[i] > sX) cX[i] -= sX;
    } else {
      cY[i] += int(random(-2,2));
      if (cY[i] < 0) cY[i] += sY;
      if (cY[i] > sY) cY[i] -= sY;
    }
    {  //draw function loops 
   
   int sX = fX;
   int sY = fY;
   int int u = v;
   
   int col = vol;
   int cX = bX;
   int cY = bY;
   
  rect(cX[1]*s, cY[2]*s, s, s);
   
  for (int i = 0; i < u; i++) {
    
    if (col[i] < 0) col[i] += 255;
    if (col[i] > 255) col[i] -= 255;

    noStroke();
    fill(col[i],150+random(50),255,60);
  
    rect(cX[i] * s, cY[i] * s, s, s); //draws
  
  
    if (int(random(2)) == 0) {  //sets new pos
      cX[i] += int(random(-2,2));
      if (cX[i] < 0) cX[i] += sX;
      if (cX[i] > sX) cX[i] -= sX;
    } else {
      cY[i] += int(random(-2,2));
      if (cY[i] < 0) cY[i] += sY;
      if (cY[i] > sY) cY[i] -= sY;
    }
  }
}
