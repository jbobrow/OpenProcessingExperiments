
void setup(){
  size(500, 500);
}

void draw(){
  fill(random(255));
  background(255);
  for(int i=1; i<=width; i+=5)
  {
    background(255);
    for(int j=1; j<=height; j+=5)
      {
        for(int k=1; k<=height; k+=10)
        {  
          ellipse(i*sin(radians(j)), random(k), mouseX, 1);
        }
      }
  }

}


