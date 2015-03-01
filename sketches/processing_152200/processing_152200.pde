

void setup() {
  size(500, 500);
  background(0);
  noStroke();
  for (int i=0;i<50;i++) {
    for (int j=0;j<50;j++) {
      boolean b = boolean(j%2);
      if(b)fill(random(255), random(255), random(255),random(255)); 
      else fill(random(255));
      rect(i*10, j*10, random(20), random(20));
    }
  }
}




