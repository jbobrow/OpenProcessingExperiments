
int count=0;
int increment=1;
void setup()
{
  size(250, 250);
  background(255);
  fill (#FA0A72);
  smooth();
}
 
void draw() {
  drawEllipse(mouseX, mouseY, pmouseX, pmouseY);
}
 
void drawEllipse(int x, int y, int px, int py) {
if (mousePressed==true) {
 
  count=count+increment;
   
  
}
 
if (count>25){
  increment =-1;
}
if (count<=0){
  increment=1;
}
   
 
fill(count*10,count*10,count*5);
  float speed = abs(x-px) + abs(y-py);
  stroke(speed);
  ellipse (x, y, speed, speed);
  fill(#FA0A72);
  stroke(count*10,count*10,count*5,55);
  ellipse (x, y, speed+10*count/5, speed+10*count/5);
   fill(count*10,count*10,count*5,25);
  stroke(count*10,count*10,count*5,25);
  ellipse (x, y, speed+20*count/5, speed+20*count/5);
   
   
}

