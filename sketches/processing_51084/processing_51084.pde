
// variables
int jump_right = 15;
int jump_down  =15;



//setup
size(800, 800);
background(150);
strokeWeight(0.5);
smooth();

//loops
for(int i=0; i<width; i+=jump_right) {
  for(int j=0; j<height; j+=jump_down){
    stroke(0);
    line(i, j, 25,25);
    rotate(20);
  }
}

for(int i=0; i<width; i+=jump_right) {
  for(int j=0; j<height; j+=jump_down){
    stroke(255);
    strokeWeight(0.2);
    line(i, j, 25,25);
    rotate(20);
  }
}

for(int i=800; i>0; i-=jump_right) {
  for(int j=0; j<height; j+=jump_down){
    stroke(255);
    line(i, j, 25,25);
    rotate(20);
  }
}


