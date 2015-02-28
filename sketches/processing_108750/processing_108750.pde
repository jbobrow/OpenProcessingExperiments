
/**
 * Iteration. 
 * 
 * Iteration with a "for" structure to construct repetitive forms. 
 */
 
int y;
int num = 14;

size(640, 360);
background(100,100,300);
noStroke();
 
// Draw gray bars 
fill(255,200,10);
y = 170;
for(int i = 0; i < num/3; i++) {
  rect(50, y, 475, 10);
  y+=30;
}

// Gray bars
fill(210,40,10);
y = 60;
for(int i = 0; i < num; i++) {
  rect(405, y, 20, 10);
  y += 20;
}
y = 50;
for(int i = 0; i < num; i++) {
  rect(425, y, 30, 10);
  y += 20;
}
  
// Thin lines
y = 45;
fill(0);
for(int i = 0; i < num-1; i++) {
  rect(120, y, 40, 1);
  y+= 20;
}


