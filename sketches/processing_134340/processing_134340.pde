
ArrayList ballCollection;


void setup() {
size(600,600);
smooth();
background(0);

ballCollection = new ArrayList();

//for(int i = 0; i < 100; i++){
//Ball myBall = new Ball(random(0,width),random(0,500));
//ballCollection.add(myBall);
//}
}

void draw() {
  

  int x = 23;
for (int i = 0; i < 25;) {
//noStroke();
rectMode(CENTER);
fill(x,x,x,2);
rect(300,300,x,x,50);
x = x+23;
i = i+1;
}
rectMode(CORNERS);
fill(0,0,0,10);
rect(0, 0, 600, 600, 50);
fill(0);
noStroke();
fill(0);

Ball myBall = new Ball(random(0,width),random(0,0));
ballCollection.add(myBall);


for(int i = 0; i < ballCollection.size(); i++){
Ball mb = (Ball) ballCollection.get (i);
mb.run();
}
}
class Ball{
float x = 0;
float y = 0;
float speedX = random(-1,2);
float speedY = random (1,4);
float lifespan;



Ball(float _x, float _y){

x = _x;
y = _y;
lifespan = random (130,300);

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
}

void gravity(){
speedY += 0.2;
}

void bounce(){
if(x > width) {
speedX = speedX * -1;
}
if(x < 0) {
speedX = speedX * -1;
}
if(y > height) {
speedY = speedY * -1;
}
if(y < 0) {
speedY = speedY * -1;
}

}

void move(){

  x += speedX;
y += speedY;
}

void display(){
  fill(0,lifespan);
ellipse (x,y,20,20);
}
}


