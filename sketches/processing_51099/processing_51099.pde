
size(800, 800);
smooth();
background(0);


strokeWeight(1);

for (int i=0; i < height; i+=10) {
  strokeWeight(5);
  stroke(255);

  if (i < 400) { 
    stroke(0, random(155, 255), 0);
  }
  line(0, i, 100, i);
}

for (int i=0; i < height; i+=10) {
  stroke(255);
  strokeWeight(2);  
  if (i > 400) {  
    stroke(random(155, 255), 0, 0);
  }
  line(100, i, 300, i);
}

for (int i=0; i < height; i+=10) {
  stroke(255);
   strokeWeight(1);
  if (i < 400) {  
    stroke(0, 0, random(155, 255));
  }
  line(300, i, 800, i);
}


