
size(200, 200);
smooth();

background(195);
noFill(); 

for (int i=1; i<16; i++) {
  float y = i*(height/16);
  stroke(i*16-1);
  bezier(width, y, width/3, y, width*(2/3), height-y, 0, height-y);
}
