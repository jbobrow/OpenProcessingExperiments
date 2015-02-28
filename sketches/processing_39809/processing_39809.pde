
//Thanks to Nick for some of the code

//Looks like post-it notes falling of the pad

float[] rot;


int margin = 25; //sets the size of the frame
int space = 25; //sets teh space between the rect

void setup() {
  size(300, 300);
  background(255);
  smooth();
  //calcutates how many rects are needed
  int num = int((height-margin)/space)* int((width-margin)/space);


  rot = new float[num];
  //seeds the array
  for (int i =0; i < num; i++) {
    rot[i] = random(radians(45));
  }
}

void draw() {
  int count = 0;

  for ( int y=margin; y < height-margin; y+=space) {
    pushMatrix();
    translate(0, space);

    for ( int x=margin; x<width-margin; x+=space) {
      translate(space, 0);

      pushMatrix();

      fill(204, 209, 72);
      rect(0, 0, space-3, space-3);
      rotate(rot[count]);
      count++;
      fill(250, 255, 121);
      rect(0, 0, space-3, space-3);
      popMatrix();
      if (count >= 100) {
        count = 0;
      }
    } 
    popMatrix();
    translate(0, space);
  }
}


