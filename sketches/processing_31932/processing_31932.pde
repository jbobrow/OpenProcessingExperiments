
int a = 0;
int b = 0;

void setup(){
  size(500,500);
  background(255);
 fill(0,30);
  
  
}
void draw(){
  
  line(mouseX,mouseY,a,b);
  a = a + 9;
  line(mouseY,mouseY,500,b);
  b = b + 8;
  line(mouseX,mouseY,b,500);
  line(mouseX,a,b,b);
  line(mouseX,mouseY,b,b);
  

}




