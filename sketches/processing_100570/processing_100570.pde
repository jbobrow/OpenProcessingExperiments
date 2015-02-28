
int x;
int y;
int scale = 2;
int avg;

size(640, 500);
background(0);
noStroke();

for(int i = 0; i<width/scale; i++){
  for(int j = 0; j<height/scale; j++){
    x = i*scale;
    y = j*scale;
    avg = (x+y)/2;
    fill(x, y, avg);
    rect(x, y, x+scale, y+scale);
  }
}
