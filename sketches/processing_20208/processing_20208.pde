
/* A4.1_Parametric Pyramids
   Wylie Robinson
   02/07/2011
*/



void setup() {
  size (412,275);
  smooth();
}



int a = 290;  //Bottom Left corner X
int b = 195;  //Bottom Y
int c = 380;  //Bottom Right corner X
int d = 100;  //Pyramid Height




void draw () {
  background(248,20);

  imageMode (CORNERS);
  fill (210,132,68);  //Back Pyramids_light Side
  triangle (210,195,325,70,295,195);
  triangle (70,195,205,15,155,195);
  triangle (-25,195,110,60,45,195);

  fill (177,116,62);  //Back Pyramids_shadow side
  triangle (295,195,325,70,445,195);
  triangle (155,195,205,15,375,195);
  triangle (45,195,110,60,260,196);

  noStroke();  //sperate foreground and background
  fill(248,50);
  rect(0,0,width,195);

  stroke(1);  //Ground plane
  fill(209,145,83);
  rect(0,195,width, height);

  fill (210,132,68);  //parametric pyramid_light Side
  triangle (a,b,a+((c-a)/3),b,a+((c-a)/2),d);
  fill (177,116,62);  //parametric pyramid_shadow side
  triangle (a+((c-a)/3),b,c,b,a+((c-a)/2),d);
}



void keyPressed() {
  if (key == 'a') {  //Shifting left and right
    if (mousePressed && (mouseButton == LEFT)) {
      a--;
      c--;
    }
    else if (mousePressed && (mouseButton == RIGHT)) {
      a++;
      c++;
    }
  }
  if (key == 's') {  //Making base wider or skinnier
    if (mousePressed && (mouseButton == LEFT)) {
      a++;
      c--;
    }
    else if (mousePressed && (mouseButton == RIGHT)) {
      a--;
      c++;
    }
  }
  if (key == 'w') {  //Making the pyramid taller or shorter
    if (mousePressed && (mouseButton == LEFT)) {
      d--;
    }
    else if (mousePressed && (mouseButton == RIGHT)) {
      d++;
    }
  }
}


