
// variables
int jump_right = 25;
int jump_down  =25;



//setup
size(800, 800);
background(150);
strokeWeight(0.5);
smooth();

//loops
for (int i=width; i>0; i-=jump_right) {
  for (int j=0; j<height; j+=jump_down) {
    for (int k=0; k<255; k+=10) {
      stroke(k);
      line(i, j, 775, 775);
      rotate(20);
    }
  }
}


for (int i=0; i<width; i+=jump_right) {
  for (int j=0; j<height; j+=jump_down) {
    strokeWeight(0.1);
    stroke(0,170,250);
    line(i, j, 25, 25);
    rotate(20);
  }
}

/*for(int i=0; i<width; i+=jump_right) {
 for(int j=0; j<height; j+=jump_down){
 stroke(255);
 strokeWeight(0.2);
 line(i, j, 25,25);
 rotate(20);
 }
 }*/

/*for(int i=800; i>0; i-=jump_right) {
 for(int j=0; j<height; j+=jump_down){
 //stroke(255);
 line(i, j, 775, 775);
 stroke(i/100);
 rotate(20);
 }
 }*/




