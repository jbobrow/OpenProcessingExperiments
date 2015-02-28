
 //I just started toying around with Processing, so this is my very first, "respectable", sketch. Hope you like it
 
 void setup(){

  size (600,600);
  background(250);

}

void draw(){

  strokeWeight(1);
  fill(mouseX*.5); //specifies the color of the brushes as you move along  the horizontal plane of the canvas
  
  
   
   if (mousePressed == true){
   
     ellipse(mouseX, mouseY, 15,15);
  ellipse((mouseX/.9), (mouseY-7), 10,10);
  ellipse((mouseX-7), (mouseY/.9), 5,5);
     
   }
   
   if (mouseButton == RIGHT){ //New canvas
   
     background(250); 
   }

}           
