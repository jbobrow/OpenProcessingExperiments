
// variables
int jump_right = 15;
int jump_down  =15;



//setup
size(800, 800);
background(130, 210, 180);
stroke(140, 140, 180);
strokeWeight(2);
smooth();

//loops
for (int i=0; i<width; i+=jump_right) {
  for (int j=0; j<height; j+=jump_down) {
    noFill();
    stroke(i,j,50);
    ellipse(i, j, 80, 40);
    rotate(50);
  }
}




