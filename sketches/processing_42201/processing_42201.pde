
class Player {
  Player() {
    println("A new player is born");
  }
  
  float pw = 15;
  float ph = 15;
  
  void display(color c) {
    stroke(0);
    fill(c);
    ellipseMode(CENTER);
    ellipse(mouseX,mouseY, pw,ph);
  }
}

