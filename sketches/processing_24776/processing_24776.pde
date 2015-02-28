
int num = 25;

Walk[] myWalk = new Walk[num];
color[] myColor = new color[3];

void setup(){
  size(500,500);
  background(255);
  
  myColor[0] = color(255,0,0,50);
  myColor[1] = color(0,255,0,50);
  myColor[2] = color(0,0,255,50);
  
  for(int i=0; i< num; i++){
    myWalk[i] = new Walk();
  }
}

void draw() {
  for( int i=0; i< num; i++){
    myWalk[i].update();
    myWalk[i].draw();
  }
}

class Walk{
  
  float x = random(100,width-100);
  float y = random(100,height-100);
  
  color col = myColor[floor(random(0,3))];
  
  Walk() {
  }
  
  void update() {
    x = x+ random(-2,2);
    y = y+ random(-2,2);
    
    if(x > width) {
   x =x-1;
    }
    if(x < 0) {
   x =x+1;
    }
    if(y > height) {
   y =y-1;
    }
    if(y < 0) {
   y =y+1;
    }
  }

void draw() {
  noStroke();
  fill(col);
  ellipse(x,y,10,10);
}

}

