
size (800, 800);
background(255);
smooth();
size(800, 800);


for (int i =0; i<width; i=i+50) {
  for (int j =0; j<height; j=j+50) {

    noStroke();        
    stroke(212, 35, 193);
    line(i, j, i-50, j+50);

    stroke(212, 41, 35);
    strokeWeight(2);
    line(i, j, i+80, j);
    
    noStroke();
    fill(0, 235, 188, 255);
    rect(i, j, 15, 15);
  }
}



