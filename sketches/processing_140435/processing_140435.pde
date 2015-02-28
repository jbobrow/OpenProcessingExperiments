
int h =4;
int floorNum = 100/h;

size(300, 1000);
background(0);
stroke(255);

for (int i=0;i<floorNum;i++) {
  if (i!=11&i!=23) {
    float delta = width/(4*(i+2));
    float altitudeDown = (floorNum-i)*h*10;
    float altitudeUp   = (floorNum-i-1)*h*10;

    for (float j=0; j<width; j += delta ) {
      line(j+.5*delta, altitudeUp, j+.5*delta, altitudeDown);
    }
  }
}
save("drawing.jpg");
