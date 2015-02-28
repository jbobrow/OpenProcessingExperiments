
void setup(){
size(400,400);
smooth();
}

void draw(){
  background(200);
  drawEllipse(mouseX,mouseY,50,0,int(map(mouseX, 0,200,0,255)));
 

  drawEllipse(25,25,50,0,#FF0000);
drawEllipse(394,6,10,255,#14FF00);
drawEllipse(15,385,30,100,#00FFFD);
drawEllipse(360,360,80,170,#FFF700);


}

void drawEllipse(float x,float y,float mySize, int cStroke, color cFill){
  stroke(cStroke);
  fill(cFill);
 ellipse(x,y, mySize,mySize);
  
  
}



