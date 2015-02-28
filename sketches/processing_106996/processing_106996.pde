
int y = 0;
int x = 0;
PImage img;
PImage img2;
PImage img3;
void setup()
{
    size(500,500);
    frameRate(25);
    img=loadImage("solfeliz.png");
    img2=loadImage("aviao.png");
    img3=loadImage("mickey.png");
}

void draw(){
  background(255);
  //imagens
  image(img,25,25);
  image(img2,250,25);
  image(img3,227,170,50,50);
  //pernas
  line(250,325,250+x,400);
  line(250,325,250-x,400);
  //pista
  line(0,450,500,450);
  line(0,350,500,350);
  
  for(int y=0;y<1500;y+=20){
    rect(y+x-400,400,20,20);
}
  //corpo
  line(250,325,250,220);
  //braços
  line(250,250,200,mouseY);
  line(250,250,300,mouseY);
  
}
void keyPressed(){ 
  if(key ==CODED){
  if(keyCode == RIGHT){
    x+=2;}
    if(keyCode ==  LEFT){
      x-=2;}
}
}


