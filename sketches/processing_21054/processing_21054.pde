
LargeAsteroid lA = new LargeAsteroid(-80,-150,2);
SmallAsteroid01 sA = new SmallAsteroid01(0,0, 5);
SmallAsteroid02 sA2 = new SmallAsteroid02(0,0, 5);
SmallAsteroid03 sA3 = new SmallAsteroid03(0,0, 5);
SpaceShip sS = new SpaceShip(0, 0, 10);

void setup() {
   size(620,480);
    smooth();
    background(0);
}

void draw() {
  //clear out background
  noStroke();
  fill(0, 190);
  rect(0,0, width,height);
  //call the draw function for the creature class
  lA.update();
  lA.draw();
  sA.update();
  sA.draw();  
  sA2.update();
  sA2.draw();
  sA3.update();
  sA3.draw();
  sS.update();
  sS.draw();
}


