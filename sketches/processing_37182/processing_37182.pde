
size (460, 460);
smooth();
background(255);
float triangleWidth= 30;

for (float i=0; i <450; i= i+(1.5)*triangleWidth) {
  for (float j=0; j<450; j=j + (1.5)*triangleWidth) {
    colorMode (RGB, height);
    fill (height-j);

    triangle (10+i, 10+j, 10+triangleWidth+i, 10+j, ((20+triangleWidth)/2)+i, 40+j);
  }
}

                
                
