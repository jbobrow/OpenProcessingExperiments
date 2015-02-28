
Circle[] circles = new Circle[100];

void setup(){
  size(500,500);
  smooth();
}

void draw(){
  
  background(0);
  
  if(mousePressed)
    
    circles = (Circle[])append(circles, new Circle(mouseX,mouseY)); 
    
  drawScreen();
  for(int i = 0;i<circles.length;i++){
    if(circles[i]!=null)
      circles[i].moreDiam();
  }
  
  
}

public class Circle{
  int x;
  int y;
  int diam;
  int count;  
  
  public Circle(int g, int h){
    x = g;
    y = h;
    diam = 1;
    count = 0;
  }
    
  public void moreDiam(){
    
    if(count == 0){
      if(diam<50)
        diam++;
      else
        count = 1;
    }
    
    if(count == 1){
      if(diam>0)
        diam--;
      else
        count = 0;
    }
  }
}

public void drawScreen(){
  for(int i = 0;i<circles.length;i++){
    if(circles[i]!=null)
      ellipse(circles[i].x,circles[i].y,circles[i].diam,circles[i].diam);
  }
}

