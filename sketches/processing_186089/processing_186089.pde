
float Xinthebox;
float Yinthebox;
int z;

void setup(){
  size(640,480);
 
}
void draw(){
    background(100);
          fill(0,0,255);
  ellipse(360,300,400,300);
  fill(0);
  ellipse(360,360,250,z);
  fill(255);
  int x=mouseX;
  int y=mouseY;
  Xinthebox = map(x,0,639,320-20,320+20);
  Yinthebox = map(y,0,479,240-20,240+20);
  ellipse(320,240,100,100);
    ellipse(400,240,100,100);
  fill(0);
  ellipse(Xinthebox,Yinthebox,20,20);
   ellipse(Xinthebox + 80,Yinthebox,20,20);
   fill(200,150,100);
    ellipse(mouseX,mouseY,50,50);
    fill(0);
    ellipse(mouseX-10,mouseY+10,15,15);
    ellipse(mouseX+10,mouseY+10,15,15);
    ellipse(mouseX, mouseY-10, 15,15);
    if(mouseX >mouseY){ 
    z = 125; 
  }else {
  z=10;
}
}
