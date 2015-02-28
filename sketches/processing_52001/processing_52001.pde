

size(900,700);
smooth();
noFill();
background(255);

for(int d=02; d<=width; d=d+5){
  rectMode(CENTER);
  stroke(255*d/height);
  rect(width/2, height/2, d,d);
  for(int h=05; h<height; h=h+d){
  ellipse(width/2,height/2,d,h);
  }
}           
