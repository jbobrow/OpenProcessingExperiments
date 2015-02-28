
int millisWhenIClicked;
int thingDuration;

void setup() {
  size(400, 400);
  thingDuration=5000;
  millisWhenIClicked=millis();
}
void draw() {
  background(0);
  smooth();
  noStroke();
  int elapsed=millis()-millisWhenIClicked;
  if (elapsed>thingDuration) {
    background(#97EDEC);
    fill(#AEF76B);
    triangle(0, 50, 150, 150, 0, 300);
    fill(255);
    ellipse (30, 110, 50, 50);
    fill(0);
    ellipse(45, 115, 20, 20);
    stroke(0);
    line(0, 150, 150, 150);
    noStroke();
    fill(#FAB8D7);
    arc(30, 150, 30, 60, radians(0), radians(180));  
    stroke(0);
    line(30,150,30,180);
  }
  else {
    background(#97EDEC);
    noStroke();
    fill(#E8B4E5);
    text(elapsed, width/2, height/2);
    float x= map(elapsed, 0, 5000, width, 0);
    ellipse(x, 200, 30, 30);
    arc(x+20, 190, 50, 50, radians(90), radians(180));
    fill(255);
    ellipse(x-5, 197, 10, 10);
    fill(0);
    ellipse(x-5, 197, 5, 5);
    fill(255);
    triangle(150, 80, 130, 110, 110, 80);
    triangle(110, 100, 90, 130, 70, 100);
    triangle(70, 110, 50, 150, 30, 120);
    triangle(50, 100, 10, 170, -10, 100);
    fill(#AEF76B);
    triangle(0, 50, 150, 80, 0, 150);
    fill(255);
    triangle(150, 230, 130, 210, 110, 230);
    triangle(110, 225, 90, 205, 70, 220);
    triangle(70, 220, 50, 197, 30, 210);
    triangle(30, 210, 10, 185, 0, 200);
    fill(#AEF76B);
    triangle(0, 200, 150, 230, 0, 300);
    fill(255);
    ellipse (30, 90, 50, 50);
    fill(0);
    ellipse(45, 95, 20, 20);
  }
}
void mousePressed() {
  millisWhenIClicked=millis();
}

