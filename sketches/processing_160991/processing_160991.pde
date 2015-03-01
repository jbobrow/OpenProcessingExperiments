
void setup(){
  size(500,500);
  
}

void draw(){
  background(255);
  drawSfigure(mouseX,mouseY);
  if(mousePressed){

  }
}

void drawSfigure(int x,int y){
  int w = 100;
  int l = x - 40;
  int h = y - 40;
  int r = x + 40;
  float c = 0;
  float c1 = 0;
  float c2 = 0;

  if(mousePressed){
  c = random(200);
  c1 = random(300);
  c2 = random(400);
  }
  
  
  fill(c,c1,c2,200);
  stroke(0);
  ellipse(x,y,w,w);
  line(x,y+50,x,y+200);
  line(x-50,y+75,x+50,y+75);
  line(x,y+200,x+50,y+300);
  line(x,y+200,x-50,y+300);
}
