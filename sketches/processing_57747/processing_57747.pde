
PImage landscape;
Robot bot1; 
Robot bot2;

void setup() { 
  size(620, 350); 
  bot1 = new Robot("robot1.svg", 30, 10); 
  bot2 = new Robot("robot2.svg", 350, 5); 
  landscape = loadImage("beach_sunset_2.png");
  smooth();
} 

void draw() { 
  background(landscape);

// Update and display first robot 
bot1.update(); 
bot2.update(); 


// Update and display second robot
bot1.display();
bot2.display();

}

class Robot { 
  float xpos; 
  float ypos; 
  float angle; 
  PShape botShape; 
  float yoffset = 0.0;
  
// Set initial values in constructor 
Robot(String svgName, float tempX, float tempY) {
botShape = loadShape(svgName); 
xpos = tempX; 
ypos = tempY; 
angle = random(0, TWO_PI);
}

// Update the fields 
void update() {
angle += 0.05; 
yoffset = sin(angle) * 20;
}
// Draw the robot to the screen 
void display() {
shape(botShape, xpos, ypos + yoffset);
}
}

