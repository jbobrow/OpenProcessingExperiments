
PImage myImage01;
PImage myImage02;
float x=100;
float y=1;
float speed=1;
float gravity=0.01;


void setup(){
  size(600,600);
  smooth();
}


void draw(){
  background(0);
  stroke(0);
  myImage01=loadImage("03.png");
  myImage02=loadImage("02.png");
  image(myImage02,x,y,30,30);
  //speed += gravity;
  y+= speed;
  image(myImage01,mouseX-85,mouseY-85,170,170);

if(y>mouseY-85 && y<mouseY-70){
  if(x>mouseX-85 && x<mouseY-70){
  y = 0;
  }else{
 y+= speed;
  }
}
}

