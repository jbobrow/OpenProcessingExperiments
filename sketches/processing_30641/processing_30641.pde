

void setup() {  
  size(700,467);

          background(5);
           
  colorMode(HSB);   

    smooth();
  noStroke();
}
 
void draw() {
  noStroke();
  fill(random(255),100,255);
   
  if(mousePressed == true) { 
 

stroke(random(0,100),100,50);
translate(mouseX,mouseY);
rotate(360);
 ellipse (mouseX/20, mouseY/20,20, 20);  
line(0,0,random(width/40),random (height/30)); 
  }
  }
      
