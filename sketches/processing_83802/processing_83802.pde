

void setup() {
  size(600, 600);
  smooth();
  textSize(18);
  textAlign(CENTER);
  frameRate(1);
}
void draw() {
  background(100);
  int s = second();
  int m = minute();
  int h = hour();
  String t = h + ":" + nf(m, 2) + ":" + nf(s, 2);
  //println(t);
  text (t, 50, 55);

  //grey circle
  fill(20,30,255);
  ellipse(300, 300, 300, 300);

  //left eye
  fill(200, 300, 50);
  ellipse(240, 250, 45, 45);


  //right eye
  fill(200, 300, 50);
  ellipse(340, 250, 45, 45);


  //right pupil
  fill(100, 200, 300, 400);
  ellipse(340, 250, 35, 35);

  //left puil
  fill(100, 200, 300, 400);
  ellipse(240, 250, 35, 35);

  //nose
  fill(200, 300, 50);
  rect(287.5, 300, 20, 20);

  //mouth
  fill(150, 100, 100);
  line(390, 350, 190, 350);
  rect(300, 350, 20, 25);
  rect(280, 350, 20, 25);

fill(250);
//arc(100,100,100,100, radians(270), radians(270 + second()*6));
arc(300, 300, 300, 300, radians(-90 + second()*6 ), radians(270) );
//second() 0->59
//second()*2=0 118
}



