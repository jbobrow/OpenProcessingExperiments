
/* CREATIVE PROGRAMMING
AUTHOR: ROSS NEUGEBOREN
FEB 5, 2015
ITERATIVE X/Y
*/
void setup() {
  size(500,500);
  noSmooth();
}
void draw() {
  for (int x = 0; x <= 50; x++) { //x traveller 
    for (int i = 0; i <= 50; i++) { //y traveller
    stroke(0);
    ellipse((x*10),(i*10),10,10);
    }
    
  }
  if (mousePressed) {
  for (int i = 0; i <= 50; i++) {
    stroke(#F70000);
  //  fill(#F70000);
    ellipse((i*10),(i*10),10,10);
    ellipse((i*10),(500-(i*10)),10,10);
  }
  }
}


