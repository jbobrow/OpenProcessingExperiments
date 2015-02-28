
int x=0,y=0,z=10;
void setup(){
  size(500, 500);
}
void draw(){
  background(0);
  textSize(z);
  fill(255,0,0);
  text("S2",x,y);
}
 void keyPressed(){
   if(keyCode == UP)
     y-=5;
     if(keyCode == DOWN)
     y+=5;
     if(keyCode == RIGHT)
     x+=5;
     if(keyCode == LEFT)
     x-=5;
     if(key == 'a')
     z+=5;
     if(key == 'z')
     z-=5;
 }
