
size(500,400);
background(255,255,0);

fill(0,255,255);

translate(width/2,height/2);
rotate(radians(330));
for (int i=0;i<=360;i+=20) {
  rotate(radians(30));
  translate(i%30,i%30);
  scale(.95);
  fill(0,i%255,i%196);
  rect(0,0,100,100);

}


