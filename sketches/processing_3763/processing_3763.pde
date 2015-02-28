
Hill[] hills;
static float SMOOTHNESS = .8;
float range;

void setup(){
  size(600,400);
  initialize();
}

void initialize(){
  hills = new Hill[1];
  hills[0] = new Hill(0,height/2,width,height/2);
  range = height/2;
}

void mouseClicked(){
  Hill[] temp = new Hill[hills.length*2];
  int index = 0;
  for(int i = 0; i < hills.length; i++){
    float x = (hills[i].x1 + hills[i].x2) / 2;
    float y = (hills[i].y1 + hills[i].y2) / 2;
    y -= random(-range,range);
    range *= SMOOTHNESS;
    temp[index] = new Hill(hills[i].x1,hills[i].y1,x,y);
    index++;
    temp[index] = new Hill(x,y,hills[i].x2,hills[i].y2);
    index++;
  }
  hills = temp;
}

void keyPressed(){
    initialize(); 
}

void draw(){
  background(255);
  for(int i = 0; i < hills.length; i++){
    hills[i].display(); 
  }
}

class Hill{

  float x1,y1,x2,y2;

  Hill(float x1, float y1, float x2, float y2){
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
  }

  void display(){
    stroke(0);
    line(x1,y1,x2,y2);
  }
}


