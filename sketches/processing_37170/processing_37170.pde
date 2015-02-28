

                
                
size(300,300);
background (255);
for(int x=0; x<300; x+=30) {
  for (int y=0; y<300; y+=30) {
    fill(255-(y-20));
    triangle(x,y,x+20,y,x+10,y+20);
  }
}
