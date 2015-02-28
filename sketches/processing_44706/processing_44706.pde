
void setup(){
  size(500,300);
  background(255);
  smooth();
  fill(200);
  strokeWeight(0.25);
  stroke(120);

}

void draw(){
  //background(204);
  
  int x= mouseX;
  int y=mouseY;

line(x,120,y,50);
line(y,x,250,70);
line(90,50,x,y);
line(x,50,160,y);
line(130,y,x,200);
line(y,50,200,x);

  
 }

