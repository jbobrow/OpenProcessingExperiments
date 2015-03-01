
//window function
void setup(){
size(600,400);
background(255);
}

void draw(){
  drawBuildingandGround(width/2,height/2);
  int x = 250;
  int y = 80;
  while(y<height){
    drawWindow(x,y);
    drawWindow(x+100,y);
   y+=80;
  }
  drawDoor(300,320);
}

void drawWindow(int x, int y){
 strokeWeight(2);
stroke(0);
rectMode(CENTER);
rect(x,y,30,30);
//verticle line
line(x,y-15,x,y+15);
//horizontal line
line(x-15,y,x+15,y);
}

void drawBuildingandGround(int x, int y) {
  rectMode(CENTER);
  rect(300,200,200,300);
  line(0,350,600,350);
  }
  
void drawDoor(int x, int y) {
  rectMode(CENTER);
  rect(300,y,30,60);
}
