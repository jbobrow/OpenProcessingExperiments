
size (500,500);
background (255);
smooth();

line(20, 20, 20, height-20);

for (int i = 20; i < width-20; i+=20 ){
  line (20, i, width-i, 20);
}              
