
size(500, 500);
background(255);
colorMode(RGB,100);


for (int i = 0; i < 500; i = i+5) {
  for (int j = 0; j < 500; j = j+5){ 
      line(0, j, 500, i);
      stroke(i, j, 100);
}}



for (int i = 0; i < 500; i = i+10) {
  strokeWeight(5);
  line(i, 0, i, 500);
}


