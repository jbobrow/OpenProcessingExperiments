
// variables
int jump_right = 50;
int jump_down  =50;



//setup
size(800, 800);
strokeWeight(3);
smooth();

//loops
for (int i=0; i<width; i+=jump_right) {
  for (int j=0; j<height; j+=jump_down) {
    for (int k=0; k<255; k+=10) {
      float a =random(255);
      float b =random(255);
      float c =random(255);

      fill(a, b, c);



      rect(i, j, 50, 50);
      stroke(a, b, c);
      fill(255, 0, 0, 1);
      noStroke();
      rect(200, 200, 400, 400);
    }
  }
}


