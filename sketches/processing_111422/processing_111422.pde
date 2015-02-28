
size(600, 600);
smooth();
background(255);

for (int x=0; x<600; x=x+10){
  for (int y=0; y<600; y=y+10){
  point( x, y);
}
}


stroke(3);
//question: dyagnal doesnt come out
for (int x=0; x<600; x=x+10){
 point(x, x+10);
}

for (int x=600; x<600; x=x-10){
 point(x, x+10);
}


