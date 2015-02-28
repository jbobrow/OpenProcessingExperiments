


  

int patternSeperationX = 50;
int patternSeperationY = 50;
 
  
  
void setup(){
  size(200,400);
  smooth();
  fill(255);
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0,255,0);
  smooth();
  background(0,255,0);
    
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
{}
  
  
void yourFunction(){


stroke(255);
beginShape();
vertex(25,0);
vertex(50,0);
vertex(40,10);
vertex(35,10);
vertex(25,20);
vertex(0,20);
vertex(10,10);
vertex(15,10);
endShape(CLOSE);

ellipse(5,5,10,10);
ellipse(45,15,10,10);

line(0,30,50,30);
line(0,34,50,34);
line(0,32,50,32);
line(0,36,50,36);
line(0,38,50,38);








}
  
void keyPressed()
{
  if(key == 's' || key == 'S')
  {
    
     
    
  }

}

                
                
