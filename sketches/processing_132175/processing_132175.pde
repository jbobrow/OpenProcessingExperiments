
void setup(){
size(200,200);
}
 
void draw(){
   
background(255,255,255);
  
fill(255);
rect(mouseX,mouseY,40,60);        // mouse X = 80 mouse Y = 90
 
fill(255);
ellipseMode(CENTER);
ellipse(mouseX+20,mouseY-10,60,40);
 
line(mouseX,mouseY+60,mouseX-20,mouseY+85);
 
line(mouseX+40,mouseY+60,mouseX+60,mouseY+85);
 
fill(0);
ellipseMode(CENTER);
ellipse(mouseX,mouseY-10,20,10);
 
fill(0);
ellipseMode(CENTER);
ellipse(mouseX+40,mouseY-10,20,10);
}

