
void setup () {
  // set the size of the window
  size(200,200);

}


int x=1;
void draw () {
   // Draw a withie background
  background (mouseX, 0, mouseY); 
    
  //Platillo volador  
   x=x+1;
   if (x>230){x=0;}   
  
  fill(175);
  ellipse(x,10,50,20);
  fill(0,0,255);
  ellipse(x,15,25,10);
  
  
  
  // Set CENTER mode
  ellipseMode (CENTER);
  rectMode(CENTER);
  
  //Draw Zoog´s body
  stroke(0);
  fill(0,255,0);
  rect (mouseX,mouseY,20,100);
  
  // Draw Zoog´s head
  stroke(0);
  fill(0,255,0);
  ellipse (mouseX,mouseY-30,60,60);
  
  // Draw Zoog´s Eyes
  fill(255,0,0);
  ellipse(mouseX+20,mouseY-30,16,32);
  ellipse(mouseX-20,mouseY-30,16,32);
  
  // Draw Legs
  stroke(0);
  line(mouseX-10,mouseY+50,pmouseX-10,pmouseY+60);
  line(pmouseX+10,pmouseY+60,mouseX+10,mouseY+50);
  
  //Draw arms
  

//Draw luz...
       stroke (0);
    fill(0,255,255,100); 
    triangle(x,20,50,200,150,200);
   
  }
  
  

