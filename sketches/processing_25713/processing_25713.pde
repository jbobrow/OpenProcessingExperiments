
Ball[] balls = new Ball [1];
float gravity = 0.1;

int r;
int g;
int b;
float circleX;
float circleY;
float circleZ;
int x = 0;
int speed = 1;



void setup(){
  
  size(495,495);
  smooth();
  frameRate(50); //set to 50 frames per second
  
  PImage snowy = loadImage("snowy.jpg");
  tint(255);
  image(snowy,0,0);
  
   balls [0] = new Ball (50,0,16);

}

void draw(){
  
      
  circleX = random(30,70);
  circleY = random(10,50);
  circleZ = random(5,12);
  
  r = mouseY;
  g = mouseX;
  b = mouseY;
  
  
  //crazy duck
  
background(loadImage("snowy.jpg"));
  ellipseMode(CENTER); 
  rectMode(CENTER);
  
  //balls
  for (int i = 0; i < balls.length; i++){
    balls[i].gravity();
    balls[i].move();
    balls[i].display();
    
  }
  
  //crazy duck head
  stroke(255,213,0);
  fill(255,213,0);
  ellipse(mouseX,mouseY-75,150,150);
  
  //crazy duck smile
  stroke(255,141,0); //orange
  strokeWeight(5);
  line(mouseX-60,mouseY-60,pmouseX+100,pmouseY+100);
  
  //crazy duck body
  stroke(255,213,0);
  fill(255,213,0);
  ellipse(mouseX,mouseY+100,225,250);
  
  //crazy duck feet
  stroke(255,141,0); //orange
  fill(255,141,0); //orange
  rect(mouseX-62,mouseY+200,50,50);
  rect(mouseX+62,mouseY+200,50,50);
  
  //crazy duck eyes
  stroke(255); //white
  fill(255);
  ellipse(mouseX-35,mouseY-85,40,40);
  ellipse(mouseX+30,mouseY-75,circleX,circleX);
  
  //crazy duck pupils
  stroke(0);
  fill(0);
  ellipse(pmouseX-35,pmouseY-85,10,10);
  ellipse(pmouseX+40,pmouseY-80,circleY,circleY);
  
  //crazy duck light in pupils
  stroke(pmouseX,150,pmouseY); //colour changes with mouse location
  fill(mouseX,150,mouseY); //colour changes with mouse location
  ellipse(pmouseX-37,pmouseY-87,3,3);
  ellipse(pmouseX+45,pmouseY-85,circleZ,circleZ);
  
  
}

void keyPressed(){
  stroke(255,0,200); //feet flash to pink
  fill(255,0,200); //feet flash to pink
  rect(mouseX-62,mouseY+200,50,50);
  rect(mouseX+62,mouseY+200,50,50);
  

}

void mousePressed(){
  Ball b = new Ball (mouseX, mouseY, 10);
  
  balls = (Ball[]) append(balls,b);
  
}

class Ball {
  float x;
  float y;
  float speed;
  float w;
  
  Ball (float tempX, float tempY, float tempW){
    x = tempX;
    y = tempY;
    w = tempW;
    speed = 0;
    
  }
  
  void gravity() {
    speed = speed +gravity;
  }
  
  void move(){
    y = y + speed;
    if (y>height){
      speed = speed * -0.95;
      y=height;
    }
  }
  
  void display(){
    fill(255);
    noStroke();
    ellipse(x,y,w,w);
    
  }
  
}






