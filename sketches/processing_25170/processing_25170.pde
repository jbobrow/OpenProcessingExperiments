
PImage clouds;
PImage tree;
PFont font1;
int speed =10;
int radius = -100;
float xC = -800;

void setup () {
  //runs once
  //setup size, smoothing etc
  smooth();
  size(800,800);
  clouds = loadImage("clouds.png");
  tree = loadImage ("Tree.png");
  font1 = loadFont ("ARBERKLEY-48.vlw");
  textFont(font1);
}


void draw () {
  background (255);

  if (mouseX<400) {
    // Night background
    fill(0,62,137);
    rect(0,0,800,400);
    fill(30,121,0);
    rect(0,400,800,400);

    //moon
    fill(255);
    ellipse(50,50,150,150);
    fill(200);
    ellipse(55, 55, 25, 25);
    ellipse(65, 30, 8, 8);
    ellipse(15, 55, 10, 10);
    fill(230);
    ellipse(80, 15, 10, 10);
    ellipse(5, 5, 15, 15);
    ellipse(80, 80, 10, 10);
    ellipse(50, 100, 7, 7);
  }

  else
  {// day background
    fill(108,232,255);
    rect(0,0,800,400);
    fill(158,255,75);
    rect(0,400,800,400);
    fill(158,255,75);
    rect(0,400,800,400);


    //sun
    fill(255,248,23);
    ellipse(50,50,150,150);
  }


  //grass
  //using both forloops to draw both sides of the grass


  stroke (1,59,0);
  for (int xp=1; xp<800; xp+=8)

    for (int yp=405; yp<800; yp+=10) {

      line(xp,yp,xp+3,yp-10);
      line(xp+2, yp, xp-3, yp-10);
    }

  xC += speed;
  if (xC > width+radius) {
    xC = radius;
  }

    image(clouds, xC,5);
    image(clouds, xC+150,15);
    image(clouds, xC+300,25);

    for (int xp=-50; xp<800; xp+=100) {
      image(tree, xp,150);
    }

    fill(255);


    if (mousePressed) {
      text ("Angry Bear : Munching", 200,750,600, 600);
    }
    else if (keyPressed) {
      text ("Psycho Bear", 280,750,600, 600);
    }
    else {
      text ("Angry Bear", 280,750,300,300);
    }  


    int x=mouseX;
    int y=mouseY;

    stroke (0);
    //legs1
    fill(160,88,0);
    ellipse(x-60, y+200, 30, 90);
    ellipse(x-70, y+245, 30,10);

    //body


    ellipse(x-10,y+70,160,250);
    fill(255,77);
    ellipse(x-10,y+70,100,180);
    fill(160,88,0);

    //ears

    ellipse (x-60,y-260, 60,80);
    ellipse (x+60, y-260,60,80);
    fill(255,77);
    ellipse (x-60, y-260,40,80);
    ellipse (x+60, y-260,40,80);

    //head
    fill(160,88,0);
    ellipse (x, y-150, 220, 220);



    if (keyPressed) {
      //Crazy eyes
      fill(255);
      ellipse (x-50,y-190,60,60);
      ellipse (x+50, y-190, 30,30);
      fill(0);
      ellipse (x-55,y-182,35,35);
      ellipse (x+45,y-182,10,10);
      fill(255);
      ellipse (x-60,y-182,20, 20);
      ellipse (x+40,y-182,4,4);
    }
    else {//eyes
      fill(255);
      ellipse (x-50,y-190,40,40);
      ellipse (x+50, y-190, 40,40);
      fill(0);
      ellipse (x-55,y-182,25,25);
      ellipse (x+45,y-182,25,25);
      fill(255);
      ellipse (x-60,y-182,10, 10);
      ellipse (x+40,y-182,10,10);
    }

    //eyebrows
    line (x-50,y-240,x,y-200);
    line (x+30,y-240,x,y-200);

    if (mousePressed) {
      //mouth closed
      fill(255,155,155);
      ellipse (x+20,y-100,80,10);
    }
    else {
      //mouth
      fill(255,155,155);
      ellipse (x+20,y-100,80,50);
      //Teeth
      //triangle(x1, y1, x2, y2, x3, y3);
      fill(255);
      triangle (x+20, y-120, x, y-120, x+10, y-100);
      triangle (x+40, y-120, x+20,y-120, x+30, y-100);
      triangle (x+25, y-80, x+5, y-80, x+15, y-100);
      triangle (x+45, y-80, x+25, y-80, x+35, y-100);
    }


    //arms
    fill(160,88,0);
    ellipse(x-70, y-25, 90, 30);
    ellipse(x-30, y-25, 90, 30);

    //legs2
    ellipse(x+10, y+200, 30,90);
    ellipse(x+5, y+245, 30,10);
  }


