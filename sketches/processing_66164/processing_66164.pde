
void setup() {
  size(800, 800);
  smooth();
  background(#222222);
  stroke(#555555);
  for (int i = 0; i < 800; i = i+5) {
    for (int j = 0; j < 800; j = j+5) {
      point(i, j);
    }
  }
  stroke(#FFFFFF);
  for (int i = 0; i < 100; i = i+5) {
    line(i, width/2, height/2, i);
  }
  for (int i = 0; i < 100; i = i+5) {
    line(width/2, i, width-i, height/2);
  }
  for (int i = 0; i < 100; i = i+5) {
    line(width-i, height/2, width/2, height-i);
  }
  noFill();
  stroke(#CCCCCC);
  for (int i = 0; i < 100; i = i+5) {
    curve(width-i, height-i, width/2, height-i, i, height/2, i, height-i);
  }
  fill(#FFFFFF, 50);
  rectMode(CENTER);
  rect(width/2, height/2, width/5, height/5);
  fill(#000000, 50);
  stroke(#000000, 10);
  for (int i=0; i<20; i++) {
    int a = round(random(height/2));
    if (i%3 ==0) {
      ellipse(2*a+i, 2*a, a, a);
    }
  }
  fill(#FFFFFF,80);
  int point1 = round(random(width)-random(width)/1000);
  int point2 = round(random(width)-random(width)/1000);
  int point3 = round(random(width)-random(width)/1000);
  int point4 = round(random(width)-random(width)/1000);
  beginShape();
  vertex(point1, point2);
  vertex(point2, point3);
  vertex(point3, point4);
  endShape();
  println("Last night I was awake,");
  println("Walking across a dream,");
  println("In the jungle of skyscrapers.");
  println("It was hell of a rumble,");
  println("For one claiming to be in silent.");
  println("I had to handcuffed the fear in prison,");
  println("Put misery in jail.");
  println("Just before the dawn,");
  println("I murdered depression,");
  println("Injured loneliness,");
  println("Hospitalized self-pity.");
  println("I attended boredom’s funeral,");
  println("Wearing red.");
}


