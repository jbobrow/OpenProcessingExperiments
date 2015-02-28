
int spacing;

void setup(){
  size(500,500);
  spacing = 50;
  smooth();
}

void draw(){
  background(255);
  fill(0);
  
  for(int i = 0; i < width - spacing; i = i + 50){
    line(spacing + i, spacing, spacing, height - spacing - i);
    line(spacing, spacing + i, width - spacing - i, spacing);
  }
}
