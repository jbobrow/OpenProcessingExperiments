
size(500, 500);
background(255);

noStroke();
smooth();
translate(width/2, height/2);
for (int i=0;i<360;i+=30) {
  rotate(radians(30));
    fill(#FF0AA6, 150);
  ellipse(20, 20, 20, 20);
}



