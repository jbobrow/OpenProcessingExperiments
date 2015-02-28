
//Ned Prutzer
//Feb 3rd Assignment (Right to left)

int x=675;
int z=0;

void setup () {
  size(800, 600);
  background(255);
  smooth();
  strokeWeight(3);
}

void draw () {
  background(255);
  //Body (Parallel Lines)
  line(x-400, 400, x-155, 400);
  line(x-375, 200, x-190, 200);
  //Wing
  line(x-215, 270, x-340, 240);
  line(x-340, 240, x-368, 270);
  line(x-368, 270, x-368, 320);
  line(x-368, 320, x-340, 350);
  line(x-340, 350, x-215, 320);
  //Mane
  line(x-450, 250, x-475, 215);
  line(x-475, 215, x-380, 155);
  line(x-380, 155, x-162, 155);
  line(x-160, 155, x-190, 200);
  //Butt
  line(x-375, 200, x-450, 250);
  line(x-450, 250, x-475, 290);
  //Tail
  line(x-475, 290, x-505, 250);
  line(x-505, 250, x-520, 265);
  line(x-520, 265, x-400, 400);
  //Belly
  line(x, 224, x-80, 255);
  line(x-80, 255, x-155, 400);
  //Horn
  triangle(x-160, 155, x-150, 95, x-105, 128);
  //Eye
  triangle(x-135, 163, x-110, 180, x-105, 148);
  //Leg 1
  line(x-400, 400, x-450, 450);
  line(x-415, 383, x-450, 420);
  line(x-450, 450, x-450, 420);
  //Leg 2
  rect(x-400, 400, 25, 50);
  //Leg 3
  rect(x-200, 400, 25, 50);
  //Leg 4
  line(x-160, 400, x-105, 450);
  line(x-145, 380, x-105, 420);
  line(x-105, 450, x-105, 420);
  //Head
  line(x-160, 155, x-105, 128);
  line(x-105, 128, x, 128);
  line(x, 128, x, 162);
  line(x, 162, x-15, 178);
  line(x-15, 178, x, 194);
  line(x, 194, x, 224);
  //Movement
  if (x < 510 & z == 1) {
    x+=5; 
    z=0;
  }
  if (z == 1) {
    x-=2;
  }
  if (x > 799 & z == 0) {
    x-=2; 
    z = 1;
  }
  if (z == 0) {
    x+=2;
  }
}


