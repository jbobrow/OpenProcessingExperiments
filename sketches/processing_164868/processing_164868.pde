

size(400, 100);

background(#e0ffff);

smooth();
noFill();
stroke(#20b2aa);
strokeWeight(5);

for(int i = 0; i < 400; i = i + 100){
  
  bezier(i, 50, i + 50, 0, i + 75, 0, i + 80, 25);
  bezier(i + 80, 25, i + 50, 10, i + 55, 90, i + 100, 50);
}


