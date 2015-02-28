
// Array of Circle
Circle[] cir = new Circle[15];
  
void setup() {
  size(500, 500);
  // Initialize all elements of the cir array
 
  cir[0] = new Circle(50, 0.001, 40, 100, 200);
  cir[1] = new Circle(100, 0.002, 80, 10, 200);
  cir[2] = new Circle(150, 0.003, 120, 100, 10);
  cir[3] = new Circle(200, 0.004, 160, 10, 200);
  cir[4] = new Circle(250, 0.005, 200, 200, 80);
  cir[5] = new Circle(300, 0.006, 245, 100, 90);
  cir[6] = new Circle(350, 0.006, 100, 150, 10);
  cir[7] = new Circle(400, 0.007, 190, 100, 200);
  cir[8] = new Circle(450, 0.008, 10, 255, 90);
  cir[9] = new Circle(500, 0.007, 50, 90, 200);
  cir[10] = new Circle(550, 0.006, 255, 140, 100);
  cir[11] = new Circle(600, 0.005, 110, 10, 110);
  cir[12] = new Circle(700, 0.004, 180, 180, 20);
  cir[13] = new Circle(800, 0.003, 50, 50, 200);
  cir[14] = new Circle(900, 0.002, 170, 70, 255);
  
  
}
void draw() {
  background(255);
  // Display all elements of the cir array
  for(int i=0; i<cir.length; i++) {
    cir[i].display();
  }
}
class Circle {
  // These are the properties that each Circle has. 
  int ellipseSize, circleFillA, circleFillB, circleFillC;
  float factor, myNoise;
  
  // The constructor function, called when creating a new Circle.
  // The only thing it does is copy all the parameters into the
  // properties of this object. We must use "this" to distinguish
  // between the parameters and the properties with the same name
  // (they are two variables with the same name!)
  Circle(int ellipseSize, float factor, int circleFillA, int circleFillB, int circleFillC) {
    this.myNoise = 0;
    this.ellipseSize = ellipseSize;
    this.factor = factor;
    this.circleFillA = circleFillA;
    this.circleFillB = circleFillB;
    this.circleFillC = circleFillC;
  }
  
  // this function displays the circle and increases myNoise
  void display() {
    // Here we don't need to use "this", because there's no
    // confusion. The function receives no parameters, and
    // the variables are known to be properties of this object.
     
    float x = noise(myNoise) * ellipseSize;
    noStroke();
 
    fill(
    noise(1, myNoise * factor)*circleFillA,
    noise(2, myNoise * factor)*circleFillB,
    noise(3, myNoise * factor)*circleFillC, noise(4, myNoise * factor)*160);
 
    ellipseMode(CENTER);
 
    ellipse(width/2, height/2, x, x);
 
    myNoise +=factor;
  }
}

