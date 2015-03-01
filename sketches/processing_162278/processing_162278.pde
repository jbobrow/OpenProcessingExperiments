
void setup(){
  size(400,400);
}

void draw(){
background(255);
drawMonster(mouseX,mouseY);
}

void drawMonster(int x, int y){
  fill(0);
  ellipse(x,y,100,100);
  rect(x-35,y+35,70,70);
  rect(x-40,y-90,70,70);
  ellipse(x-75,y-35,70,70);
  ellipse(x+75,y+30,70,70);
  fill(255);
  ellipse(x+65,y+25,30,30);
  ellipse(x-65,y-25,30,30);
  rect(x-15,y+55,30,30);
  ellipse(x-5,y-65,30,30);
  rect(x-15,y-15,30,30);
  fill(0);   
  rect(x-10,y+55,5,5);
  rect(x-0,y+55,5,5);
  rect(x-10,y+80,5,5);
  rect(x-0,y+80,5,5);
if (mousePressed){ 
  fill(0,255);
  ellipse(x+70,y+30,10,10); 
  ellipse(x-70,y-30,10,10); 
  ellipse(x-5,y-65,10,10);
  }
}

