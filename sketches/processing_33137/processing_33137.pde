
float x1,y1,x2,y2,x3,y3,xspeed,yspeed,c = random(255),c1 = random(255),c2 = random(0,255);
int x1direction,y1direction,x2direction,y2direction;



void setup(){
size(500,500);
frameRate(50);
smooth();


x1 = 200;

y1 = 40;

x2 = 70;

y2 = 70;

x3 = 250;

y3 = 90;
 

yspeed = 1;


}

void draw(){

PImage b;
b = loadImage("unkle.jpg");
image(b, 0, 0);



y1 = y1 + yspeed;






  stroke(c1);
  ellipse(x1,y1,5,5);
  
  stroke(random(255));
  ellipse(x1,y1,10,10);
  
  stroke(random(255));
  ellipse(x1,y1,15,15);
  
  stroke(random(255));
  ellipse(x1,y1,20,20);
  
  stroke(random(255));
  ellipse(x1,y1,25,25);
  
  stroke(random(255));
  ellipse(x1,y1,30,30);
  
  stroke(random(255));
  ellipse(x1,y1,35,35);
  
  stroke(random(255));
  ellipse(x1,y1,40,40);
  
  stroke(random(255));
  ellipse(x1,y1,45,45);
  
  stroke(random(255));
  ellipse(x1,y1,50,50);
  
  stroke(random(255));
  ellipse(x1,y1,55,55);
  
  stroke(random(255));
  ellipse(x1,y1,60,60);
  
  stroke(random(255));
  ellipse(x1,y1,65,65);




fill(c2);
noStroke();
ellipse(x2,y2,70,70);


y2 = y2 + yspeed;







noFill();
strokeWeight(1);
  stroke(c1);
  ellipse(x3,y3,5,5);
  
  stroke(random(255));
  ellipse(x3,y3,10,10);
  
  stroke(random(255));
  ellipse(x3,y3,15,15);
  
  stroke(random(255));
  ellipse(x3,y3,20,20);
  
  stroke(random(255));
  ellipse(x3,y3,25,25);
  
  stroke(random(255));
  ellipse(x3,y3,30,30);
  
  stroke(random(255));
  ellipse(x3,y3,35,35);
  
  stroke(random(255));
  ellipse(x3,y3,40,40);
  
  stroke(random(255));
  ellipse(x3,y3,45,45);
  
  stroke(random(255));
  ellipse(x3,y3,50,50);
  
  stroke(random(255));
  ellipse(x3,y3,55,55);
  
  stroke(random(255));
  ellipse(x3,y3,60,60);
  
  stroke(random(255));
  ellipse(x3,y3,65,65);

y3 = y3 + yspeed;




}


