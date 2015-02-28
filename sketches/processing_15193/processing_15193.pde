


void setup(){
  size(600,600);
  smooth();
}

void draw(){
  background(255);
  
  
drawMan(100,100,0,100,100,1);
drawMan(300,100,25,100,100,5);
drawMan(500,100,50,100,100,10);
drawMan(100,300,75,100,100,15);
drawMan(300,300,100,100,100,20);
drawMan(500,300,125,100,100,25);
drawMan(100,500,150,100,100,35);
drawMan(300,500,175,100,100,45);
drawMan(500,500,200,100,100,60);


}


void drawMan(int x, int y, int c, int x2, int y2, int sex){
  stroke(c);
  strokeWeight(sex);
  line(x-(x2-20), y, x+(x2-45), y-(y2-35));
  line(x, y-(y2-20), x+(x2-45), y+(y2-30));
  line(x+x2, y-y2, x, y);
  line(x-x2, y+y2, x+(x2-40), y+(y2-30));
  line(x+x2, y+y2, x+(x2-45), y +(y2-30));
  ellipse(x,y-80,30,30);
}

