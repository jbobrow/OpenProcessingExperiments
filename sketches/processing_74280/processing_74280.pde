
float X;
float Y;
float W;
float Theta;

void setup(){
 size(400,400);
 colorMode(RGB,100);
 background(100);
 frameRate(30);
  noStroke();
 X = 200;
 Y = 200;
 W= 200;
 Theta = 0;
}

void draw(){
 Theta = Theta+0.1; //位相の更新。更新する量（+0.1）を「角速度」とも言う。
 W = 100*sin(Theta) + 200; // X軸方向の単振動 [振幅 * sin(位相) + 中心座標]
 fill(100);
 rect(0,0,width,height);
 fill(0); 
 ellipse(X,Y,W,200);
}
