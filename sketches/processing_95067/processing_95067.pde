
//Krytstofer Dongjae Kim
//Red Noise
//Trig
float degrees = 360/5;
float distance = 60;
float easing = 0.05;

void setup() {
  size(600, 600);
  smooth();
  frameRate(60);
}
void draw() {
  background(0);
  fill(random(250,255),0,0);
  noStroke();

  //xOffset =cos( radians(degrees)*2) * distance;
  //yOffset =sin( radians(degrees)*2) * distance;
  //xOffset =cos( radians(degrees)*3) * distance;
  //yOffset =sin( radians(degrees)*3) * distance;
  //ellipse(mouseX + xOffset, mouseY+yOffset, 20, 20);
  
for (int a = 1; a <60; a++) {
  for (int i = 1; i <10; i ++ ) {
    float xOffset = cos( radians(degrees)*i) * distance*a/3;
    float yOffset = sin( radians(degrees)*i) * distance*a/3;
    ellipse(mouseX + xOffset, mouseY + yOffset, 6, 6);
    degrees += i*a*0.01;
  }
}

if (mousePressed) {
 distance += 8;
} else {distance = 60;}

}
