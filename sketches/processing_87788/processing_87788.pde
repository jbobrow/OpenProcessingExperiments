
size (800, 800);
background(255);
smooth();
size(800, 800);


for (int i =0; i<width; i=i+10) {
  for (int j =0; j<height; j=j+10) {

    noStroke();        
    stroke(212, 35, 193);
    line(i, j, i-50, j+50);

    stroke(212, 41, 35);
    line(i, j, i-30, j-30);
    
    noStroke();
    fill(0, 235, 188, 255);
    rect(i, j, 5, 5);
  }
}



