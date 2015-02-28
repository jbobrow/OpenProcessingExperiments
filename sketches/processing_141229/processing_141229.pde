
Spider mySpider1;
Spider mySpider2;


void setup(){
  mySpider1 = new Spider();
  mySpider2 = new Spider();

 size(300, 300);
frameRate(10);
}



void draw(){
    background(100);
    mySpider1.display();
    mySpider1.fall();
    
    mySpider2.display();
    mySpider2.fall();
}

class Spider{
int bodyX;
int bodyY;
int i;
int s;
int d;

Spider (){
  bodyX = int(random(20, 275));
  bodyY = 0;
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
    if (bodyY > 340){
    bodyY = -40;
    bodyX = random(20, 275);
  }
  else {
    bodyY++;
  }
} 
}


