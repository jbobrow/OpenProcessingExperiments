
int a = 0;
int b = 0;

void setup(){
  size(500,500);
  background(255);
 fill(0,30);
  
  
}
void draw(){
  
  line(a,b,500,500);
  a = a + 4;
  line(a,500,500,b);
  b = b + 2;
  line(a,b,b,500);
  line(a,a,b,b);
  line(500,a,b,b);
  

}




