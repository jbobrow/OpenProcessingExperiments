
size(300, 800);
background(255);
smooth();

//dots
strokeWeight(9);
stroke(0);
for (int y = 0; y <= height; y += 20) {
  for (int x = 0; x <= width; x +=20) {
    noFill();
    ellipse(x, y, 10, 10);
  }
}

//bow
strokeWeight(1);
stroke(2);
noFill();
for (int i=-800; i<width; i=i+2)
{
  ellipse((width/2)+(i*1), height/2, i+2, i+10);
}

//side cone
strokeWeight(1);
stroke(2);
noFill();
for (int i=-800; i<width; i=i+2)
{
  ellipse((width/4)+(i*1), height/4, i+4, i+100);
}

//diamond
strokeWeight(1);
stroke(2,30);
noFill();
for (int i=-800; i<=height; i=i+2)
{
  ellipse((width/2), height/2, i+4, i+900);
}


