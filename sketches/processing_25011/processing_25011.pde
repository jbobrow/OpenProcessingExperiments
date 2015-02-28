
 //Pentigree L-System by Geraldine Sarmiento (NYU ITP).
//This code was based on Patrick Dwyer's L-System class.
import peasy.*;

PeasyCam cam;  // pre-made camera operation through mouse dragging and zooming
PentigreeLSystem ps;

void setup() {
  size(900, 600, P3D);
  smooth();
  ps = new PentigreeLSystem();
  ps.simulate(3);
lights();
  cam = new PeasyCam (this,800);   
    cam.setMinimumDistance(-50);
    cam.setMaximumDistance(5000);
    frameRate(10);  //slowed down to follow program easier
}

void draw() {
  background(255);
  ps.render();
  lights();

}

void keyPressed(){   // save image using the "b" key
  if((key == 'b') || (key == 'B')){
  save("image7.jpg");
  println("saved");
  }
}

class PentigreeLSystem {

  String axiom;
  String rule;
  String production;
  float startLength;
  float drawLength;
  float theta;
  int x;
  int generations;
  int steps;

  PentigreeLSystem() {  //list of algorithms
     // axiom = "[F]+F"; //one
    //  rule = "F++F"; //one
   //  axiom = "F-F"; //two
   // rule = "F-[F]"; //two
   // axiom = "F+F-F"; //three
   // rule = "F+F-[F]"; //three
   axiom = "[F]+F-F++F"; //four
    rule = "F-F+F+F"; //four
   // axiom = "[F]-F+F+F-F"; //five
    //rule = "F+F--F+F+F"; //five
   // axiom = "F+F+F+[F]-F--F"; //six
   // rule = "F-F+F+F++F-F"; //six
    
   
    startLength = 20;  //distance from origin of cube to origin of next cube
    theta = radians(90);  //rotation of cube
    reset();
  }

  void reset() {   //defines "reset"
    production = axiom;
    drawLength = startLength;
    generations = 0; //number of added origins
  }

  int getAge() {
    return generations;
  }

  void render() {
    translate(100, 100,-10);  //origin of module assemblages
    steps += 10;          
    if (steps > production.length()) {
      steps = production.length();
        
    }

    for (int i = 0; i < steps; i++) {  
      char step = production.charAt(i);    
      if (step == 'F') {
        fill(200);
        stroke(100);
        box(20, 20, 20);
        translate(-drawLength, -drawLength, 0);  //shifts cubes in x and y direction the distance of startLength
      }
      
      //defines symbols used in algorithms       
      else if (step == '+') {  
        rotate(theta);
      } 
      else if (step == '-') {
        rotate(-theta);
      } 
      else if (step == '[') {
        pushMatrix();
      } 
      else if (step == ']') {
        popMatrix();
      }
      if(i % 10 == 0){  // every 10 frames, the origin shifts 20 units in the z direction
         translate(0,0,20); 
       }
     } 
  
}


  void simulate(int gen) {
    while (getAge() < gen) {
      production = iterate(production, rule);
    }
  }
 
     String iterate(String prod_, String rule_) { 
    generations++;
    String newProduction = prod_;          
    newProduction = newProduction.replaceAll("F", rule_);
    return newProduction;
     }
  }


