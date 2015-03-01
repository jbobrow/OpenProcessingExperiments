
int i;
size(400, 400);
background(0);
colorMode(RGB, 360);
strokeWeight(4);
translate(width/2, height /2);

for (i=0; i<360; i++) {
  rotate(PI/60); 
  stroke(i, 0, 360-i); 
  line(0, -300, 0, 0);
}

for (i=0; i<180; i++) {
  rotate(PI/30); 
  stroke(360, 360, i ); 
  line(0, -300, 0, 0);
}
rectMode(CENTER);
noStroke();
fill(0);
ellipse(0, 0, 65, 65);

strokeWeight(15);
stroke(0);
noFill();
rect(0, 0, 400, 400);

strokeWeight(5);
line(0, -300, 0, 300);
line(-300, 0, 300, 0);
rotate(PI/4); 
line(0, -300, 0, 300);
line(-300, 0, 300, 0);

strokeWeight(8);
for (i=50; i<=500; i+=50) {
  stroke(0,0,0,i);
  ellipse(0, 0, i, i);
}



