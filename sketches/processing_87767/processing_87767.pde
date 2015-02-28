

size(500, 500);
smooth();
background(50);
 
//for (init; test; update);
fill(0, 76, 20, 175);
 
for (int y=100; y<=width; y+=2) {
  for (int x=90; x<=500; x+=100) {
    line(x/2, y/2, x+2, y+2);
 
  }
}
 
for (int y=0; y<=400; y+=80) {
  for (int x=2; x<=height; x+=10) {
    line(x, y+2, 250, 1000);
    stroke(200);
    strokeWeight(1);
     
  }
}
 
 
for(int x=0; x<=800; x+=5) {
  
    strokeWeight(1);
    line (600,x+6, 800,x*2);
    
  }


