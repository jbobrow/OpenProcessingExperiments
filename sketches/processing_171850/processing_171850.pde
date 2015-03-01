
Log [] logs= new Log[10];
Frog g;
Car [] cars=new Car [10];
void setup() {
  size(400, 600);
  g = new Frog(200,540);

  float x= 0 ;
  for (int i=0; i<cars.length; i++) {
    cars [i]=new Car (x, 380);
    x+=200;
    cars [1] = new Car (260, 420);
    cars[2]= new Car (x, 506);
    cars[3]=new Car (330, 460);
  }
 
  
  for (int i=0; i<logs.length; i++) {
   logs[i]= new Log(x,100);
   x+=100;
   
    logs[1]= new Log(100,150);
      logs[2]= new Log(300,150);
         logs[3]= new Log(400,150);
            logs[4]= new Log(600,150);
            logs[5]= new Log(100,255);
      logs[6]= new Log(300,255);
         logs[7]= new Log(400,255);
            logs[8]= new Log(600,255);
   
   
  }
 
}

void draw() {
  rectMode(CORNER);
  drawBackground();
  g.display();


  for (int i=0; i<10; i++) {

    cars[i].move();
    cars[i].display();
  }
  
  
   for (int i=0; i<10; i++) {
    logs[i].move();
    logs[i].display();
  }
  


  
  } 




void keyPressed() {
  if (key == 'w') {
    g.y -= 40;
  }
  if (key == 'd') {
    g.x += 40;
  }

  if (key=='a') {
    g.x -= 40;
  }

  if (key=='s') {
    g.y +=40;
  }
}


void drawBackground() {
  fill(10, 120, 18);
  rect(0, 3, width, 80);

  fill(10, 10, 200);
  rect(0, 80, width, 200);

  fill(50);
  rect(0, 280, width, 40);

  fill(150);
  rect(0, 320, width, 200);

  for (int x = 10; x<width; x +=80) {
    for (int y = 360; y<520; y +=40) {
      stroke(255, 255, 0);
      line(x, y, x + 20, y);
    }
  }


  fill(50);
  rect(0, 520, width, 40);

  text("score:", 50, 580);
}

class Car {

  float x, y;
  color c;
  float speed;

  Car(float nx, float ny) {
    x=nx;
    y=ny;
    c= color(random(255), random(255), random(255));
    speed = (2);
  }
  void move () {
    x += speed;
    if (x>width)x=-100;
  }

  void display () {
    fill(c);
    rect(x, y, 80, 20);
    fill(c);
    rect (x+10, y, 40, 20);
  }
}
class Frog {

  float x, y;

  color c;

  Frog(float nx, float ny) {
    x=nx;
    y=ny;
    c = color(10, 255, 100);
  }

  void display() {

    fill(c);
    rectMode(CENTER);
    rect(x, y, 40, 40);
    fill(10, 150, 10);
    line(x+8, y+5, x+12, y+5);
    line(x-8, y+5, x-12, y+5);
    line(x+12, y+5, x+12, y+10);
    line(x-12, y+5, x-12, y+10);
    line(x+8, y-5, x+12, y-5);
    line(x-8, y-5, x-12, y-5);
    line(x+12, y-5, x+12, y-10);
    line(x-12, y-5, x-12, y-10);
    fill(0);
    rect(x-4, y-9, 3, 3);
    rect(x+4, y-9, 3, 3);
  }
}
class Log{
  float x,y;
  color c;
  float speed;
  
  Log(float nx, float ny){
    x=nx;
    y=ny;
    
    c=color(#83540D);
    speed= 3;
    
  }
  
  void move(){
    x-=random(5);
    if(-x>width)x=700 ;
    
  }
  void display(){
    fill(c);
    rect(x,y,80,20);
    fill(c);
    rect(x+20, y, 40, 20);
  }
}

