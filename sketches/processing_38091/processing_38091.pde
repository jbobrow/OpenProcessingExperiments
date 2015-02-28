
size(300, 300);
ellipseMode(CENTER);
background(0, 0, 0);


noFill();
stroke(239, 83, 242);


for (int x = 0; x<width/30; x++) {//sets up the x variable
  for (int y = 0; y < height/30; y++) {//sets up the y variable 
    for (int ellipseSize = 100; ellipseSize>=20; ellipseSize-=20) {
      ellipse((x*50), (y*50), ellipseSize, ellipseSize);
    }
  }
}


