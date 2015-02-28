
int x;
int y;

void setup() {
  size (600, 400);
}

void draw() {
  background (0);
  x= 0;
  y= 0;

  while (y < 400+10){
    x= 0;
    while (x < 600+10){ 


      fill (random (255), random (255), random (255));
      ellipse (x, y, 25 ,25);

      fill (0);
      ellipse (x,y, 18, 18);

      fill (random (255), random (255), random (255));
      ellipse (x,y, 12,12);

      fill (0);
      ellipse (x,y, 6,6);

      fill (random (255), random (255), random (255));
      ellipse (x, y, 3, 3);
      x= x+30;


    }
    y= y+ 30;


  }




}






