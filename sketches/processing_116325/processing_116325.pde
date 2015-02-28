
//Eunsil Choi 10/18/2013

int num_arc = 30;
int num_line = 170;
int [] x_values = new int [num_line];
int [] y_values = new int [num_arc];

void setup() {
  size(700, 400);
  smooth();
  for (int i = 0; i<x_values.length; i++) {
    x_values[i] = int(random(width));
  }
  for (int i = 0; i<y_values.length; i++) {
    y_values[i] = int(random(height));
  }
}
void draw() {
  background(140, 150, 90);
  for (int i = 0; i<x_values.length; i++) {
    
    if ((mouseX > width/2) && (mouseX < width)) {
      stroke(105, 200, 180);
      line(width/4, height/2, mouseX, random(mouseY));

      stroke(200, 200, 90);
      line(width/4, height/2, mouseX/3, random(mouseY)/3);

      stroke(240, 190, 100);
      line(width/4, height/2, mouseX/4, random(mouseY)/4);
    }
  }
  for (int i = 0; i<y_values.length; i++) {

    fill(220, 130, 90);
    arc(random(mouseX), random(mouseY), 30, 30, 0, PI+2, PIE);
  }
}
