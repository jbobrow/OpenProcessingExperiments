
int x;
int y;
int speed=15;
int diam=100;

void setup (){
  size(600,800);
  smooth();
  x=width/2;
  y=height/2;
  
}


void draw(){
  
  
  background(255);
  fill(0);
  textAlign(CENTER);
  text("use arrow keys to move", width/2, height-50);
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
}
} 


