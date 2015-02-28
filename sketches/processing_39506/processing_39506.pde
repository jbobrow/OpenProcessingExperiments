
// a square sketch produces round circles
size(400, 400);
// smooth the lines out
smooth();
// background color red
background(0);
// remove outlines
noStroke();
 
 
int number = 31;

ellipseMode(CORNER);
 
for (int i = 0; i<number; i++) {
  for (int j = 0; j<number; j++) {
   
    if ((i+j) % 2 == 0) {
      fill(cos(i)*number + sin(j)*number, cos(number), cos(i)*number*sin(j)*number); 
    }
    else {
      fill((cos(i)*number*sin(j)*number)%255); 
    }
    ellipse(i*width/number, j*height/number, width/number, height/number);
  }
}


