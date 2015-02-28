
float x;
float y;

void setup(){
  size(500,500);
  background((color)75,75,255);
}
void draw(){
  x = width/2;
  y  = height/2;
  fill(200,50,50);
  ellipse(x,y,20,20);
  if(mousePressed == true){
    if(mouseX>x-10 && mouseX<x+10 && mouseY>y-10 && mouseY<y+10)
    fill(50,200,50);
    ellipse(60,60,20,20);
    if(mouseX>470 && mouseY>470)
    fill(200,100,150);
    ellipse(x,y,300,300);
  }
}
    
    
  
                
                
