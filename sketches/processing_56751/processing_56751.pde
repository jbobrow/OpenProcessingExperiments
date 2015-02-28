
//for loop example
void setup () {
size(400, 400); 
smooth(); 
}

void draw() {
background (255);
strokeWeight(2); 
stroke (20, 200, 60);
for (int i = 30; i < 400; i += 20) {
  float mx = mouseX/10;
  float offsetA = random(-mx, mx);
  float offsetB = random(-mx,mx);
  fill(150, 60, 190);
  rect(i+offsetA, 0, i*1.5+offsetB, i);
}
}


