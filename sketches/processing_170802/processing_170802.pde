
int angle;
int eSize = 150; 
int speed = 1;
int x = 0;  //オブジェクトのx座標

void setup (){
  size(500,500,P3D);
   frameRate(60); 
  angle=0;
}

void draw(){
  background(100);
  angle ++;
  if(angle > 360) angle=0;
  fill(100,mouseY,mouseX);
  translate(x,mouseY);
  for(int i= 0; i<7;i++){ //sikakkei kazu
   
    rotateY(radians(angle/2));   
     rotateX(radians(angle*5)); 
      rotateZ(radians(angle+20)); 
   box(eSize,eSize,eSize);
     x = x + speed;    //x座標にspeedの値を足す
   if(x > width || x < 0) {
    speed = -speed;    //speedの正負を入れ替える
  }
}
}


