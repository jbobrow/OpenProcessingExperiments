
//Control 2 - Repetition
//Exercise #2
/*2. Draw a dense pattern by embedding two for structures.*/

size (400,400);


for (int d = 800; d > 0; d -= 10) {

strokeWeight(d*0.01);
  ellipse(200, 200, d, d);
}

for (int y = 10; y<400; y *=2) {
  strokeWeight(y* 0.1);
  line (0,y,400,y);
}

for (int x = 10; x<400; x *=2) {
  strokeWeight(x* 0.1);
  line (x,0,x,400);
}





