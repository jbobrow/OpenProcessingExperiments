
size(600,600);
background(50);
smooth();

for (int x = 0; x <= 600; x +=10) {
  for (int y= 20; y<= 600; y +=5) {
    stroke(255);
    point(x,y);
    
    stroke(242, 242, 27);
    point(x*3, y-3);
    
    stroke(110, 240, 233);
    point(x/4, y+4);
    
    stroke(242, 242, 27);
    point(x, y/15);
    point(x/30, y+20);
    
    stroke(110, 240, 128);
    point(x/2, y+160);
    point(x/5, y+250);
    
    stroke(145, 248, 255);
    point(x*7, y/4);
    
  }
}









