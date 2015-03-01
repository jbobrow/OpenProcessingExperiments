
boolean mousePressed =  ;  
int circleX = 0;  
int circleY = 100;

int xx = 0;
int xxspeed = 8; //the speed of the colors
int direction = -1;//direction it's going in
 
float color1=random(255); //any color is chosen on this scale
float color2=random(255);
float color3=random(255);
 
void setup(){
   
size(640, 360); //Size of canvas
background(0);//The background's color
noStroke();
frameRate(10);
stroke(255, 255);
 
}
 
void draw(){
  
int xgridSize = 100;
int ygridSize = 50;
 
for (int x = xgridSize; x <= width - xgridSize; x += xgridSize) {
  for (int y = ygridSize; y <= height - ygridSize; y += ygridSize) {
    fill(color1, color2, color3); //the colors being randomly chosen
    
    strokeWeight(0.1);
    line(x, y, xx, height/2);
 }
}
stroke(color1, color2, color3);
xx+=xxspeed;
 
if(xx >= width || xx<=0){
  xxspeed*=direction;
  color1 = random(255);
  color2 = random(255);
  color3 = random(255);
   
  stroke(color1, color2, color3);
}
}

