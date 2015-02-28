
ArrayList ballCollection;

void setup() {
size(600,600);
smooth();
background(255);
frameRate(90);

mouseX = width/2; mouseY = 500;


ballCollection = new ArrayList();

//for(int i = 0; i < 100; i++){
//Ball myBall = new Ball(random(0,width),random(0,500));
//ballCollection.add(myBall);
//}
}

int value = 88;


void draw() {

  
fill(255,255,255,map(mouseY, 0,height,95,88));
rect(-1,-1,601,601);
translate(0,-2);


Ball myBall = new Ball(random(290,310),0);
ballCollection.add(myBall);



for(int i = 0; i < ballCollection.size(); i++){
Ball mb = (Ball) ballCollection.get (i);
mb.run();



}
}
class Ball{
float x = 0;
float y = 0;
float p = 0;
float m = map(mouseX, 0,width,-7 + random(-1),7 + random(1));
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
 

if(y > mouseY) {
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
  fill(random(lifespan/2,170),lifespan*2,200,150);
ellipse (x,y,15,15);
}
}


