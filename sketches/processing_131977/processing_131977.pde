
size(400,400);
noStroke();
fill(240,128,128);
rect(0,0,200,200);

noStroke();
fill(190,190,190);
rect(200,0,200,200);

noStroke();
fill(0);
rect(0,200,200,200);
noStroke();
fill(255);
rect(200,200,200,200);

stroke(190,190,190,190);
for(int i = 0; i < 200; i += 70) {
  for(int j = 0; j < 200; j += 5) {
    line(10,i, j+10,200);

   }
}

stroke(0);
for(int i=200; i<400; i+=70){
  for(int j=200; j<400; j+=5){
  line(200,200, j+10,i);
  }
}

