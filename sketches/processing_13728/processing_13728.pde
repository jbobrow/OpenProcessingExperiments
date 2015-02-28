
void setup(){
  size(200,200);
colorMode(RGB);
}

void draw(){
  
  for(int x=0; x<220; x=x+15)
  for(int y=0; y<250; y=y+15)
  {
  fill(random(250),100,250);

rect(x,y,50,50);

  }
 
}
                
