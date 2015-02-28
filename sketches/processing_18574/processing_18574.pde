
void setup(){
  size(400,400);
 
  
}
int x = 10;
int y = 10;

void draw(){
 background(10,15,23);
 colorMode(HSB,100);
 fill(x/4,x,x);
  rect(mouseX,mouseY,x,y);
   
  x++;
  y++;
  if(x>400){
    x = 0;
    if(y>400){
      y=0;
    }
  }
}

