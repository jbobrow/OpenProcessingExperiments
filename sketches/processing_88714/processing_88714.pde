
void setup() {
  size(500, 500);
  background(0);
}

int times=10;
int newY=0;

void draw() {
  for (int i=0; i<times; i++) {

    for (int j=0; j<times; j++) {

      newY +=10;
      fill(0);
      ellipse(10, random(640), 5, 5);
      ellipse(490, random(640), 5, 5);

      ellipse(50, random(640), 20, 10);
      ellipse(450, random(640), 20, 10);

      
      fill(255);
      
      ellipse(10, random(640), 5, 5);
      ellipse(490, random(640), 5, 5);
      

      ellipse(50, random(640), 20, 10);
      ellipse(450, random(640), 20, 10);


      ellipse(250, random(640), 400, 10);
    }


    newY=0;

    for (int j=0; j<times; j++) {

      fill(255);
      ellipse(10, newY, 5, 5);
    }
  }
}



