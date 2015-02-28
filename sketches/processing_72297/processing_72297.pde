
ArrayList cupcakes; 
float oscillation;
float rad;
float xPos;
float YPos;

void setup() {
  size(500, 500);
  cupcakes = new ArrayList();
//  cupcakes.add(new Cupcake());
}

void draw() {
  background(118, 231, 241);
  for (int i = 0; i < cupcakes.size(); i++) {
    println(cupcakes.size());
    Cupcake myCake = (Cupcake) cupcakes.get(i);
    myCake.display();
    myCake.rotateCake();
  //  map(value, originallow, originalhigh, 
 //   float oscMapped = map(oscillation, );

    
  }
}

void keyPressed() {
  Cupcake cup = new Cupcake();
  cupcakes.add(cup);
}

