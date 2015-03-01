
int r1;
int g1;
int b1;
int x1 = -35;
int y1 = 0;



void setup (){
  size(500,500);
  frameRate(10);
}

void draw(){
  while(y1 < 600){
  r1 = int(random(255));
  g1 = int(random(255));
  b1 = int(random(255));
  pattern(r1,g1,b1,x1,y1);
  
  x1 = x1 + 35;
  if(x1 > width){
    x1 = -35;
    y1 = y1 + 40;
  }
  }
  
  
}

void pattern(int r, int g, int b, int x, int y){
  noStroke();
  fill(r,g,b);
  beginShape();
  vertex(x,y);
  vertex(x+30,y+0);
  vertex(x+30,y+30);
  vertex(x+50,y+30);
  vertex(x+50,y+15);
  vertex(x+45,y+15);
  vertex(x+45,y+10);
  vertex(x+55,y+10);
  vertex(x+55,y+35);
  vertex(x+25,y+35);
  vertex(x+25,y+5);
  vertex(x+5,y+5);
  vertex(x+5,y+20);
  vertex(x+10,y+20);
  vertex(x+10,y+25);
  vertex(x+0,y+25);
  endShape();
}


