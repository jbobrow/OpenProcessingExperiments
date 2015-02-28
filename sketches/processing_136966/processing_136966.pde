
int dia = 50;
int x = 30;
int y = 30;
int switchState = 0;

void setup() {
  size(600,600);
}

void draw(){
  background(100);
 ellipse(x, y, dia, dia); 

 
 if(y > width- dia/2){
   switchState = 1;
   println("switchState = 1");
  
 }
 
 if(y < 0 +dia/2){
   switchState = 0;
   println("switchState = 0");
 }
 
 if(switchState == 0){
  y= y+10;
 }else {
  y--;
 }
 }


