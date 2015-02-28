

size(500, 500);
 
strokeWeight(1);

 
 
int a = 20;
 
for (int x = -10; x<width; x+=a) {
  beginShape();
  for (int y=0; y<height; y=y+a) {
    float r = map(x, 0, width, 0,255);
    fill(255,r,0,100);
 
    vertex(x, y);
    vertex(x-a,y+a);
    vertex(x,y+a);
    vertex(x-a,y);
    
    
  }
  endShape();
}

/*
int yen = 20;
for (int y=0;y<height+10; y+=yen) {
  beginShape();
  for (int x=0; x<width+10; x=x+yen) {
    vertex (x, y);
    vertex(x+=yen, y+yen);
  }
  endShape();
}

*/


