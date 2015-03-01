
// Day 14, finally the end of the line.
//based on Dragon Tail 3D by Jerome Herr 

int num = 1;
int stepY = 12;
int step=200;
float sz = 10;
int[] startx = new int[num];
float theta, offset, x, y, starty;
float growthSpeed = 0.2;
float growthDirection = 1;
  
int[] col = new int[num];
  
void setup() {
  size(500, 500);
  //colorMode(HSB, 360, 100, 100);
  for (int i=0; i<num; i++) {
    startx[i] = step*(i+1);
    //col[i] = (360/num)*i;
  }
}
  
void draw() {
  fill(0,0,40,25);
  noStroke();
  rect(0,0,width,height);
  
  sz = sz + (growthSpeed * growthDirection);
   if(sz > 60 || sz < 10){
    growthDirection *= -1;
  } 
  
  for (int i=0; i<startx.length; i++) {
    for (int x = startx[i]; x<startx[i]+width; x++) {
      offset = (TWO_PI/width)*x;
      starty =  map(i, 0, startx.length, -stepY, stepY);
      float y = height/2 + starty + map(sin(theta+offset), -1, 1, -stepY, stepY);
      float col = map(x, 100, width, 0, 255);
      fill(col, col-10-sz, sz+10);
      ellipse(x, y, sz, sz);
    }
  }

  theta += 0.05;

}

