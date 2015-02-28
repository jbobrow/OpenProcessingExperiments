
Rain drops[]=new Rain[3000];
PImage person;
PImage park;
void setup(){
  size(600,600);
  for(int i=0; i<drops.length;i++){
    drops[i]=new Rain(random(width),random(150,height-150));
  }
  person=loadImage("person.png");
  park=loadImage("park.jpg");
}

void draw(){
  background(255);
 
  strokeWeight(10);
stroke(0);
noFill();
rectMode(CENTER);
rect(height/2,width/2,width+50,300);
  for(int i=0; i<drops.length; i++){
    drops[i].display();
    drops[i].fall();

      
  }
  rectMode(CORNER);
  float shade=255;
  fill(255,255,255,shade);
  noStroke();
  

  rect(mouseX,155,100,290);
image(person,mouseX, 300);

  }
class Rain{
  
  float x;
  float y;
  float speed;
  float wind;
  float dia;
  float shade;
  
  //constructor
  Rain(float x, float y){
    this.x=x;
    this.y=y;
    speed=random(1,6);
    //wind = random(-2,2);
    //dia= map (speed, 0.2,2,1,5); //dia between 1 and 5
    shade= map(speed, 0.2,2,128,255); //between 128 and 255
  }
  
  void display() {
    //float change=dist(mouseX,mouseY,x,0);
    stroke(0,153,255);
    strokeWeight(2);
    line(x,y,x,y+5);
}
void fall(){
  y+=speed;
  
  if (x>width) x=150;
  if(x<0) x=width;
  if(y>height-160) y=150;
  
 
}
}



