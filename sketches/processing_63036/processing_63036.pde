
size(500,500);
 
smooth();
background(250);
 
 strokeWeight(10);
stroke(#c5d8f4);

for (int x = 5; x <=500; x+=20) {
  line(x,0,x,500);
}
 
 strokeWeight(1);
stroke(#ff00f6);
for (int y = 0; y<550; y +=10) {
  for (int x =0; x<=550; x+=10) {
    if ((x%20) ==0) {
      line(x,y, x+10, y-10);
    } else {
      
      line(x, y, x+10, y+10);
    }
  }
}


