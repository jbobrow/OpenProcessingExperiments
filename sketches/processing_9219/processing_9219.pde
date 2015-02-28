

void setup () {
  size (255,255);
  background(0);
}
void draw () {
  background(0);
  //start with i as 0
  int i = 0;
  //while i is less than the width of the window
  while (i<width){
    noStroke ();
    
    //name following distance as a local variables
    float distance = abs(mouseX - i);
    
    fill(distance);
    rect(i,0,10,height);
    
    
    //increase i by 10!
    i +=10;
  }
    
}






/*
Following code from Example 6-5 that didnt work....

int endY;

void setup () {
  size (200,200);
  background(0);
  frameRate(5);
  endY = height;
}
void draw () {
  background(0);
  for (int y = 0, y<=200, y-=endY){
  stroke(255);
  line(0,y,width,y);
}
  //increment y!
  y += 10;
}


ALSO THE FOLLOWING CODE FOR Example 6-6


void setup () {
  size (255,255);
  background(0);
}
void draw () {
  for (int i = 0, i < width, i*=10){
    float distance = abs(mouseX -i);
    fill(distance);
    rect (i,0,10,height);
  }
}
  


*/




