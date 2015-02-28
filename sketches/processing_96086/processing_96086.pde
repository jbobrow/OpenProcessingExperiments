
void setup(){
  size(600, 300);
  smooth();
  float circles = 5;
  float circlesNumber = calculateCircles(circles);
  println(circlesNumber);
}
float calculateCircles(float w) {
  float newNumber = w * 1;
  return newNumber;
}
void draw(){
  background(#3900B2);
  pacman(100,150);
  pacman(200,150);
  pacman(300,150);
  pacman(400,150);
  pacman(500,150);
}
void pacman(int x, int y){
  noStroke();
  float d = random(20, 100);
  fill(#FFEF00);
  arc(x, y, d, d, PI*0.2, PI*1.8);
}


