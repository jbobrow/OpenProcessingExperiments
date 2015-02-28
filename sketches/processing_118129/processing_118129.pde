
size(510,510);
background(240,240,240);
smooth();


stroke(62,26,26);
strokeWeight(10);
line(40,0,40,510);

stroke(62,26,26);
strokeWeight(50);
line(100,0,100,510);

stroke(62,26,26);
strokeWeight(5);
line(140,0,140,510);

stroke(62,26,26);
strokeWeight(10);
line(0,470,510,470);

stroke(62,26,26);
strokeWeight(50);
line(0,410,510,410);

stroke(62,26,26);
strokeWeight(5);
line(0,370,510,370);

strokeWeight(2);
for (int x = 0; x <= width; x +=10) {
  stroke(21+x,218+x,255);
  line(x,510-x,x,510);

  stroke(x,60,160);
  line(x,x,x,0);
}

int i = 0;
int eSize = 25;
while(i < 510) {
  noStroke();
  fill(183,170,170);
  ellipse(510-i,i,eSize,eSize);
  i = i + 80;
}



