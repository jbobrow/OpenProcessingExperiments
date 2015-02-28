
void setup(){
  size(400, 400);
  background(250);
}

void draw(){
  
  //yellow circles starting at 225 spaced 20 in x and y directions with a diameter of 10
   for (float x = 225; x < width; x+=20) {
    for (float y = 5; y < width; y+=20) {
      fill(235,252,3,100);
      ellipse(x, y, 10, 10);
      noStroke();
 }
}

  //blue squares spaced the same but running diagonally and overlapping the yellow circles
  //the transparency allows the yellow and blue to create green which also creates another triangle
for (int x=0; x<width; x=x+20){
  for (int y=0; y<=height; y=y+20){
    if (y>=x) {
        fill(35,3,252,100);
        rect(x,y,10,10);
         noStroke();
  }
 }
}

//red semi-transparent lines running horizontally (as long as x is less than 200) creates purple squares
//and orange circles
for (int x=5; x<200; x+=20) {
  strokeWeight (10);
  stroke(240,22,25,100);
  line (0,x,400,x);
 }
}

 




 




