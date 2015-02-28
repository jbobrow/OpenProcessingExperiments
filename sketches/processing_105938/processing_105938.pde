
Monster bob = new Monster();
Monster hank = new Monster();
Monster dean = new Monster();
Monster tom = new Monster();

void setup() {
  size(400, 400);
  bob.prime(60, height/2);
  hank.prime(150, height/2);
  dean.prime(240, height/2);
  tom.prime(330, height/2);
}

void draw() {
  smooth();
  background(255);
  bob.animate();
  hank.animate();
  dean.animate();
  tom.animate();
  }
  
  class Monster{

float x;
float y;
float speedY;


void prime(float a, float b){
x=a;
y=b;
speedY = random(5,10);
}

void animate(){
//Body
fill(0);
ellipse (x, y, 80, 80);

//Eyes
fill(255);
rect(x-15, y-8, 10, 10);
rect(x+10, y-8, 10, 10);

//Mouth

stroke(0);
fill(255);
ellipse(x+3, y+20, 20, 20);
}
}

void move() {
  
    if(mousePressed){
        y+=speedY;
         
   }  
}
