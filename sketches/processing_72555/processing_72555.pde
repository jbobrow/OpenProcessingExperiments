
void setup() {
  size(400, 600);
}
void draw() {
 // background (255);

  for (int counter =1; counter < 50; counter = counter +1 ) {
    ellipse(random(width), random(height), 40, 40);
    //counter = number of~ 
    //for = for loops
  }
  for (int line_x= 0; line_x<height; line_x+=3) {
 fill(random(25), random(25), random(25));
    line(line_x, 0, line_x, height);
  }
}
