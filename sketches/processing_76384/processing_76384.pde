
int hight = 85;
int timer=10;

void setup() {
  size(100, 100);
}
void draw() {
  if (keyPressed == true) {
    hight = hight - 1;
  }
println("PUSH!");

  background (0, 100, 250);
  fill (0, 225, 100);
  rect(-5, 90, 110, 150);
  fill(0);
  rect(65, 25, 5, 65);
  fill (255, 0, 0);
  rect(65, hight, 20, 10);


  if (hight < 25) {
    println("Victory!");
  }
  
}
