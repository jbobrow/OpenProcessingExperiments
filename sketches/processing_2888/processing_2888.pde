
PImage b;
float x;
float num, y;

void setup(){
  b = loadImage("flower.gif");
  size(350,350);
  background(255);
  x = random(0,255);
  noStroke();
}

void draw(){
  imageMode(CENTER);
  image(b,(width/2),(height/2));
  if(((second()/10)/21)==0){
  fill(255,millis()/100);
  } else {
  fill(255,millis()*100);
  }
  ellipse(width/2,height/2,300,300);
 }


void keyPressed(){

}





