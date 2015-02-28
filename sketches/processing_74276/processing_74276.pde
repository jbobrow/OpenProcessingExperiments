
float X;
float Y;
float VY;
float GRAVITY;

void setup(){
 size(400,400);
 colorMode(RGB,100);
 background(100);
 frameRate(30);
  noStroke();
 X = 200;
 Y = 30;
 VY= 0;
 GRAVITY = 1;
}

void draw(){
 if(Y > height){
  VY = VY * -1; //-1をかけると完全弾性衝突となる。
  Y = height;
 }
 VY = VY + GRAVITY; //Y方向の加速度の更新
 Y = Y + VY; //Y方向の速度の更新
 fill(100);
 rect(0,0,width,height);
 fill(0,0,Y); 
 ellipse(200,200,Y,Y);
}
