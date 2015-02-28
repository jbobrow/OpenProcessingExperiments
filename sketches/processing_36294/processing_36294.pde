
//Fields

//Initialise
Ball b;
ArrayList pile;

//Setup
void setup() {
  size(700,400);
  smooth();
  background(255);
  pile = new ArrayList();
  pile.add(new Ball(new PVector(random(25, width - 25), random(25, height - 25)), 50, 10, 10));
}

//Apply to Graphic Pane
void draw() {
  background(255);  //Resets to background
  for(int i = 0; i < pile.size(); i++){
    Ball b = (Ball) pile.get(i);
    b.run(mouseX, mouseY);
  }
}


