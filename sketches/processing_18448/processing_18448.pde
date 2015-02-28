

int x = 120;
void setup(){
  size (300,300);
}
void draw(){
  background(204,204,204);
   fill(152,24,18);
ellipse(x,height/2,50,50);
fill(255,220,29);
rectMode(CENTER);
rect(x+50,height/2,50,70);
fill(13,91,155);
ellipse(x*2,height/2,45,80);
fill(63,155,8);
rect(width-x,height/2,20,70);
fill(228,76,0);
ellipse(x/2,height/2,20,40);
fill(139,56,165);
ellipse(mouseX,height/2,20,20);
  
}





