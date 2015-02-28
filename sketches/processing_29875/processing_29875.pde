
int x;
int y;
int speed;
int diam;
 
void setup (){
  size(600,800);
  smooth();
  x=width/2;
  y=height/2;
  speed=10; 
  diam=50;
}
 
 
void draw(){
   
   
  background(255);
  fill(0);
  textAlign(CENTER);
  text("use arrow keys to move", width/2, height-50);
  text("+/- to increase/decrease speed", width/2, height-40);
  text("d/s to increase/decrease ball size", width/2, height-30);
  text(speed, width/2, height-height+20);
  text("speed:", width/2, height-height+10);
  text(diam, width/2, height-height+50);
  text("ball size:", width/2, height-height+40);
  fill(255,255,0);
  ellipse(x,y,diam,diam);
 
if (x>width-diam/2){
 x=width-diam/2;
}
if (y>height-diam/2){
 y=height-diam/2;
}
if (x<diam/2){
 x=diam/2;
}
if (y<diam/2){
 y=diam/2;
}
if (speed<1){
 speed=1;
} 
if (speed>100){
 speed=100;
} 
if (diam<11){
 diam=10;
} 
if (diam>200){
 diam=200;
} 
else
if (keyPressed){
   if (keyCode == RIGHT) {
    x=x+speed;   
   }
  if (keyCode == LEFT) {
    x=x-speed;   
   }
  if (keyCode == UP) {
    y=y-speed;   
   }
  if (keyCode == DOWN) {
    y=y+speed;   
   }
  if (key == '+') {
    speed=speed+1;   
   }
  if (key == '-') {
    speed=speed-1;   
   }
  if (key == 'd') {
    diam=diam+10;   
   }
  if (key == 's') {
    diam=diam-10;   
   }
}
}


