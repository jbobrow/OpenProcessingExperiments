
size(640,480);
  smooth();

for (int x = 10; x < 640; x+=30)  {
 for (int y = 10; y < 640; y+=30){
   
    line(x, y, x + 30, y + 80);
  }
}
