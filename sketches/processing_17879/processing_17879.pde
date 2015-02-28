
size(250, 250);
background(#312440);
smooth();

for(int c=0; c<=350; c+=20){
  fill(134, 95, 148, 20);
  stroke(245, 148, 115);
  ellipse(125, 125, c, c);
}

noStroke();
for(int y=0; y<=height; y+=40){
for (int x=0; x<=width; x+=40){
  fill(255, 226, 182, 50);
  stroke(255, 226, 182, 140);
  rect(x,y,20,20);
  rect(x-10,y+10,20,20);
}
}



