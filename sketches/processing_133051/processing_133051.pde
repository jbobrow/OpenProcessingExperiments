
float yPos=27.5;
float g=.15;
float acceleration=0;
PImage Image;

 
void setup() {

  
  size(500, 500);
  smooth();
}
 

 
void draw() {
background(#00FAE7);
//Image = requestImage("Background.jpg");
//image(Image);
  makeball();
  yPos += acceleration;

  acceleration += g;

  if (yPos>480) {
    acceleration=-acceleration/1.05;
  
  }
}
 
void makeball() {
  if (yPos>0 && yPos<=470) {

    if (acceleration>0) {
      fill(#FA0000);
      ellipse(125, yPos, 40, 60);     
    }
    else {
      fill(#FA0000);
      ellipse(125, yPos, 50, 50);
    }
  }
  else if (yPos>470 && yPos<480) {
    fill(#FA0000);
    ellipse(125, yPos, 60, 40);
  }
  
   if (yPos>0 && yPos<=470) {
    if (acceleration>0) {
    fill(#0006FA);
      ellipse(375, yPos, 40, 60);
    }
    else {
    fill(#0006FA);
      ellipse(375, yPos, 50, 50);
    }
  }
  else if (yPos>470 && yPos<480) {
  fill(#0006FA);
    ellipse(375, yPos, 60, 40);
  }
}


