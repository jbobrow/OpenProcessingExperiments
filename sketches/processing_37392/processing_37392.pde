
// compressed to a single for() loop
background(150,40,50);
size(400,400);

noFill();
for (int x=10; x<=height*2; x+=50) {
  ellipse(width/2, height/2, x, x);
}


for (int x=0; x<=height/2; x+=10) {
  rect(0, 0, x, x);
}

for (int x=0; x<=height/2; x+=10) {
  rect(width/2,height/2, x, x);
}


  line(0,0,width, height);

