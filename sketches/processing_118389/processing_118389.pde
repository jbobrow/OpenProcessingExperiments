
int eSize = 3;

size(510, 510);
background(255);
strokeWeight(2);

noStroke();


for (int x = 0; x <= width; x +=1) {
  stroke(x, 0, 255);
  line(width, 0, x, height);
  
  
}

for (int x = 0; x <= 510; x +=2) {
  stroke(x, 255, 255, 127); //color
  line(x, 0, x, height);
 
  fill(170, 202, 255);
  rect(0, 0, 50, 50);
  
  fill(125, 171, 247);
  rect(60, 60, 50, 50);
  
  fill(92, 150, 247);
  rect(120,120, 50, 50);
  
  fill(80, 142, 247);
  rect(180, 180, 50, 50);
  
  fill(54, 124, 242);
  rect(240, 240, 50, 50);
  
  fill(0, 94, 252);
  rect(300, 300, 50, 50);
  
  fill(0, 81, 216);
  rect(360, 360, 50, 50);
  
  fill(2, 68, 180);
  rect(420, 420, 50, 50);
  
  fill(0, 55, 147);
  rect(480, 480, 50, 50);
  
}





