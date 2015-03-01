
void setup()
{
  size(600,600);
  background(0);
  frameRate(350);
  
  
}


void draw(){
  
  int cnt = mouseY;
  if (cnt>0){
    fill(random(0,255),random(0,255),random(0,255));
    float x= random(0,width);
    float y = random(0, height);
    ellipse(x,y,20,20);
    
  }
  

}
