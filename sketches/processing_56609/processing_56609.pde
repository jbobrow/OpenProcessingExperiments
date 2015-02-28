
void setup() {
  size(600,300);
  smooth();
}

void draw() {
  background(204);
  fill(121,250,167);
  
  for (int i = 250; i < 700; i += 50) {
  float mx = mouseX/40;
  
  float offsetA = random(-mx,mx);
  float offsetB = random(-mx,mx);
  float offsetC = random(-mx,mx-50);
  rect(i+offsetA,0,i-offsetB,50);
  rect(i-offsetC,50,i-offsetA,50);
  rect(i-offsetA,100,i-offsetB,50);
  rect(i+offsetC,150,i-offsetB,50);
  fill(8,82,206); }

  }

