
ArrayList ballCollection;
ArrayList ballCollection2;
ArrayList ballCollection3;

void setup() {
size(1000,600);
smooth();
background(0);
frameRate(60);

mouseX = width/2; mouseY = 500;

ballCollection = new ArrayList();
ballCollection2 = new ArrayList();
ballCollection3 = new ArrayList();
}

int value = 88;

float b_radius = 90;
float b_angle = 0;
float b_x = cos(b_angle*PI/180)*b_radius;
float b_y = sin(b_angle*PI/180)*b_radius;

float a_radius = 70;
float a_angle = 0;
float a_x = cos(a_angle*PI/180)*b_radius;
float a_y = sin(a_angle*PI/180)*b_radius;

float c_radius = 50;
float c_angle = 0;
float c_x = cos(c_angle*PI/280)*c_radius;
float c_y = sin(c_angle*PI/180)*c_radius;

//void update();

void draw() {
  

b_angle = b_angle - 3;
float b_x = cos(b_angle*PI/180)*b_radius;
float b_y = sin(b_angle*PI/180)*b_radius;

c_angle = c_angle - 1;
float c_x = cos(c_angle*PI/180)*c_radius;
float c_y = sin(c_angle*PI/180)*c_radius;




a_angle = a_angle + 2;
float a_x = cos(a_angle*PI/180)*a_radius;
float a_y = sin(a_angle*PI/180)*a_radius;

  
fill(0,0,0,20);
rect(-1,-1,1001,601);
translate(0,-2);


Ball myBall = new Ball(mouseX+b_x, mouseY+b_y);
ballCollection.add(myBall);

Ball myBall2 = new Ball(mouseX+a_x, mouseY+a_y);
ballCollection2.add(myBall2);

Ball myBall3 = new Ball(mouseX+c_x, mouseY+c_y);
ballCollection3.add(myBall3);


for(int i = 0; i < ballCollection2.size(); i++){
Ball mb = (Ball) ballCollection2.get (i);
mb.run();
}

for(int i = 0; i < ballCollection.size(); i++){
Ball mb = (Ball) ballCollection.get (i);
mb.run();
}
for(int i = 0; i < ballCollection3.size(); i++){
Ball mb = (Ball) ballCollection3.get (i);
mb.run();
}

}
class Ball{
float x = 0;
float y = 0;
float p = 0;
float m = map(mouseX, 0,width,-7 + random(-2),7 + random(2));
float highP = 5;
float speedX = m;
float speedY = 0;
float lifespan;
float z = 0;


Ball(float _x, float _y){

x = _x;
y = _y;
lifespan = random (130,150);

}

void run(){
  update();
display();
move();
bounce();
gravity();
}

void update()
{
  lifespan -= 2.0;
  speedY = random(speedY * 1.03,1.5);
}

void gravity(){
speedY += 0.2;
}

void bounce(){
 

if(y > height) {
speedY = speedY*-1;
speedX = random(1.5,3);
}

}

void move(){

  x += speedX;
y += speedY;
}

void display(){
 noStroke();
 fill(mouseX,lifespan*2,mouseY);
ellipse (x,y,5,5);
}
}


