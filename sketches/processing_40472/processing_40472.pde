
void setup() {
  size(600, 450);
  smooth();
  background(255);
};

void draw() {  
  
  for (int i = -60; i < 600; i+=5) {
    stroke(255, 0, 255);
    line(i, 0, i + 50, 150);
    stroke(255, 255, 0);
    line(i, 100, i + 50, 250);
    stroke(0, 255, 255);
    line(i, 200, i + 50, 350);
    stroke(255, 0, 255);
    line(i, 300, i + 50, 450);
  };
 
}; 

