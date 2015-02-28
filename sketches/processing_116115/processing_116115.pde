
int num_squares = 200;
int[] x_values = new int[num_squares];
int[] y_values = new int[num_squares];
 
void setup() {
  size(700, 700);
  smooth();
   
    for (int i = 0; i<x_values.length; i++) {
    x_values[i] = int( random(width) );
    y_values[i] = int( random(height) );
    }
 
}
void draw() {
  background(210, mouseY, mouseX);

   
   
  for (int xPos = 0; xPos <= width; xPos = xPos + 5) {
     
 
    line(xPos, 0, mouseX, height-mouseY);
    line(xPos, height, mouseX, height-mouseY);
 
    line(0, xPos, width-mouseX, mouseY);
    line(width, xPos , width-mouseX, mouseY);
     
  }
for (int i = 0; i<x_values.length; i++) {
    rect(x_values[i]+(mouseX*.005)*i, y_values[i]+(mouseY*.005)*i, 20, 20);
   
  }
   
}

void mouseClicked(){
  fill(random(250), random(250), random(250), 50);
  stroke(random(120), random(120), random(120));
}
