

PImage a;
PImage b;


void setup(){
  size(600,600);
  
  a= loadImage("001.JPG");
 // imageMode(CENTER);
  noCursor();
  
}

void draw(){
  background(192);
  if(mouseY>100){
  image(a, 100, mouseY, a.width/4, a.height/4);
  }
  ellipse(300,300,100,100);
 
 }


