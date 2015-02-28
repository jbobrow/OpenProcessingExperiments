
//Samantha Oleson
//EMS II- Eric Singer
//Carnegie Mellon University
//September 2011

PImage park;

int x1 =350; //first 2 x coordinates of neck, x point of stomach 
int x2 = 330; //second 2 x points of neck
int x3 = 320; //x points for head and tounge
int x4 = 327; //ear x point
int x5 = 310; //eye x point
int x6 = 307; //nose x point
int x7 = 353; //paw x point
int x8 = 357; //leg x point
int x9 = 365; //shoulder x point
int x10 = 400; //x point of stomach
int x11 = 110; //rectangle stomach width
int x12 = 367; //front leg 2

int y1 =415; //Neck 1
int y2 =395; //Neck 2
int y3 =370; //Neck 3
int y4 =390; //Neck 4
int y5 =410; //Tounge
int y6 =385; //Head
int y7 =373; //Ear
int y8 =380; //Eye, Pupil, stomach
int y9 =400; //Nose
int y10 =390; //Tail1, Tail2
int y11 =350; //Tail3, Tail4
int y12 =410; //Front Leg, Back Leg
int y13 =40; //Front Leg HEIGHT, Back Leg HEIGHT
int y14 =403; //Front Shoulder, Back Hip



void setup() {
  size(500, 500);
  smooth();
  background(256, 200, 0);
  String a = "http://andycripe.files.wordpress.com/2008/10/tugman-park-pano.jpg";
  park = loadImage(a, "jpg");
}

void draw() {
  
  //Makes background picture move
  int movePicture = (millis()/50) % 3500;
  image(park, -3500 + movePicture, 0, 4000, 500);
  drawWeinerDog();
}



//Create Weiner Dog
void drawWeinerDog() {

  //STRETCH DOG LEFT
  if (keyCode == LEFT) {
    x1 --;
    x2 --;
    x3 --;
    x4 --;
    x5 --;
    x6 --;
    x7 --;
    x8 --;
    x9 --;
    x10 --;
    x11 ++;
    x12 --;
  }
  else if (keyCode == RIGHT) {
    x1 =350; 
    x2 = 330; 
    x3 = 320; 
    x4 = 327; 
    x5 = 310;
    x6 = 307;
    x7 = 353; 
    x8 = 357;  
    x9 = 365;
    x10 = 400;
    x11 = 110;
    x12 = 367;
  }

  //STRETCH DOG UP
  if (keyCode == UP) {
    y1 --;
    y2 --;
    y3 --;
    y4 --;
    y5 --;
    y6 --;
    y7 --;
    y8 --;
    y9 --;
    y10 --;
    y11 --;
    y12 --;
    y13 ++;
    y14 --;
  }
  else if (keyCode == DOWN) {
    y1 =415; //Neck 1
    y2 =395; //Neck 2
    y3 =370; //Neck 3
    y4 =390; //Neck 4
    y5 =410; //Tounge
    y6 =385; //Head
    y7 =373; //Ear
    y8 =380; //Eye, Pupil, stomach
    y9 =400; //Nose
    y10 =390; //Tail1, Tail2
    y11 =350; //Tail3, Tail4
    y12 =410; //Front Leg, Back Leg
    y13 =40; //Front Leg HEIGHT, Back Leg HEIGHT
    y14 =403; //Front Shoulder, Back Hip
  }

  //Neck
  quad(x1, y1, x1, y2, x2, y3, x2, y4);

  //Tounge
  fill(256, 0, 0);
  ellipse(x3, y5, 5, 20);
  //Head
  fill(240, 100, 0);
  ellipse(x3, y6, 30, 50);
  //Ear
  fill(250, 100, 0);
  ellipse(x4, y7, 20, 30);
  //Eye
  fill(255);
  ellipse(x5, y8, 10, 10);
  //Pupil
  fill(0);
  ellipse(x5, y8, 5, 5);
  //Nose
  ellipse(x6, y9, 7, 7);
  
  //front paw 2
  fill(240,100,0);
  ellipse(x7 + 10, 445, 20,10);
  //front leg 2
  fill(240,100,0);
  rect(x12, y12, 15, y13);
  //Back leg 2
  rect(447,y12,15,y13);
  //back paw 2
  ellipse(443,445,20,10);

  //Stomach
  fill(240, 100, 0);
  rect(x1, y8, x11, 45);

  //Tail
  curve(440, y10, 460, y10, 480, y11, 400, y11);

  //front paw
  ellipse(x7, 445, 20, 10);
  //front leg1
  rect(x8, y12, 15, y13);
  //front shoulder
  ellipse(x9, y14, 35, 45);

  //back paw
  ellipse(433, 445, 20, 10);
  //back leg
  rect(437, y12, 15, y13);
  //back hip
  ellipse(445, y14, 35, 45);
}


