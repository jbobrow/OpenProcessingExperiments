
int hello=0;
int bye=500;
float x=random(0,500);
float y=random(0,500);

void setup() {
  
  background(255);
  size(500,500);
  smooth();
  
 line (0,height, width,0);
  }
    void draw() {
    stroke(0,100);
    line(hello,hello,mouseX,mouseY);
    line(bye,bye,mouseX,mouseY);
    line(500,0,mouseX,mouseY);
    line(0,500,mouseX,mouseY);
    
  
   }

