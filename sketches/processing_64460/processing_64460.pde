
float x = 0;
size (500,500);
while(x <width) {
  point (x, height*noise(x));
  x= x + 0.002;
  
}

