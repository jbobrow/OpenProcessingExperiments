
int x = 20;
int y = 240; 
void setup(){
  background(0,0,0);
  size(640,520);
  
  
}

void draw(){
  
  x = mouseX;
  y = mouseY;
  
  fill(0,0,100);
 
  ellipse(320,150,300,200);
  
  ellipse(320,200,500,100);
  fill(0,0,0);
  ellipse(320,200,300,70);
  fill(190,110,70);
  ellipse(320,265,350,200);
  fill(255,255,255);
  ellipse(250,240,80,80);
  ellipse(395,240,80,80);
 
  fill(190,110,70);
  arc(323,275, 50, 50, -PI, 0);
  fill(0,0,0);
  arc(323,330, 50, 50, -PI, 0);

 fill(0,0,0);
  ellipse(x,y,40,40);
  ellipse(x+140,y,40,40);
}
