
void setup(){
  size(600,400);
}

void draw(){
 background (100); 
  stickman(mouseX, mouseY);


}
void stickman(int x, int y){
  fill(255);
  ellipse(x, y - 30, 20,20);
  strokeWeight(2);
  line(x,y-20,x,y+20);
  line(x,y+20, x+15, y+ 40);
  line(x, y+20, x-15, y+40);
  line(x, y-5, x+20, y-10);
  line(x, y-5, x-20, y-10);
}
