
//Xiongfei Zhang
//Stretch and squash

void setup() {
  size(500, 500);
  smooth();
}

float yPos=27.5;
float g=.15;
float acceleration=0;

void draw() {
  background(0);
  makeball();
  yPos += acceleration;
  //ball drop or bounce back
  acceleration += g;
  //accelerate speed add g
  //when bounce back, -acceleration+g = slower speed
  if (yPos>480) {
    acceleration=-acceleration/1.05;
    //when hit bottom, bounce back, but drop down at lower height
    //Thanks to Mauricio
  }
}

void makeball() {
  if (yPos>0 && yPos<=470) {
  //drop down || ascent
    if (acceleration>0) {
    //drop down
      ellipse(width/2, yPos, 40, 60);
      //stretch
      fill(255);
    }
    else {
    //ascent
      ellipse(width/2, yPos, 50, 50);
      //regular
    }
  }
  else if (yPos>470 && yPos<480) {
  //hit ground
    ellipse(width/2, yPos, 60, 40);
    //squash
  }
}
                                
