
size(800, 800);
smooth();
background(200);

//for (init; test; update);
fill(0, 76, 20, 175);

for (int y=100; y<=width; y+=2) {
  for (int x=90; x<=500; x+=100) {
    line(x/2, y/2, x, y);

  }
}

for (int y=400; y<=width; y+=2) {
  for (int x=400; x<=height; x+=70) {
    line(x, y, 400, 400);
    
  }
}


for(int x=0; x<=500; x+=5) {
  if ( (x%10) ==0){
    strokeWeight(2);
  line(0,x,600,x);
  }else {
    strokeWeight(1);
    line (600,x, 800,x*2);
  }
}





