
PFont font;
PFont smell;

float x= 40.0;
float y = 5.0;
float speedX = 2;
float speedY = 2;
int radius = 5;
int directionX = 1;
int directionY = 1;
int days = 1;
int timer = 0;
float maxTime;
float bar =4.0;
float count = 0.0;


void setup(){
  size(250,250);
  smooth();
  background(240, 255,206);
  font = loadFont("barcode.vlw");
  smell = loadFont("smell.vlw");
}

void draw(){

  fill(255);

  strokeWeight(2);

  // control X

  x = x + (speedX*random(-1,1));
  if ((x > width - radius) || (x < radius)){

    directionX = -directionX;

  }





  // control Y

  y = y + (speedY*random(-1,1));
  if ((y > height - radius) || (y < radius)){

    directionY = -directionY;

  }


  stroke(0,10,30,random(50,80));
  point(x,y);
  noStroke();
  fill(0,30,60,2);
  float dot = random(4,14);
  ellipse(x,y,dot,dot);
  fill(255);
  rect (0,height-50,105,50);
  fill(0);
  textFont(font);
  String age = "age: "+nf(days/100,4)+" days.";
  days += 1;
  text (age,10,height-10);
  textFont(smell);
  text("SMELL:",10, height-60);
  rect(10,height-57,bar,3);
  bar+=0.01;
  timer++;

  // print stats

  println (speedX+" "+speedY+"    "+x+","+y+"    "+maxTime+"   "+timer);

  // respawn on click

  if (mousePressed == true){
    background(240, 255,206);
    x = random (radius*2, width-radius*2);
    y = random (radius*2, height-radius*2);
    speedX = random (0.5,3.0);
    speedY = random (0.5,3.0);
    bar = 3;
    days=0;

  }

  // speed up on keypress

  if((x<-10)||(x>width+10)||(y<-10)||(y>height+10)||(keyPressed == true)||(timer>=maxTime) ){
    x = random (radius*2, width-radius*2);
    y = random (radius*2, height-radius*2);
    speedX = random (1.5,2.2);
    speedY = random (1.5,2.2);
    days += 1;
    bar+=0.1;
    timer = 0;
    maxTime = random (300, 1200);


  }
}































