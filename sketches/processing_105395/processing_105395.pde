
int x = 50;
int y = 60;
int life = 0;

//Recheck all the coordinates and the numbers for x1, x2, y1, y2
int [] x1 = {
  0, 0, 200, 280, 20, 20, 100, 100, 200, 200, 100, 20, 300, 300, 300, 580, 380, 500, 500, 380, 380, 380, 380, 300, 600, 600, 680, 600, 600, 500, 420, 0, 500, 0
};
int [] x2 = {
  280, 200, 200, 280, 200, 20, 100, 200, 200, 280, 300, 300, 300, 380, 580, 580, 500, 500, 580, 380, 600, 600, 380, 380, 600, 680, 680, 680, 600, 600, 420, 420, 500, 500
};
int [] y1 = {
  20, 100, 200, 20, 200, 200, 280, 280, 280, 500, 500, 580, 20, 20, 20, 20, 100, 100, 200, 300, 300, 380, 380, 580, 20, 20, 550, 550, 460, 460, 380, 600, 460, 680
};
int [] y2 = {
  20, 100, 100, 500, 200, 580, 500, 280, 500, 500, 500, 580, 500, 20, 20, 200, 100, 200, 200, 100, 300, 380, 580, 580, 300, 20, 20, 550, 550, 460, 600, 600, 680, 680
};
PImage img;
PImage img1;
PImage img2;

void setup () {
  size (700, 700);
  img = loadImage("61P17DPNK_large.jpg");
  img1 = loadImage("61P17DPNK_large.jpg");
  img2 = loadImage("61P17DPNK_large.jpg");
  background (0);
  textSize (30);
  text ("Lives:", 600, 600);
}

void draw () {
  //background (0);
  //line (0, 20, 200, 20);
  //stroke (255, 255, 255);
  //strokeWeight (10);
  //line (0, 200, 200, 200);
  background (0);
  img.resize(40, 40);
  img1.resize(40, 40);
  img2.resize (40, 40);
  textSize (30);
  text ("Lives:", 600, 620);
  image(img, 650, 650);
  image(img1, 600, 650);
  image (img2, 550, 650);
  line (0, 20, 280, 20);
  stroke (255, 255, 255);
  strokeWeight (10);
  for(int i=0;i<34;i++){
  line(x1[i],y1[i],x2[i],y2[i]);
  }
  /*line (0, 100, 200, 100);
  line (200, 200, 200, 100);
  line (280, 20, 280, 500);
  line (20, 200, 200, 200);
  line (20, 200, 20, 580);
  line (100, 280, 100, 500);
  line (100, 280, 200, 280);
  line (200, 280, 200, 500);
  line (200, 500, 280, 500);
  line (100, 500, 300, 500);
  line (20, 580, 300, 580);
  line (300, 20, 300, 500);
  line (300, 20, 380, 20);
  line (300, 20, 580, 20);
  line (580, 20, 580, 200);
  line (380, 100, 500, 100);
  line (500, 100, 500, 200);
  line (500, 200, 580, 200);
  line (380, 300, 380, 100);
  line (380, 300, 600, 300);
  line (380, 380, 600, 380);
  line (380, 380, 380, 580);
  line (300, 580, 380, 580);
  line (600, 20, 600, 300);
  line (600, 20, 680, 20);
  line (680, 550, 680, 20);
  line (600, 550, 680, 550);
  line (600, 460, 600, 550);
  line (500, 460, 600, 460);
  line (420, 380, 420, 600);
  line (0, 600, 420, 600);
  line (500, 460, 500, 680);
  line (0, 680, 500, 680);*/
  ellipse (x, y, 50, 50);
  if (keyPressed == true) {
    background (0);
    image(img, 650, 650);
    image(img1, 600, 650);
    image (img2, 550, 650);
    textSize (30);
    text ("Lives:", 600, 620);
    line (0, 20, 280, 20);
    stroke (255, 255, 255);
    strokeWeight (10);
    for(int i=0;i<34;i++){
  line(x1[i],y1[i],x2[i],y2[i]);
  }
    /*line (0, 100, 200, 100);
    line (200, 100, 200, 200);
    line (280, 20, 280, 500);
    line (200, 200, 20, 200);
    line (20, 200, 20, 580);
    line (100, 280, 100, 500);
    line (100, 280, 200, 280);
    line (200, 280, 200, 500);
    line (200, 500, 280, 500);
    line (100, 500, 300, 500);
    line (20, 580, 300, 580);
    line (300, 20, 300, 500);
    line (300, 20, 380, 20);
    line (300, 20, 580, 20);
    line (580, 20, 580, 200);
    line (380, 100, 500, 100);
    line (500, 100, 500, 200);
    line (500, 200, 580, 200);
    line (380, 100, 380, 300);
    line (380, 300, 600, 300);
    line (380, 380, 600, 380);
    line (380, 380, 380, 580);
    line (380, 580, 300, 580);
    line (600, 20, 600, 300);
    line (600, 20, 680, 20);
    line (680, 20, 680, 550);
    line (600, 550, 680, 550);
    line (600, 460, 600, 550);
    line (600, 460, 500, 460);
    line (420, 380, 420, 600);
    line (420, 600, 0, 600);
    line (500, 460, 500, 680);
    line (0, 680, 500, 680);*/
    for (int i=0;i<34;i++) {
      if (x>x1[i]-5&&x<x2[i]+5&&y>y1[i]-5&&y<y2[i]+5) {

        x = 50;
        y = 60;
        life++;
        //fill(0);
        //rect(550+(50*life),650,50,50);
        img.resize(1, 1);
        if (life ==2) {
          img1.resize(1, 1);
        }
        if (life>2) {
          background(0);
          textSize (100);
          text("Game Over", 80, 300);
          textSize (20);
          text ("Lunette Si", 80, 650);

          noLoop();
        }

        //  println("in"+i);
      }
      if(x<60&&y>610){
      background(0);
          textSize (75);
          text("Congratulations!!!", 30, 300);
          textSize (75);
          text ("You Won!!!", 30, 400);
          textSize (20);
          text ("Lunette Si", 350, 650);

          noLoop();
      }
    }
    if (key == CODED) {
      if (keyCode == RIGHT) {
        if (x > 665) {
          x = 665;
        }
        ellipse (x+=5, y, 50, 50);
      }
      else if (keyCode == LEFT) {
        if (x < 35) {
          x = 35;
        }
        ellipse (x-=5, y, 50, 50);
      }
      else if (keyCode == UP) {
        if (y < 35) {
          y = 35;
        }
        ellipse (x, y-=5, 50, 50);
      }
      else if (keyCode == DOWN) {
        if (y > 665) {
          y = 665;
        }
        ellipse (x, y+=5, 50, 50);
      }
    }
  }
}



