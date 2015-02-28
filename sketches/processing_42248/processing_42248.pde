
size(300, 300);
smooth();
background(0);
strokeWeight(1);

for (int c=0; c <= 150; c += 10)
{
  stroke(255, c, 0);
  line(c, 150, 150, 150 - c); //alto sx
  line(c + 150, 150, 150, c); //alto dx
  line(c, 150, 150, 150 + c); //basso sx
  line(c + 150, 150, 150, 300 - c); //basso dx
}

for (int i=0; i < 300; i += 10){
  stroke(i, 83, 13);
  line(0, i, i, 300); //basso sx
  line(300, i, i, 0); //alto dx
  line(i, 300, 300, 300 - i); //basso dx
  line(0, i, 300 - i, 0); //alto sx
}



