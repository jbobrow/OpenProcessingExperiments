
int x, y;

void setup(){
  background(0);
  size(500,500);
}

void draw(){
  x = width/2;
  y = height/2;
  
  if((mouseX >= x-25 && mouseX <= x+25) && (mouseY >= x-25 && mouseY <= x+25)){
    fill(5,169,255);
  }else{
    fill(255,5,139);
  }
    
  rectMode(CENTER);
  rect(x,y,50,50);     
}



