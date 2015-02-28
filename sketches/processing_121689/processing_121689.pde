
//pvectorとarraylistを使ってballをクラスで生成．プロトタイプ

ArrayList<Ball> balls;
void setup(){
  size(400, 400);
  colorMode(HSB, 100);
  smooth();
  noStroke();
  balls = new ArrayList<Ball>();
}

void draw(){
  background(50, 20, 40);
  for(int i=0; i<balls.size(); i++){
    Ball comeBall = balls.get(i);
    comeBall.drawMe();
    comeBall.moveMe();
    comeBall.collision();
  }
}
void mousePressed(){
  balls.add(new Ball());
}

class Ball{
  float x, y;
  float sz;
  float spX, spY;
  PVector vec;
  PVector pos;
  PVector dec;
  Ball(){
    x = width/2;
    y = height/2;
    sz = random(5, 40);
    pos = new PVector(width/2, height/2);
    vec = new PVector(random(-10, 10), random(-10, 10));
    dec = new PVector(0.8, 0.8);
  }
 void drawMe(){
  ellipse(pos.x, pos.y, sz, sz);
 }
 void moveMe(){
   for(int i=0; i<balls.size(); i++){
     this.vec.mult(dec);
     this.pos.add(vec);
   }
 }

 //以下調整中

 void collision(){
   boolean touch = false;
   for(int i=0; i<balls.size(); i++){
      Ball otherball = balls.get(i);
     if(otherball != this){
       float dis = dist(this.pos.x, this.pos.y, otherball.x, otherball.y);
       if((dis - this.sz - otherball.sz)<0){
         touch = true;
         break;
       }
     }
   }
   //ここまではso far so good
   
   if(touch == true){
     PVector vec = new PVector(random(-10, 10), random(-10, 10));
     this.pos.add(vec);
   }
 }
   
}


