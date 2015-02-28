
background(240);
size(600, 600);
strokeWeight(.5);
smooth();
noFill();

for (int i=1; i<600; i=i+12){
  for (int j=1; j<600; j=j+40){
stroke(15,99,170, 210);

  ellipse(i*2,j/2,i,j);

  }
}



