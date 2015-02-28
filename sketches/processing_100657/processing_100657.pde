
Bean b1, b2, b3;
Player p1; 


void setup(){
  size(800,600);
  frameRate(24);
  b1 = new Bean(200,300,55);
  b2 = new Bean(100,200,55);
  b3 = new Bean(222,222,55);
  p1 = new Player(300,300,.1);
}

void draw(){
  background(255);
  b1.display();
  b2.display();
  b3.display();
  p1.display();
}





  
    
class Bean {
  int timer = 0;
float fX;
float fY;
int respawn;

Bean(float tempX, float tempY, int tempTime){
  fX = tempX;
  fY = tempY;
  respawn = tempTime;
}

void display(){
    timer++;
  if(timer >= respawn){
    fX = random(width);
    fY = random(height);
    timer = 0;
  }
  float distance = dist(p1.pX,p1.pY,fX,fY);
  if(distance < 40){
    fX = random(width);
    fY = random(height);
    timer = 0;
    println("collision");
  }
  fill(#FF0808);
ellipse(fX, fY,10,10);
}
  }

class Player {
  float pX;
float pY;
float easing = 0.1;
PImage cha;


Player(float tempX, float tempY, float tempEasing){
  pX= tempX;
  pY = tempY;
  easing = tempEasing;
    cha = loadImage("cha.jpg");
}

void display(){
  float targetX = mouseX;
  float targetY = mouseY;
  pX += (targetX - pX) * easing;
  pY += (targetY - pY) * easing;
  fill(#15838E);
  image(cha,pX, pY, 40, 40);
}
}


