
float a=20;

void setup() {
  size(500, 500);
  smooth();
}




void draw() {
  fill(0);
  rect(0, 0, width, height);


  for (float j=a; j<=height; j+=20) {
    for (float h=a+5; h>=0 && h<=width; h++) {
      noStroke();
      fill(random(j, h), random(j, 200), random(h, 150), 100);
      ellipse(h, j, 10, 10);
    }
  }


  for (float i=10; i<=1000; i+=50) {
    noFill();
    strokeWeight(random(5,20));
    stroke(random(i, 255), random(i, 200), random(i, 150), 100);
    bezier(0, 0, i-100, height/2-100, i/4, height/2+height/4, i-300, height);
  }
  
   for (float j=a; j<=height; j+=20) {
    for (float h=a+5; h>=0 && h<=width; h++) {
      noStroke();
      fill(random(j, h), random(j, 200), random(h, 150), 50);
      triangle(h, j, 10, 10, 0,0);
    }
  }
}



