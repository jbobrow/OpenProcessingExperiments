
void setup(){
  size(600,600);
}

   
    float y = 100;
    float x = 200;
    float s = 1;
    float v = 1;
    
   
    
void draw(){
    if (y>750)
    {
      y = 0;
      v = random(40);
    }
    if (x>750)
    {
      x = 0;
      s = random(10);
    }
    background(13,1,1);
    ellipse(x,y,100,100);
    ellipse(y,x,100,100);
    ellipse(x,x,100,100);
    ellipse(y,y,100,100);
    x = x + s;
    y = y + s;



}

