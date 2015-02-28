

size(250,250);
smooth();
background (255);


noStroke();
for (int a=5; a<300; a+=20) {
  fill (#004B4A,10);
  //dark blue
  quad(127,127,a,a,a,800,0,120);
}
for (int b=100; b<240; b+=90) {
  //blue
  fill(#5DD6D5,100);
  quad(127,127,200,b,b,280,0,20);
}

for (int c=200; c<240; c+=800) {
  //yellow
  fill(#ACF511,80);
  quad(127,127,20,c,0,0,20,1000);

  fill(#620B74,200);
  quad(127,127,20,c,c,0,20,1000);

  stroke(0);
  strokeWeight(1);
  line(127,127,250,-90);
  fill(127);
  noStroke();
  ellipse(127,127,10,10);
}

