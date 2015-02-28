
//Sheep Dog Game
PImage dog;
PImage sheep;
float x;
float y;
float easing;
float dx;
float dy;

void setup(){
  size(800,800);
  smooth();
  background(41,149,27);
  dog = loadImage("BorderCollie.png");
  sheep = loadImage("Sheep.png");
  x=600;
  y=200;
  easing=.05;
}

void draw(){
  //field
  background(41,149,27);
  noStroke();
  fill(48,103,27);
  rect(300,500,200,200);
  strokeWeight(10);
  stroke(170,119,41);
  line(300,500,300,710);
  line(290,700,510,700);
  line(500,710,500,500);
  
  //strokeWeight(3);
 // stroke(196,196,196);
  //fill(255);
  //ellipse(x,y,50,75);
  
  image(dog,mouseX,mouseY);
  image(sheep,x,y);
  
  if(x>=300 && x<=500 && y>=500 && y<=700){
    dx = 0;
    dy = 0;
  }
    else if(dist(mouseX,mouseY,x,y)<150){
      dx = mouseX - x;
      dy = mouseY - y;
      x = x - dx * easing;
      y = y - dy * easing;
    }
}
  


 

