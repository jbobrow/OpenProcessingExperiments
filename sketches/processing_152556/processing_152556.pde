
int num = 20;
int front;
int align;
int size;
int radius;
void setup(){
  size(800,400);
  //front = width;
  align = 50 ;
  front = (width-2*align)/num-1;
  int size = 5;
  radius = height/6;
}
void draw(){
  background(255);
  noStroke();
  fill(0,0,255);
  float angel = radians(frameCount % 360);
  for(int i = 0; i < num; i++){
    
     float newAngel = angel + radians(360/(num-1)*i);
     float newX = align+front*i;
     float newY = height/2+radius*sin(newAngel);
     stroke(#D3CBCB);
     strokeWeight(3);
     ellipse(newX,newY,10,10);
     stroke(255,0,0);
     //ellipse(120+i*distance,height/2-radius*sin(angel+radians(45*i)),20,20);
     line(newX,newY,width/2,height);
  }
}
