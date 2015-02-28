
PImage img;

void setup() {
  size (412,275);
  img = loadImage("http://www.cap.nsw.edu.au/bb_site_intro/specialplaces/special_places_st2/africa/pyramid3.jpg");
}

int a = 290;  //Bottom Left corner X
int b = 195;  //Bottom Y
int c = 380;  //Bottom Right corner X
int d = 100;  //Pyramid Height

void draw () {
  imageMode (CENTER);  //Background
  image (img,width/2,height/2);
  fill(209,145,83);
  rect(0,195,width, height);
  
  imageMode (CORNERS);
  fill (210,132,68);  //light Side
  triangle (a,b,a+((c-a)/3),b,a+((c-a)/2),d);
  fill (177,116,62);  //shadow side
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
      a--;
      c++;
    }
    else if (mousePressed && (mouseButton == RIGHT)) {
      a++;
      c--;
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


