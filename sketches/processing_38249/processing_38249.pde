
size(400, 400);
smooth();  
background(0);
noFill();
strokeWeight(.5);

for (int x=0;x<width;x+=20) {
  for (int y=0;y<height;y+=20) {
    ellipse(width/2, height/2, x, y); //radius of ellipses based on x,y values
    stroke(x, x, y); //color dependent on the x and y values
  }
}


