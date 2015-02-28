
int bodyX = random(20, 275);
int bodyY = 0;
int i;
int s;
int d;

void setup(){
  size(300, 300);
  ellipseMode(CENTER);
  rectMode(CENTER);
  frameRate(7);
}

void draw(){
  background(100);
  
stroke(255);
line(bodyX, 0, bodyX, bodyY);
  
  //make the spider move from top to bottom
  if (bodyY > 340){
    bodyY = -40;
  }
  else {
    bodyY++;
  }
  
 //legs
  stroke(0);
  i = random(23, 27);
  line(bodyX, bodyY, bodyX+i, bodyY+i);
  line(bodyX, bodyY, bodyX-i, bodyY-i);
  line(bodyX, bodyY, bodyX+i, bodyY-i);
  line(bodyX, bodyY, bodyX-i, bodyY+i);
  
  s = random(27, 32);
  d = random(8, 12);
  line(bodyX, bodyY, bodyX-s, bodyY-d);
  line(bodyX, bodyY, bodyX-s, bodyY+d);
  line(bodyX, bodyY, bodyX+s, bodyY+d);
  line(bodyX, bodyY, bodyX+s, bodyY-d);
  
  //body
  stroke(255, 0, 0);
  fill(0);
  ellipse(bodyX, bodyY, 40, 40);
  ellipse(bodyX, bodyY+25, 10, 10);
  
  //second spider
   //legs
  stroke(0);
  i = random(23, 27);
  line(bodyX, bodyY, bodyX+i, bodyY+i);
  line(bodyX, bodyY, bodyX-i, bodyY-i);
  line(bodyX, bodyY, bodyX+i, bodyY-i);
  line(bodyX, bodyY, bodyX-i, bodyY+i);
  
  s = random(27, 32);
  d = random(8, 12);
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


