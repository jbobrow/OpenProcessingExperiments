
int eSize = 40;
int yellow = 0;
int speed = 5;
int gray = 0;

void setup(){
  size (800,800);
  frameRate(10);
  noStroke();
  smooth();
}

void draw(){
  gray += 2*speed;
  yellow += speed;
//円の色
  if(yellow > 255){
    speed = -speed;
    yellow = 255;
  }else if(yellow < 0){
    speed = -speed;
    yellow = 0;
    println("speed =" + speed);
  }
//背景
  if(gray > 255){
    speed = -speed;
    gray = 255;
  }else if(gray < 0){
    speed = -speed;
    gray = 0;
  }
  background(gray);
//入れ子　○
  for(int y = 0; y <= height; y += 40){
    for(int x = 0; x <= width; x += 40){
      ellipse(x,y,eSize,eSize);
      fill(255, 250, 180, random(255));
    }
  }
}
void mousePressed(){
  speed = 15;
}

void mouseReleased(){
  speed = 5;
}


