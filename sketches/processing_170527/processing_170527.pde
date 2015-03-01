
String neu = "BTK";

float posx;
float posy;
float x;
float y;
float z;

int value = 1;
int bg = 255;

void setup (){
  size(500,500);
  frameRate(20);
  background(255);
}

void draw(){
  //rect(0,0,width,height);
  
  x = random(0,255);
  y = random(0,255);
  z = random(0,255);
  
  posx = random(width-(width+10),width+10);
  posy = random(height-(height+10),height+10);
  
  value++;
  
  fill(x*z,y-x,z/y);
  if(value < 200){
    textSize(value);
  }
  if(value > 200){
    fill(bg);
    rect(0,0,width,height);
    value = 0;
    bg-=5;
  }
  text(neu, posx, posy);
}
