
//Lines - pattern02


size(500, 500);
smooth();
background(0);
 
 
strokeWeight(1);
 
for (int i=0; i < height; i+=40) {
  strokeWeight(2);
  stroke(255);
 
  if (i < 200) {
    stroke(0, random(15, 25), 0);
  }
  line(0, i, 900, i);
}
 
for (int i=0; i < height; i+=50) {
  stroke(255);
  strokeWeight(2); 
  if (i > 90) { 
    stroke(random(5, 255), 0, 0);
  }
  line(100, i, 300, i);
}
 
for (int i=0; i < height; i+=10) {
  stroke(255);
   strokeWeight(1);
  if (i < 600) { 
    stroke(0, 0, random(55, 25));
  }
  line(300, i, 800, i);
}

for (int i=0; i < height; i+=10) {
  stroke(255);
  strokeWeight(1); 
  if (i > 600) { 
    stroke(random(15, 25), 0, 0);
  }
  line(230, i, 300, i);
}

