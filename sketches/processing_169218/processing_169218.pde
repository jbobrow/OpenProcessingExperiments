
/* This is a good experience to understand the time dynamics and
the rule that the last shape stay over the former ones.
battle of blues vs green*/

float a=0;

void setup() {
  background(0);
  size(400, 400);
}

void draw() {
  fill(0,255,0);
  ellipse(20+a, 20+a, 40, 40);
  fill(0,255,0);
  ellipse(60+a, 20+a, 40, 40);
  fill(0,255,0);
  ellipse(100+a, 20+a, 40, 40);
  fill(0,255,0);
  ellipse(140+a, 20+a, 40, 40);
  fill(0,255,0);
  ellipse(180+a, 20+a, 40, 40);
  fill(0,255,0);
  ellipse(20+a, 60+a, 40, 40);
  fill(0,255,0);
  ellipse(20+a, 100+a, 40, 40);
  fill(0,255,0);
  ellipse(20+a, 140+a, 40, 40);
  fill(0,255,0);
  ellipse(20+a, 180+a, 40, 40);
  fill(0,0,255);
  ellipse(420-a, a-20, 40, 40);
  fill(0,0,255);
  ellipse(380-a, a-20, 40, 40);
  fill(0,0,255);
  ellipse(340-a, a-20, 40, 40);
  fill(0,0,255);
  ellipse(300-a, a-20, 40, 40);
  fill(0,0,255);
  ellipse(260-a, a-20, 40, 40);
  fill(0,0,255);
  ellipse(420-a, a+20, 40, 40);
  fill(0,0,255);
  ellipse(420-a, a+60, 40, 40);
  fill(0,0,255);
  ellipse(420-a, a+100, 40, 40);
  fill(0,0,255);
  ellipse(420-a, a+140, 40, 40);
 
  a = a+40;
  println(a);
}



