
size(800, 800);
smooth();
background(255);
fill(200, 100, 150, 20);
noStroke();
int d = width;

for (int a=d/2; a<=width; a=a+15) {  
  fill(200, 100, 150, 20);
  rect(0, 0, a, d);
  for (int c=d/100; c<=height; c=c+15) {
    noFill();
    stroke(0);
    strokeWeight(2);
    rectMode(CENTER);
    rect(width/2, height/2, c,a);
  }
}
    
                
