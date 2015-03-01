
Ant myAnt1;
Food myFood1;
Rest myRest1;

void setup() {
  size(600, 600);

  myAnt1 = new Ant(color(0, 0, 255), width, height, 2, 5, 10);
  myFood1 = new Food();
  myRest1 = new Rest();
  
}

void draw() {
  background(255);
  fill(0, 0, 0);


////////// REAL INTERACTION
myAnt1.locateFood(myFood1.getX(), myFood1.getY());
myAnt1.locateRest(myRest1.getX(), myRest1.getY());

myFood1.script();
myRest1.script();
myAnt1.script();

}

