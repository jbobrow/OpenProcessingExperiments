
float speed =.05;
int diameter = 40;
float x;
float y=58;
PImage apple;
PShape queen;
PImage mysnow1;

int time1 = 9000; // for queen
//int time2 = 9000;
float b = 610;

float angle = 0.0; // for snow
float offset=150;
float scalar = 75;
float speed1 = 0.05;





void setup() {
  size (600, 300);
  smooth ();
  x= 0;
  y = 0;
  apple = loadImage("apple.png");
  queen = loadShape ("queen.svg");
  shapeMode (CENTER);
  mysnow1= loadImage("mysnow1.png");
  imageMode (CENTER);
}

void draw () {
  background(37, 23, 52); //start of apple shiver
  for ( int x = 0; x<width; x +=56) {
    for ( int y = 0; y<height; y +=56) {
      //x+=  random (-speed, speed);
      y+= random ( -speed, speed);
      x= constrain (x, 0, width);
      y= constrain (y, 0, height);
      image (apple, x, y, diameter, diameter);
    }
  } 
  {
  }


  //int y = 300;
  int currentTime = millis (); // Queen's Entrance
  if (currentTime < time1) {
    b-=0;
  }
  else if ( currentTime > time1) {
    b-=3;
  }
  shape (queen, width/2, b, 570, 570);

  int x= width/2; //snow's movement
  float y1 = offset + sin(angle) * scalar;
  y1=constrain (y1, 0, height);
  image(mysnow1, x, y1, 150, 150);
  angle+= speed1;

  int currentTime1 = millis ();
  if (currentTime1 > time1) {
    translate (300, 150);
    rotate(angle);
    angle+=0.1;
  }
  //y=height/2;
  //x+= random (-speed, speed);
  //y+= random (-speed, speed);
  //image(mysnow1, x, y, 150, 150);
}


