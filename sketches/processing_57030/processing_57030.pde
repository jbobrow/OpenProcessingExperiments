
int a = 0;

void setup(){
  background(255, 240, 209);
  size(750, 750);
  //run through the program 5 times per second
  frameRate(25);
}

void draw(){
  //random generates a number between 0 to # you give it
  if (a == 0) {
    noStroke();
    fill(random(255), random(255), 198, 50);
    ellipse(random(750), random(750), random(250), 32);
  }
  
  if (a ==1 ) {
    noStroke();
    fill(random(255), random(255), 166, 50);
    //triangle(random(700), random(7
    rect( random(100,650), random(100,650), 50, 50);
  }
  
}
  
  
void mouseClicked() {
  if(a == 0) {
    a = 1;
  } else {
    a = 0;
  }
}

