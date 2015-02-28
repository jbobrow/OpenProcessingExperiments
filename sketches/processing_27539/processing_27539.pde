
int x = (30);
int y = (10);
PImage man;


void setup(){
  size(450,450); 
  background(0,174,239);
  strokeWeight(12);
  stroke(random(255),random(255),random(255));
  man= loadImage("1-up.gif");
}

void draw (){
  stroke(random(255), random(255), random(255));
  line(x, y, mouseX, mouseY);
  x = x + 10;
  if(x > 450){
    x= 0;
  y = y + 20;
  if(y > 450){
    y = 30;
  }
  }
}
void mousePressed(){
    image(man, random(0,450), 0+random(0,450)); 
}

