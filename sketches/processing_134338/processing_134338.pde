
ArrayList ballCollection;


void setup() {
size(600,600);
smooth();
  
background(255);

mouseX = width/2;mouseY = height/2;


ballCollection = new ArrayList();

//for(int i = 0; i < 100; i++){
//Ball myBall = new Ball(random(0,width),random(0,500));
//ballCollection.add(myBall);
//}
}

void draw() {
fill(255,255,255,5);
rect(-1,-1,600,600);

Ball myBall = new Ball(mouseX,mouseY);
ballCollection.add(myBall);


for(int i = 0; i < ballCollection.size(); i++){
Ball mb = (Ball) ballCollection.get (i);
mb.run();
}
}
class Ball{
float x = 0;
float y = 0;
float speedX = random(-5,5);
float speedY = random (-5,5);
float lifespan;
float s;


Ball(float _x, float _y){

x = _x;
y = _y;
lifespan = random (10,20);
s = speedY;
frameRate(12);

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
  lifespan -= 1.0;
  s += 8.0;
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

  stroke (0,0,0,75);
  fill (200, 200,200,0);
ellipse (x,y,50+s,50+s);
}
}


