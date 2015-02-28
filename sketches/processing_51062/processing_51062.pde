
void setup(){
  size(1000,400);
  colorMode(HSB,360,100,100,100);
  smooth();
}

void draw(){
  for(int x = 0;x < width; x+=10){
    for(int y = 0;y < height; y+=10){
      if(mouseX > x && mouseX < x+10 && mouseY > y && mouseY < y+10){
       fill(mouseX,300,300); 
      } else{
       noFill(); 
      }
      rect(x,y,mouseX,30);
      if(x%40 == 0 && y%40 ==0){
        ellipse(x,y,mouseX/10,mouseY/10);
      }
      
    }
  }
}

void mouseReleased(){
  background(255);
}

