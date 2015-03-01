
size(600,500);
background(255);
smooth();
translate(150,250);
strokeWeight(2);
line(0,250,250,250);
for(int i=0;i<20;i++){
  fill(50,255-i*8,90+i,50);
  scale(1.2);
  ellipse(5,0,20,20);
}



