
void setup() {
size(200,200);
smooth();




}



void draw () {


ellipseMode(CENTER);
rectMode(CENTER); 
background(255);

// Body
stroke(0);
fill(150);
rect(mouseX,mouseY+30,30,65);



// Head
stroke(0);
fill(150);
ellipse(mouseX,mouseY,90,80); 
fill(255);
ellipse(mouseX,mouseY,90,50); 


// Eyes
fill(mouseX,0,mouseY); 
ellipse(mouseX-29,mouseY,13,32); 
ellipse(mouseX+29,mouseY,13,32);

// Legs
// pointa-x,pointa-y,pointb-x,pointb-y)
stroke(0);
line(mouseX-15,mouseY+60,80,160);
line(mouseX+15,mouseY+60,120,160);		

// feet
stroke(0);
fill(150);
ellipse(80,162,13,6); 
ellipse(120,162,13,6);

}



void mousePressed(){
   println("mouse has been pressed");
   
   fill(0);
ellipse(mouseX,mouseY,90,50); 

   
}


void keyPressed () {
  println("key pressed");
  fill (0);
  ellipse(mouseX-29,mouseY,30,45); 
  ellipse(mouseX+29,mouseY,30,45); 
 
}

 

