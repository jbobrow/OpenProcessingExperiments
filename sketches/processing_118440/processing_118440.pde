
int eSize=100;

size(510, 510);
background(255);
smooth();
noStroke();

for(int x=0; x<=width; x+=10){
  stroke(x, 200, 200);
  strokeWeight(5);
 line(x, 0, x, 200); 
}
for(int y=0; y<=height; y+=10){
 line(0, y, 200, y); 
}

for(int x=0; x<=width; x+=10){
  stroke(200, x, 230);
  strokeWeight(5);
 line(510-x, 310, 510-x, 510); 
}
for(int y=0; y<=height; y+=10){
 line(310, 510-y, 510, 510-y); 
}



