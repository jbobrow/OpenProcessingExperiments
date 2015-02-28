
size(600,600);
background(150);
stroke(0);
noFill();


for (float i = 1.0; i < width; i *= 1.1){
  line(0,i,i,i*2);
  strokeWeight(5);
  stroke(58,222,201);
}

for (float i = 1.0; i < width; i *= 1.1){
  line(i,0,i,i*2);
  strokeWeight(5);
  stroke(10);
}

for (float i = 1.0; i < width; i *= 1.1){
  line(0,i,i*2,i);
  strokeWeight(5);
  stroke(58,222,201);
}

for (float i = 1.0; i < width; i *= 1.1){
  line(i,0,i*2,i);
  strokeWeight(5);
  stroke(10);
 
}


