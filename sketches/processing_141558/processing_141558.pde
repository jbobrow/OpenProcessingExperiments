
Spider[] mySpider;

void setup(){
  size(600, 300);
  frameRate(10);
  
  //makes each spider (10)
  mySpider = new Spider[10];
  mySpider[0] = new Spider();
  mySpider[1] = new Spider();
  mySpider[2] = new Spider();
  mySpider[3] = new Spider();
  mySpider[4] = new Spider();
  mySpider[5] = new Spider();
  mySpider[6] = new Spider();
  mySpider[7] = new Spider();
  mySpider[8] = new Spider();
  mySpider[9] = new Spider();
}

void draw(){
  background(100);
  int q;
  //displays each spider
  for (q = 0; q < 10; q++){
    mySpider[q].display();
    mySpider[q].fall();
  }
}

class Spider{
float bodyX;
float bodyY;
float i;
float s;
float d;

Spider (){
//sets a random starting point within the frame for each spider
  bodyX = int(random(18, 583));
  bodyY = int(random(-40, 230));
  i= random(23, 27);
  s= random(28, 31);
  d= random(8, 11);
}


void display(){
    ellipseMode(CENTER);
  rectMode(CENTER);
  
  //web  
stroke(255);
line(bodyX, 0, bodyX, bodyY);

 //legs
  stroke(0);
  strokeWeight(2);
  //makes legs move
  i= random(23, 27);
  //most top and bottom legs
  line(bodyX, bodyY, bodyX+i, bodyY+i);
  line(bodyX, bodyY, bodyX-i, bodyY-i);
  line(bodyX, bodyY, bodyX+i, bodyY-i);
  line(bodyX, bodyY, bodyX-i, bodyY+i);
  
  //makes legs move
  s= random(28, 31);
  d= random(8, 11);
  //middle legs
  line(bodyX, bodyY, bodyX-s, bodyY-d);
  line(bodyX, bodyY, bodyX-s, bodyY+d);
  line(bodyX, bodyY, bodyX+s, bodyY+d);
  line(bodyX, bodyY, bodyX+s, bodyY-d);
  
  //body
  stroke(255, 0, 0);
  fill(0);
  ellipse(bodyX, bodyY, 40, 40);
  ellipse(bodyX, bodyY+25, 10, 10);
}

void fall(){
//reset their starting location after the fall off the screen
//sets a new y off the top of the frame, nd a new random x
    if (bodyY > 340){
    bodyY = random(-40, -30);
    bodyX = random(18, 583);
  }
  //makes the spiders fall
  else {
    bodyY++;
  }
} 
}


