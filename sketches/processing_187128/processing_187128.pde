
int x = 20;
int y = 240;
void setup(){
  background(255);
  size(500,500);
   
   
}
 
void draw(){
   
  x = mouseX;
  y = mouseY;
   

 fill(x,y,0);
  rect(x,y,60,60);
  rect(x+10,y+10,50,50);
  rect(x+20,y+20,40,40);
  rect(x+30,y+30,30,30);
  rect(x+40,y+40,20,20);
}



