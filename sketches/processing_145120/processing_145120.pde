
class Bouncyball {
  
float x = random(50, width-50);
float y = random(50, height-50);
float xspeed = 3;
float yspeed = 3;

float t = random(0, 1);
float u = random(0, 1);
float z = random(10, 50);




  Bouncyball(){
  }
  
 void display(){
   
  float x = noise(t);
  x = map(x,0,1,0,width);
  
  float y = noise(u);
  y = map(y,0,1,0,height);
  
    noStroke();
    fill(0, 50);
    ellipse(x, y, z, z);
  }
  
 void moving(){   
  t = t+ 0.01;
  u = u+ 0.011;
 }
  
 void bounce(){
    if ((x < 0 + 25) || (x > width - 25)){
      t = t * -1;
    }
    
    if ((y < 0 + 25) || (y > height - 25)){
      u = u * -1;
    }
  }
}  


int total= 20;

Bouncyball[] balls = new Bouncyball[total];

void setup(){
  size (600, 400, P2D);
  for(int i=0; i<total; i++){
  balls[i] = new Bouncyball();
  }
}

void draw(){
  background(255);
  
  for(int i=0; i<total; i++){
  
  balls[i].display();
  balls[i].moving();
  balls[i].bounce();
  
  }
}

