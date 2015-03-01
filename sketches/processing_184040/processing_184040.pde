
void setup() {
  size( 800, 600);
  background (0);
  frameRate(15);
}
void draw() {

  fill(255);
  textSize(10);
if (mousePressed && (mouseButton == LEFT)) {
    text( "("+mouseX+"," + mouseY + ")", mouseX, mouseY-10);
    ellipse(mouseX, mouseY, 3, 3);
    println("("+mouseX + "," + mouseY +")");
    } else if (mousePressed && (mouseButton == RIGHT)) {
    fill(255, 0,0);
    text( "("+mouseX+"," + mouseY + ")", mouseX, mouseY+10);
    ellipse(mouseX, mouseY, 3, 3);
    println("("+mouseX + "," + mouseY +")");
    }
}
