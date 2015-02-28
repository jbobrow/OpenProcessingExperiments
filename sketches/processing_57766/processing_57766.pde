
int pos = 2;
int bajacolor = 255;

void setup () {
  size (500, 500);
  frameRate (50);
}

void draw (){
  pos ++;
  bajacolor --;
  for (int i = 5 ; i < 500; i += 15) {
    fill (bajacolor, bajacolor, random(897));
    noStroke();
    triangle(10, i, pos, 10, 12, 132);
    triangle(10, i, pos, 110, 112, 132);
    triangle (10, i, pos, 900, 78, 765);
    triangle(789, i, pos, 765,345, 675);
    triangle(40, i, pos, 895, 34, 234);
    triangle(10, i, pos, 210, 212, 232);
    triangle(10, i, pos, 310, 312, 332);
    triangle(10, i, pos, 410, 412, 432);
    triangle(10, i, pos, 610, 612, 632);
    
    if (pos == 255)
      noLoop ();
    }
  {}
}
