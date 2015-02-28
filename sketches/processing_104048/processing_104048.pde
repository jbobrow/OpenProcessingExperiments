
Bot b[] = new Bot[100];

void setup(){
  colorMode(HSB,100);
  noStroke();
size(500,500);
smooth();
for(int i=0;i<b.length;i++){
  b[i] = new Bot(random(width),random(height),random(5,15));
  }
}

void draw(){
  colorMode(RGB,255);
  //background(255);
  fill(255,255,255,40);
  rect(0,0,width,height);
  for(int i=0;i<b.length;i++){
  b[i].render();
  }
}

void mousePressed(){
 for(int i=0;i<b.length;i++){
  b[i] = new Bot(mouseX,mouseY,random(5,15));
  }
}

class Bot{
float x=0;
float y=0;
float d=0;
float a=0;
int c=0;
float m=0;

Bot(float newX, float newY, float newD){
  x=newX;
  y=newY;
  d=newD;
  a=random(360);
  c=(int)random(100);
  m=random(1,3);
  }
  
 void render(){
   float xChange = cos(radians(a))*m;
   float yChange = sin(radians(a))*m;
   x+=xChange;
   y+=yChange;
   a++;
   colorMode(HSB,100);
   fill(c,100,100);
    ellipse(x,y,d,d); 
    
 }
}
