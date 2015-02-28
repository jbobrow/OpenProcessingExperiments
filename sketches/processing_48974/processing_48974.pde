
//This confetti program was created by accident; when playing around with ellipses
//If you change the 3 counter values; different patterns will emerge.

float r = 0.05;
float x = 0;

void setup() {
  size(400, 400);
  //colorMode(HSB);
  background(224,250,81);
  smooth();
  stroke(100,255);
//noStroke();
}

void draw() {
  ellipseMode(CORNER);
    float y = 0;
    while (y < 8){
      rotate(r);
      //small ellipse
      fill(random(255),random(255), random(0));
      ellipse(100 + x, 30, 30, 20);
      
      rotate(r);
      //big ellipse
      fill(random(255),random(255),random(0));
      ellipse(100, 25, 69, 85);
    //distance spread small and travelling speed big ellipse;
    y = y + 1;
    println("x " + x);
    println("y"+ y);
    }
   //travelling speed small ellipse
   x = x + 0.5;
   //influences small and big ellipses
r = r + 0.02;
} 

