
//Perlin noise
int n= 200;
int x;
float y=.05;
float nY;

size (600,200);
smooth();
background(#030000);
stroke(#FFFFFF);

for(int i = 1; i<n; i++){
  y+=.02;
  x = i*(width/n);
  nY = noise(y)* height;
  line(x,height,x,nY);
  
}
