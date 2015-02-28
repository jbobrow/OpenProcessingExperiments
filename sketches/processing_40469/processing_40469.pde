
void setup() {
  size(600, 600);
  smooth();
  background(255);
};

int width = 100;
int height = 100;


void draw() {  
  strokeWeight(2);
  line(0, 0, 600, 600);
  line(600, 0, 0, 600);
  strokeWeight(3);
  rect(250, 250, width, height);
}; 

