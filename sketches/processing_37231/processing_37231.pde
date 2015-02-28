
void setup() {
  size(200,200);
  colorMode(HSB, width, 100, width);
}
 
void draw() {
  background(0);
  for (int x=0; x<100; x+=20)
    
    {
    noStroke();
    fill(x*2,mouseX,mouseY);
  
          //Changes the color of objects as you move from left to right and the brightness as you move up and down
         
     
    
//Vertical squares
  
    rect(x+10,x,width,5);
  
     
//Horizonal squares

    rect(x+10,x,5,height);
    
          //Creates squares in a horizontal and vertical pattern, leaving a 100 x 100 square
     
//Vertical Lines
    stroke(x,mouseX,mouseY);
    line(x+100,100,x+100,height);
          //Fills this 100 x 100 square with a 15 x 15 grid
  
//Horizontal Lines
    stroke(x,mouseX,mouseY);
    line(100,x+100,width,x+100);
          //Fills this 100 x 100 square with a 15 x 15 grid
     

     
 
    
     
    
  }
}


