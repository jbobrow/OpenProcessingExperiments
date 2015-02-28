
size (500, 500);
smooth();
background(255);


//first repeating point
strokeWeight(5);
for (int x=0; x<=width; x+=1) {
  for (int y=0; y<=height; y+=1) {
    point(x, y);


    float r=map(x, 0, width, 0, 255);
    float b=map(y, 0, width, 0, 255);
    stroke(0, b, r);
  }
}


//second repeating points
strokeWeight(20);
for (int x=0; x<=width; x+=10) {
  for (int y=0; y<=height; y+=10) {
    point(x, y);


    float r=map(x, 0, width, 0, 255);
    float b=map(y, 0, width, 0, 255);
    stroke(0, b, r, 50);
  }
}


//third repeating points
strokeWeight(40);
for (int x=0; x<=width; x+=20) {
  for (int y=0; y<=height; y+=20) {
    point(x, y);

    /*
    float r=map(x, 0, width, 0, 255);
     float b=map(y, 0, width, 0, 255);
     
     stroke(0, b, r, 25);
     */
  }
}



