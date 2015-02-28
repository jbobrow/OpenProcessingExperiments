
//Lauren Barnett
//Eyeballs_Part_Two
//Feb_9

int x;
int y;
int value=#9EF02E; //movecolor;


void setup() {
  size (500, 500);
  smooth();
  background(0);
}

void draw() {
  fill(255);
  for (int x=10; x<500; x=x+20) {
    for (int y=10; y<500; y=y+20) {
      ellipse (x, y, 20, 20);//whites of their eyes
    }
  }

  fill(#2EEBF0);
  for (int x=10; x<500; x=x+20) {
    for (int y=10; y<500; y=y+20) {
      ellipse (x, y, 10, 10);//color of their eyes
    }
  }


  fill(#000000);
  for (int x=10; x<500; x=x+20) {
    for (int y=10; y<500; y=y+20) {
      ellipse (x, y, 5, 5);//non-dialated pupil
    }
  }

    if (mouseX>=1 && mouseX<=500) {
      for (int x=10; x<500; x=x+20) {
        for (int y=10; y<500; y=y+20) {
          fill(#9EF02E);
          ellipse (x, y, 10, 10);//color of their eyes
        }}
         fill(#000000);
  for (int x=10; x<500; x=x+20) {
    for (int y=10; y<500; y=y+20) {
      ellipse (x, y, 5, 5);//non-dialated pupil
    }}
    
    //if(mouseX>400){
      //mouseX=600;
    //}
println("X=" + mouseX); //so you know where you are
        }
      }






