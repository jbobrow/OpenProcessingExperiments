

int patternSeperationX = 50;
int patternSeperationY = 50;

void setup(){
  size(300,600);
  smooth();
  background(247,236,102,56);
     stroke(255,133,10);
    strokeWeight(19);
    noFill();
    ellipse(600,300,800,800);
    strokeWeight(35);
    ellipse(600,300,1200,1200);
    strokeWeight(1);
    
    for(int i = 0; i < width/patternSeperationX; i++){
      for(int j = 0; j < height/patternSeperationY; j++){
        pushMatrix();
        translate(i*patternSeperationX, j*patternSeperationY);
        yourFunction();
        popMatrix();
      }
  }
   
}
 
 
 void draw()
 {
 }
 
 void yourFunction(){
   stroke(255,133,10);
   fill(247,236,102);
   ellipse (25,25,10,10);
   line(0,0,21,22);
   line(12.5,0,23,20);
   line(25,0,25,20);
   line(37.5,0,27,21);
   line(50,0,30,22);
   line(30,24,50,12.5);
   line(30,25,50,25);
   line(30,26,50,37.5);
   line(29,28,50,50);
   line(28,29,37.5,50);
   line(25,30,25,50);
   line(23,30,12.5,50);
   line(0,50,21,30);
   line(20,29,0,37.5);
   line(0,25,20,25);
   line(0,12.5,20,23);
   
   
   
 }
   

