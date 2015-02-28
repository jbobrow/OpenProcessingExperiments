
import processing.pdf.*;

int x = 0;
int y = 0;
boolean record;
void setup () {

  size (400, 600);
  background (211,160,55);
  smooth();
}

void draw () {
  
  noStroke();
  fill (165,20,37); //set a random color
  rect (185-40,18,20.5,135);
  rect (185-40-40,18,20.5,135-40);
  rect (185-40-40,18,20.5,135-40);
  rect (185-40-40-40,18,20.5,135-40-40);
  rect (185,18,40.5,162);
  rect (185+60,18,20,135);
  rect (185+60+40,18,20,135-40);
  rect (185+60+40+40,18,20,135-40-40);



  while (x < width && y < height) {
    fill (165,20,37); //set a random color
    noStroke();
    rect (x, y-10, 20, 20);
    rect (x, y+50, 10, 10);
    rect (x, y+100, 10, 10);
    rect (x, y+150, 10, 10);
    rect (x, y+200, 10, 10);
    rect (x, y+250, 10, 10);
    rect (x, y+300, 10, 10);
    rect (x, y+350, 10, 10);
    rect (x, y+410, 20, 20);
    rect (x, y+460, 20, 20);
    rect (x, y+510, 20, 20);
    rect (x, y+560, 20, 20);


    x++;
    y++;

    rect (x, width-y-20, 20, 20);
    rect (x, width-y+50, 10, 10);
    rect (x, width-y+100, 10, 10);
    rect (x, width-y+150, 10, 10);
    rect (x, width-y+200, 10, 10);
    rect (x, width-y+250, 10, 10);
    rect (x, width-y+300, 10, 10);
    rect (x, width-y+350, 10, 10);
    rect (x, width-y+400, 20, 20);
    rect (x, width-y+450, 20, 20);
    rect (x, width-y+              500, 20, 20);
  }

  int x1=241;
  int y1=199;
  int x2=236;
  int y2=182;
  int x3=224;
  int y3=195;

  for (int g=1;g<15;g++) {
    fill(255);
    triangle(x1,y1,x2,y2,x3,y3);
    x1+=15;
    y1-=15;
    x2+=15;
    y2-=15;
    x3+=15;
    y3-=15;
  }

  int xx1=167;
  int yy1=199;
  int xx2=184;
  int yy2=194;
  int xx3=171;
  int yy3=181;

  for (int g=1;g<15;g++) {
    fill(255);
    triangle(xx1,yy1,xx2,yy2,xx3,yy3);
    xx1-=15;
    yy1-=15;
    xx2-=15;
    yy2-=15;
    xx3-=15;
    yy3-=15;
  }


  noFill();
  stroke (49,82,58);
  strokeWeight (40);

  rect (0, 0, width, height);
  strokeWeight (5);
  stroke (255);
  rect (20, 20, width-40, height-40);


  if (record) {
    endRecord();
    record = false;
  }
  
}

//if you press a key, a pdf will be recorded
void keyPressed () {
  record = true;
}
       
