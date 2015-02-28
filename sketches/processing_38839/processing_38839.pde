
Square s1;
Square s2;
Square s3;
Square s4;
 
void setup() 
{
  size(450, 450);  
  colorMode(HSB, 255);
  s1 = new Square(0, 150, 0);
  s2 = new Square(100, 150, 10);
  s3 = new Square(200, 150, 20);
  s4 = new Square(300, 150, 30);

}

void draw() { ;
  background(255);
  s1.update();
  s1.render();
  s2.update();
  s2.render();
  s3.update();
  s3.render();
  s4.update();
  s4.render();

} 
 
class Square { 
  float xpos, ypos, filler; 
  Square (float x, float y, float f) {  
    xpos = x;
    ypos = y; 
    filler = f;
  } 
  void update() {
    if(filler <= 255){
     filler++;
     }
     if(filler > 255){
     filler = 0;
     }      
   }
  void render(){  
    noStroke();      
    fill(filler, 255, 255); 
    rect(xpos, ypos, 100, 100);  
}
}
