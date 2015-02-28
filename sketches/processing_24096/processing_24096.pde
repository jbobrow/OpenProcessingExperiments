
//Hui Zhang processing
// Project 2


float yoyoR;
float yoyoG;
float yoyoB;
 
int circleX= 50;
int speed = 3;
int state = 0;

void setup(){ 
size(200,200);

smooth();
}


void draw() { 
  
background(mouseX,mouseY,mouseY);
int x = width/2;
int y = height/2;


ellipseMode(CENTER);
rectMode(CENTER);
stroke(0);




//hat
fill(16,116,234);
rect(100,35,20,10);
fill(0);
line(65,30,133,30);


  circleX = circleX + speed;
  
  if((circleX < 50) || (circleX > 150))  {
    speed = speed * -1;
  }
  
  stroke(0); 
  fill(183,24,24); 
  ellipse(circleX,20,10,10);
  fill(35,233,33);
 ellipse(circleX,180,10,10);

fill(247,228,10);
rect(100,100,40,100);


//face
fill(255);
ellipse(100,70,60,60);




fill(0);
ellipse(110,70,3,5);
ellipse(90,70,3,5);
ellipse(100,90,3,5);
stroke(0);



fill(210,10,50);
ellipse(110,80,10,5);
ellipse(90,80,10,5);


//hands
fill(0);
ellipse(65,100,15,10);
ellipse(135,100,15,10);


//feet
line(100,150,80,160);
line(100,150,120,160);



fill(0);
line(x-40,y,pmouseX,pmouseY);

//yoyo
yoyoR = random(255);
yoyoG = random(255);
yoyoB = random(255);
fill(yoyoR,yoyoG,yoyoB);
ellipse(mouseX,mouseY,15,18);
}

