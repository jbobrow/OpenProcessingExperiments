
//rectangels connected to the bottom
//right corner by lines

size(300, 300);
background(150);
for (int i = 0; i <  300; i= i+20) {
  for (int j = 0; j <  300; j = j+20) {
    fill(80, 200, 230);
    rect(i, j, 10, 10);
    line(i+10, j+10, width, height);
  }
}







