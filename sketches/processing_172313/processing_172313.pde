
Spot sp1, sp2;
void setup() { 
  size(300, 300); 
  smooth(); 
  noLoop();
              // Run the constructor without parameters
sp1 = new Spot();
              // Run the constructor with three parameters
sp2 = new Spot(66, 50, 20);
}

void draw() { sp1.display(); sp2.display();
}
class Spot {
float x, y, radius;
// First version of the Spot constructor; // the fields are assigned default values 
Spot() {
x = 23;
y = 90;
radius = 100;
}
// Second version of the Spot constructor; // the fields are assigned with parameters 
Spot(float xpos, float ypos, float r) {
                x = xpos;
                y = ypos;
                radius = r;
}
              void display() {
          
                fill(90,200,250,20);
                stroke(30, 200, 200);
                ellipse(x, y, radius*2, radius*2);
                ellipse(x/2, y/2, radius/PI, radius*2);
                
} 
}


