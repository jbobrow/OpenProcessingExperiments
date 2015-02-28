
int a= 10;
float b = 90.50;


void setup() {
  size(500,500);
  smooth();
  frameRate(15);
  
}


void draw () {
  if (mouseX > width/2) 
  background (200,100,10);  //Orange background
   else { background (100,0,80);}
  
  

  if (mousePressed) {
    if ((mouseX > 50)&&(mouseX < 100)&& (mouseY > 50)&&(mouseY < 100)) 
      draw();
      loop(); }
      
      fill(255,90,80);
        ellipse (mouseX,mouseY, 50,50);  
        
        line (a,10,a, height/5);
        line (b, height/2, b, height);
     
        
        if ( a > width) {
          a = 10;
        }
        
        if(b>width) {
          b= 0;
        }


  }   // refered to online database // http://processing.org/learning/basics/integersfloats.html
  
  


