
//Day 13: Almost the end of a line.
//Based on Dragon Tail 3D by Jerome Herr http://www.openprocessing.org/user/28663

int num = 1;
int stepY;
int step= 0;
float sz = 10;
int[] startx = new int[num];
float theta, offset, x, y, starty;
float growthSpeed = 0.2;
float growthDirection = 1;
  
int[] col = new int[num];
  
void setup() {
  size(500, 500);
  for (int i=0; i<num; i++) {
    startx[i] = step*(i+1);
  }
}
  
void draw() {
 
  fill(0,0,50,50);
  noStroke();
  rect(0,0,width,height);
  
  sz = sz + (growthSpeed * growthDirection);
   if(sz > 60 || sz < 10){
    growthDirection *= -1;
  } 
  
   stepY = int(sz-10);
  
  for (int i=0; i<startx.length; i++) {
    for (int x = startx[i]; x<startx[i]+width; x++) {
      offset = (TWO_PI/(80+sz))*x;
      starty =  map(i, 0, startx.length, -stepY, stepY);
      float y = height/2 + starty + map(sin(theta+offset), -1, 1, -stepY, stepY);
      float col = map(x, 10, width, 100, 255);
      fill(col, col-sz/2, 100);
      ellipse(x, y, sz, sz);
    }
  }

  theta += 0.09;
  
}

