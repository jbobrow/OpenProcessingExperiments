
//decadence in venice

int x;
int y;
int Y_AXIS = 1;
int X_AXIS = 2;


void setup() {
  size(500, 750);


}
void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ){
  // calculate differences between color components 
  float deltaR = red(c2)-red(c1);
  float deltaG = green(c2)-green(c1);
  float deltaB = blue(c2)-blue(c1);
  // choose axis
  if(axis == Y_AXIS){
    /*nested for loops set pixels
     in a basic table structure */
    // column
    for (int i=x; i<=(x+w); i++){
      // row
      for (int j = y; j<=(y+h); j++){
        color c = color(
        (red(c1)+(j-y)*(deltaR/h)),
        (green(c1)+(j-y)*(deltaG/h)),
        (blue(c1)+(j-y)*(deltaB/h)) 
          );
        set(i, j, c);
      }
    }  
  }  

}

void draw() {

  noLoop();
  color b1 = color(60, 23, 72);
  color b2 = color(13, 33, 36);
  setGradient(0, 0, width, height, b1, b2, Y_AXIS);



  y=0;
  x=0;

  while (y < 800){
    x=0;


    while (x < 800) {
      smooth();
      noFill();
      stroke(188,181,42, 50);
      ellipse(x+x, y+y, 500, 500);

      noFill();
      stroke(199, 237, 156, 60);
      ellipse(x,y,7,7);


      fill(random(255), random(255), random(25), 10);
      stroke(random(25), random(255), random(255));
      ellipse(x,y,30, random(width));


      x=x+30;

    }

    y=y+50;
    x=x+50;

  }


}





