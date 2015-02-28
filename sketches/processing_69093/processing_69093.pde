
size(400,400);
background(0,0,0);
for(int i = 20; i < 400; i = i + 20) {
  for(int h = 20; h < 400; h = h + 20) {
  for(int j = 20; j < 400; j = j + 20) {
    fill(212,187,88);  
    triangle(i,20,h,30,20,j);
  }
 }
}
