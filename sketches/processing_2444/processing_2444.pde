
boolean isDrawing = false; 
 
//this is the setup wrapper. Anything in here happens once at the start of the program. 
 
void setup() { 
  size(500,500); 
  background(100,100,20);  
  smooth();
  fill(0,0,0,50); 
   
   
}; 
 
//this is the draw wrapper. Anything in here happens once per frame.  
 
void draw(){ 
   
 if (isDrawing){ 
   

  stroke(100,200,100,30); 
  line(200,500,mouseX,mouseY); 
  stroke(50,102,70,70);
  fill(120,50,50,250);
  ellipse(mouseX-50, mouseY-random(10,100), 5,5);
  noStroke();
  fill(255,25,200,1);
  ellipse(mouseX+random(1,20), mouseY-random(1,100), 100,100);

  

 
 }; 
   
}; 
 
 
void mousePressed(){ 
  isDrawing = !isDrawing; 
}; 


