
size(250, 250);
background(0);
smooth();
noFill();

for(int x = 0; x < 250; x += 50){
  for(int y = 0; y < 250; y += 50){
    stroke(#C700FF, 200);
    strokeWeight(0.2);
    ellipse(125, 125, x, y);}
}//magenta circles (thin)


for(int x = 0; x < 250; x += 50){
  for(int y = 0; y < 250; y += 50){
    stroke(#3403FF, 200);
    strokeWeight(0.2);
    ellipse(128, 128, x, y);}
}//dark purple circles (thin)


for(int x = 0; x <270; x += 5){
  for(int y = 0; y <270; y += 5){
    stroke(#FF7C00, 50);
    strokeWeight(1.5);
    point(x, y);}}//colored dots

for(int x = 0; x <270; x += 3){
  for(int y = 0; y <270; y += 3){
    stroke(#FFEA00, 50);
    strokeWeight(1.5);
    point(x, y);}}//colored dots
    


    




