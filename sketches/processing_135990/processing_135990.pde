
size (400,400);
 
for (int x = 0; x <= 400; x +=5) {
  line(x,0,x,400);
}

for (int y = 0; y <= 400; y +=5) {
  line(0,y,400,y);
}

noFill();
for (int d = 400; d > 0; d -= 10) {
  strokeWeight(d* 0.01);
  ellipse(200, 200, d, d);       
}


