
color sun;

int skyfill;
int horizon;

int sunX;
int sunY;


int treeX;
int treeX2; 
int treeX3;

//int time;

int r;
float time;

float speed;

void setup() {
  size(1000, 600);
  colorMode(HSB, 360, 100, 100);
  smooth();
  noStroke();

  horizon = height/2;
  color sun = color(46, 92, 99);
  //sunX = (width - 300) - time;
  //sunY = horizon - time;
  sunX = 700;
  sunY = horizon;
  r = 300;
  time = 0;
  skyfill = 360 * sunY / 300;
  speed = .05;


  int treeX = 100;
  int treeX2 = treeX - 25; 
  int treeX3 = treeX + 25;

  fill(112, 150, 360-skyfill);
  triangle(treeX, horizon - 75, treeX2, horizon - 25, treeX3, horizon - 25);
  triangle(treeX, horizon - 50, 50, horizon - 5, 150, horizon - 5);
  triangle(treeX, horizon - 15, 25, horizon + 15, 175, horizon +15);
}


void draw() {

  time = time - speed;
  sunX = int(r * cos(time));
  sunY = int(r * sin(time));
  
//  //if(sunY >= 0){
//    speed = speed * -1;
//  }
// 
  
  //skyfill = 360 * sunY / 300;
    //skyfill = 100 - sunY;
    skyfill = int(map(sunY,0,-300,0,100));
    

  println(time);
  //println(sunX);
  //println(sunY);

//grass
  fill(231, 90, skyfill);
  rect(0, 0, width, height);

  
   pushMatrix();
  translate(width/2, horizon); //(500,300)
  fill(50,83,89);
  ellipse(sunX, sunY, 100, 100);
  popMatrix();
  
   //grass
  fill(100, 50, skyfill);
  rect(0, horizon, width, horizon);

 int treeX = 100;
  int treeX2 = treeX - 25; 
  int treeX3 = treeX + 25;

  //tree
  fill(112, 150, skyfill);
  triangle(treeX, horizon - 75, treeX2, horizon - 25, treeX3, horizon - 25);
  triangle(treeX, horizon - 50, 50, horizon - 5, 150, horizon - 5);
  triangle(treeX, horizon - 15, 25, horizon + 15, 175, horizon +15);
}
