
//a bouncing swordshman made into an object in the class of man

Man swordshman;

void setup() {
  size(200,200);
  smooth();
  swordshman = new Man(height/2,width/2,1,1);
}

void draw() {
//background  
 fill(0,102,255);
  stroke(0,102,255);
  rect(100,70,200,140);
  fill(0,255,0);
  stroke(0,255,0);
  rect(100,170,200,60);
  fill(255,255,0);
  stroke(255,255,0);  
  ellipse(180,20,50,50);
  stroke(0);
  swordshman.display();
  swordshman.move();
}
 
//create the swordshman
class Man {
//variables
  float x_position,y_position,xspeed,xdirection;
  
  Man(float tempX, float tempY, float tempXspeed, float tempXdirection) {
  x_position = tempX;
  y_position = tempY;
  xspeed = tempXspeed;
  xdirection = tempXdirection;
}

void display() {
  rectMode(CENTER);
//body
  fill(0);
  stroke(0);
  rect(x_position,y_position+30,2,40);
//head
  stroke(0);
  fill(255,153,102);
  ellipse(x_position,y_position,30,30);
//upper leg parts
  stroke(0);
  line(x_position,y_position+50,x_position-10,y_position+60);
  line(x_position,y_position+50,x_position-11,y_position+60);
  line(x_position,y_position+50,x_position+10,y_position+60);
  line(x_position,y_position+50,x_position+11,y_position+60);
  //lower leg parts
  line(x_position+11,y_position+60,x_position+11,y_position+80);
  line(x_position+10,y_position+60,x_position+10,y_position+80);
  line(x_position-11,y_position+60,x_position-11,y_position+80);
  line(x_position-10,y_position+60,x_position-10,y_position+80);
//arms
  fill(0);
  rect(x_position,y_position+20,50,2);
//eyes
  point(x_position-5,y_position-5);
  point(x_position+5,y_position-5);
//mouth
  line(x_position-5,y_position+5,x_position+5,y_position+5);
//sword
  fill(100,100,100);
  stroke(153,153,153);
  triangle(x_position+23,y_position-17,x_position+24,y_position-12,x_position+22,y_position-12);
  rect(x_position+23,y_position+4,2,38);
  line(x_position+20,y_position+17,x_position+26,y_position+17);
//shield
  fill(100,100,100);
  rect(x_position-20,y_position+30,20,40);
//hair
  stroke(255,204,0);
  line(x_position-10,y_position-8,x_position-10,y_position-11);
  line(x_position-8,y_position-9,x_position-8,y_position-12);
  line(x_position-6,y_position-10,x_position-6,y_position-13);
  line(x_position-4,y_position-11,x_position-4,y_position-14);
  line(x_position-2,y_position-12,x_position-2,y_position-15);
  line(x_position,y_position-13,x_position,y_position-16);
  line(x_position+2,y_position-12,x_position+2,y_position-15);
  line(x_position+4,y_position-11,x_position+4,y_position-14);
  line(x_position+6,y_position-10,x_position+6,y_position-13);
  line(x_position+8,y_position-9,x_position+8,y_position-12);
  line(x_position+10,y_position-8,x_position+10,y_position-11);
//shoes
  fill(102,51,0);
  rect(x_position-15,y_position+78,10,5);
  rect(x_position+15,y_position+78,10,5);
}
//make the swordshmn move
void move() {
  x_position = x_position + xspeed*xdirection;
//let the swordshman bounce
  if(x_position > width-30 || x_position <30) {
    xdirection=-xdirection;
  }
}
}
