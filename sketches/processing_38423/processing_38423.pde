
int x= 10;

void setup(){
  size(500,500);
  background (200);
 
  smooth();
  
}

void draw(){
  stroke(random(0,255),0,random(0,255),32);
  line(width/3,width/2,mouseX,mouseY);




}

