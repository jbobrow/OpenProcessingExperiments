
void setup()
{
  size(600 ,600);
  background(255);
  frameRate(5); 
  
  for(int i=0; i<mouseX; i++)
  {
    line(i,0,i, height);
  }
}

void draw(){
  int cnt = mouseY;
  while(cnt>0){
    float x =random(0,width);
    float y =random(0,height);
    triangle(x,y,x-50,y+50,x+50,y+50);
    cnt--;
    fill(random(255),random(255),random(255),random(100));
  }
}
