
int num=25;


walkPoint [] myPoint = new walkPoint[num];
color[] myColors = new color[4];

void setup() {

  size(200,200);

  
  myColors[0] = color(255,0,mouseX,50);
  myColors[1] = color(0,255,0,50);
  myColors[2] = color(0,0,255,50);
  myColors[3] = color(255,50);
  
   for(int i=0;i<myPoint.length;i++){
    myPoint[i] = new walkPoint();
  background(0);
}
}
void draw() {
  

  for(int i=0; i < myPoint.length; i++) {
    myPoint[i].update();
    myPoint[i].draw();
  }
}

class walkPoint{
  float x = random(50,150);
  float y = random(50,150);
  color col = myColors[floor(random(0,4))];
  
  walkPoint(){
  }
  
  void update() {
    x=x+random(-1,1);
    y=y+random(-1,1);
  }
  void draw(){
    stroke(col);
    point(x,y);
  }
}
  


