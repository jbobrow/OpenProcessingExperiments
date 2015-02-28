
  void setup() {
  size(800, 800);
  background(255);
  noCursor();
  }
 
float i = 0;
float a = 0;
 
void draw () {
  i = i + .1;
  a = 0;
  
        if(keyCode==LEFT)
          {
            a = 1;
          }
          else if(keyCode==UP)
          { 
            a = 2;
          }
          else
          {
            a = 0;
          }
        
  translate(mouseX, mouseY);
  rotate(i);
  fill(255,0,0);
  
  if(a == 0)
   { 
     fill(0,255,0);
     ellipse(50, 50, 50, 50);
   }
  else if(a==1)
   {
      fill(255,0,0);
      beginShape(TRIANGLE_STRIP);
      vertex(30, 75);
      vertex(40, 20);
      vertex(50, 75);
      vertex(60, 20);
      vertex(70, 75);
      vertex(80, 20);
      vertex(90, 75);
      endShape();
      
      ellipse(0,0,50,50);
   }
  else if(a==2)
    {
      line(47,98,4,12);
      line(90,10,55,75);
      line(6,42,37,64);
    }
   
  rotate(TWO_PI-i);
   
}


