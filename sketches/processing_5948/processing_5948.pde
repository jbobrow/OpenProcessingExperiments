

PImage a;  
int x;
int y;
float offset;


void setup() {
  size(1600, 800);

  a = loadImage("BerlinWall.jpg");
}

void draw() {

  x = 0;
  y = 0;


  image(a, 0, 0, a.width, a.height);

  fill(250, 0, 0, 10);
  ellipse(1350, 400, 800, 800);

  fill(250, 0, 0, 10);
  ellipse(1300, 400, 750, 750);

  fill(250, 0, 0, 10);
  ellipse(1250, 400, 700, 700);

  fill(250, 0, 0, 10);
  ellipse(1200, 400, 650, 650);

  fill(250, 0, 0, 10);
  ellipse(1150, 400, 600, 600);

  fill(250, 0, 0, 10);
  ellipse(1100, 400, 550, 550);

  fill(250, 0, 0, 10);
  ellipse(1050, 400, 500, 500);

  fill(250, 0, 0, 10);
  ellipse(1000, 400, 450, 450);

  fill(250, 0, 0, 10);
  ellipse(950, 400, 400, 400);

  fill(250, 0, 0, 10);
  ellipse(900, 400, 350, 350);

  fill(250, 0, 0, 10);
  ellipse(850, 400, 300, 300);



  fill(250, 0, 0, 10);
  ellipse(800, 400, 250, 250);

  fill(250, 0, 0, 10);
  ellipse(750, 400, 300, 300);

  fill(200, 0, 0, 10);
  ellipse(700, 400, 350, 350);

  fill(250, 0, 0, 10);
  ellipse(650, 400, 400, 400);

  fill(250, 0, 0, 10);
  ellipse(600, 400, 450, 450);

  fill(250, 0, 0, 10);
  ellipse(550, 400, 500, 500);

  fill(250, 0, 0, 10);
  ellipse(500, 400, 550, 550);

  fill(250, 0, 0, 10);
  ellipse(450, 400, 600, 600);

  fill(250, 0, 0, 10);
  ellipse(400, 400, 650, 650);

  fill(250, 0, 0, 10);
  ellipse(350, 400, 700, 700);

  fill(250, 0, 0, 10);
  ellipse(300, 400, 750, 750);

  fill(250, 0, 0, 10);
  ellipse(250, 400, 800, 800);

  while(y < 800){ 
    x = 0;
    while(x < 1700){

      fill(0,100);
      rect(x,y,10,8);

      fill(0,100);
      rect(x + 17, y + 15 ,5,5);

      fill(126, 98, 98, 0);
      ellipse(x + 20, y + 4, 40, 40);

      fill(0, 100);
      ellipse(x + 20, y + 4, 4, 4);

      fill(0, 0);
      ellipse(x + 20, y + 4, 80, 80);

      fill(250, 10, 10, 0);
      rect(x + 20, y + 4, 100, 100);


      x = x + 30; 
    }
    y = y + 30;
  }

}




