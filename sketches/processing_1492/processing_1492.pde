
float x,y,w,h;
void setup()

{ 
  size(500,500);

 background(255);
  x=50;y=30;w=40;h=50;
frameRate(45);
  size(600,600);
  
}

void draw(){
  for(int i = 0; i < 40; i = i+1)
  point(random(100,200),random(100,200));
 
}



