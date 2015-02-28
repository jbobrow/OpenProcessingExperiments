
int dia = 50;
int x = 30;
int y = 30;
int switchState = 0;
int scale = 0;

void setup() {
  size(300,600);
}

void draw(){
  background(100);
 ellipse(x, y, dia, dia); 

 
 if(x > width- dia/2){
   switchState = 1;
   println("switchState = 1");
  
 }
 
 if(x < 0 +dia/2){
   switchState = 0;
   println("switchState = 0");
 }
 scale = int(map(mouseY, 0, height, 1,50));
 if(switchState == 0){
  x= x+ mouseY;
 }else {
  x= x- mouseY;
 }
 }


