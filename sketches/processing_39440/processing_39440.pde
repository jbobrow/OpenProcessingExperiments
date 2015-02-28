
void setup() {
  size(700, 400);
}

void draw() {
  background(255, 230, 203);
  for (int a=0;a<width;a=a+10) {
    for (int b=0;b<height;b=b+20) {
      noStroke();
      smooth();
      fill(random(255), 0, 0, random(100));
      ellipse(random(a), random(b), random(10), random(10));
      fill(0, 0, random(255), random(90));
      ellipse(random(a+50), random(b+50), random(10), random(10));
      fill(0, random(255), 0, random(70));
      rect(random(a+5000), random(b+200), random(50), random(50));  
      fill(random(250), random(255), 0, random(70));
      rect(random(a+6000), random(a+6000), random(100), random(100));
      fill(random(255), random(255), random(255), random(20));
      triangle(random(a+7000), random(b+1000), random(a+4000), random(b+8000), 
      random(a+7000), random(b+400));
    }
  }
}
          
