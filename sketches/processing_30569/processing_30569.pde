
 void setup(){
size(800,400);
 background (255);
 smooth();
   
int patternSeperationX = 100;
int patternSeperationY = 100;

  for(int i =0; i < width/patternSeperationX; i++){
      for(int j = 0; j < height/patternSeperationY; j++){
        pushMatrix();
        translate(i*patternSeperationX, j*patternSeperationY);
        yourFunction();
        popMatrix();
      }
  }
     
}
   
   
void draw()
{}
  
void yourFunction(){

  stroke(1);
beginShape();
 fill(255,8,0);
ellipse(54,55,15,15);
ellipse(54,70,10,10);
ellipse(55,80,5,5);
 fill(56,9,0);
vertex(25,20);
vertex(50,10);
vertex(40,10);
vertex(35,10);
vertex(25,20);
vertex(90,20);
vertex(100,10);
vertex(15,10);
endShape(CLOSE);
line(50,50,25,20);
line(50,50,30,20);
line(50,50,35,20);
line(50,50,40,20);
line(50,50,45,20);
line(50,50,50,20);

}

