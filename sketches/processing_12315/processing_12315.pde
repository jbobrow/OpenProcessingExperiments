
// Assignment # 2
// Name: Zandalee Montero
// E-mail: zmontero@brynmawr.edu 
// Date: 9/15/10 


float x, y, w, h;
float speed = 1;
float gravity = 0.1;
float deltaX = 1;

int doball;
int flame;

void setup() {
  size(500,500);
  smooth();

  x =330;

  y =200;

  w =30;

  h =30;

  doball=0;
  
  flame=0;
}

void draw() {
  background(222,184,135);
  noStroke();
  // floor
  fill(160,115,85);
  rect(0,450,500,50);
  // block
  fill(139,0,0);
  rect(285,175,70,35);
  // vase
  fill(255,228,196);
  ellipse(350,210,70,20);
  rect(330,150,40,55);
  ellipse(350,150,20,30);
  // table
  fill(139,115,85);
  rect(100,210,300,30);
  rect(230,240,20,300);
  // can
  fill(169,169,169);
  rect(295,140,30,35);
  // candle
  fill(255,228,196);
  rect(158,110,5,20);
  // bottle
  fill (85,107,47);
  rect(150,160,20,50);
  ellipse(160,158,22,20);
  rect(156,130,8,20);

  if (doball==1) {


    // ball
    fill(165,42,42);
    ellipse(x,y,w,h);


    y = y+speed;

    speed = speed + gravity;

    if (y >= height-10)
      speed = speed*-0.9;

    x = x + deltaX;

    if (x >= width-10)
      deltaX = deltaX * -1;

    if (x<= 10)
      deltaX = deltaX * -1;
  }
  
  if (flame==1) {
    // flame
  fill(255,255,0,150);
  ellipse(160,110,20,20);
  fill(255,165,0,175);
  ellipse(160,110,10,10);
  }
}  

void mousePressed() {
  doball=1;
}

void keyPressed(){
  flame=1;
}


