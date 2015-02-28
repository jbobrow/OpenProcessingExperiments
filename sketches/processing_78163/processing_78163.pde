
void setup() {
  size(200, 200);
  noStroke();
  
}

void draw(){
  //random Zufallszahlen von 0 ... 10
  //random(10)
  //Zufallszahlen von -5 ...  
  //random(-5, 5);
  
  fill(random(200, 400), random(200, 255), random(200,400));
  
  //random Zudallszahlen von 0 ... 200
  ellipse(random(200), random(200), 20, 20);
}
