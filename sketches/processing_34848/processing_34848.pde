
size(300,300);
background(#2EF254);
fill(#2EF2E3);
rect(70,10,40,40);
noFill();
fill(#2EF254);
rect(180,10,70,35);
noFill();
strokeWeight(4);
quad(150,100,300,200,150,300,0,200);
strokeWeight(0);
fill(#F22E49);
ellipse(150,100,20,40);
noFill();
line(70,160,70,260);
line(200,160,270,260);
fill(#4B2EF2);
triangle(180,150,180,240,110,240);
noFill();
strokeWeight(2);
stroke(255,0,0);
arc(160,80,220,40,PI,TWO_PI);
noStroke();
colorMode(RGB,90);
for (int i=40; i<100;i++) {
  for (int j=40;j<100;j++) {
    stroke (i,j,0);
    point (i,j);
  }
}








