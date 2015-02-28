
int[] myArray;
int myNumber;

int posY;

boolean goingUp;



void setup() {

  size(500, 500);
  posY=400;
  goingUp = true;
}



void draw() {
  background(posY/2, 255, 120);



  myArray = new int[4];
  myNumber = 1;
  noFill();

  for (int i = 0; i<300; i++) {  //create an int i=0
    triangle( i* 10, i * 10, i * 30, i *50, i* 10, i * 10);
    triangle( i* 20, i * 20, i * 60, i* 60, i* 15, i * 15);
    ellipse(250, i*100, 60, 60);
    ellipse(i*125, 200, 60, 60);
    fill(i*2, 255, 255, 50);
    ellipse(i*125, 300, 60, 60);
    fill(posY, 255, 255, 90);
    ellipse(375, i*100, 60, 60);

    if (goingUp == true) {
      posY = posY +50;
      if (posY < 250) {
        goingUp = false;
      }
    }

    else {
      posY = posY +300;
      if (posY > 450) {
        goingUp = true;
      }
    }
  }
}


