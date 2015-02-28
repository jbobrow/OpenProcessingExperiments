
size(250, 250);
background(0);
 
smooth();
 
noFill();
 
strokeWeight(1);
 
stroke(#0267E0, 150);
 
//top left
for(int ex = 10; ex < 150; ex += 20){
  for(int ey = 10; ey < 150; ey += 20){
    triangle(32, 32,0,0, ex, ey);}
}
 
for(int ex = 10; ex < 150; ex += 20){
  for(int ey = 10; ey < 150; ey += 20){
    triangle(125, 125,0,0, ex, ey);}
}

for(int ex = 10; ex < 250; ex += 25){
  for(int ey = 10; ey < 250; ey += 25){
    triangle(160, 160,0,0, ex, ey);}
}

for(int ex = 10; ex < 280; ex += 30){
  for(int ey = 10; ey < 280; ey += 30){
    triangle(210, 210,0,0, ex, ey);}
}



