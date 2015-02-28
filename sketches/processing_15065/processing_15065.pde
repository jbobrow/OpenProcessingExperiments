
void setup() {
  size(200,200);
}
void draw() {
  for(int a=0; a<250; a=a+10) {
    for(int b=0; b<250; b=b+10) {  
      fill(0);
      noStroke();
      ellipse(a,b,5,5);
      fill(random(255),random(255),random(255),random(255));
      rect(50,50,100,100);
    }
  }
}

