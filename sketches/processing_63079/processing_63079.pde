
size(600,600);
smooth();
noFill();
background(255);
stroke(50,50,50);
 strokeWeight(2);
for (int x = 25; x<=500; x = x+7) {
  for ( float y = 25 ; y<=500; y=y+11)
 
  point(x*.5,y*.8);
}
  strokeWeight(1.5);
stroke(0);
for (int x = 400; x<=700; x = x+7) {
  for ( float y = -1 ; y<=700; y=y+11)
  point(x*.9,y*.9);
}
  strokeWeight(4);
stroke(245,207,17);
for (int x = 100; x<=500; x = x+5) {
  for ( float y = 100 ; y<=500; y=y+10)
  point(x,y);
  
}

  strokeWeight(40);
stroke(0,0,0,25);
for (int x = 0; x<=500; x = x+100) {
  for ( float y = 0 ; y<=600; y=y+100)
  point(x,y);
  
}

