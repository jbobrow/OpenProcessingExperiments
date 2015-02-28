
void setup(){
  size(500,500); 
  frameRate(12);
}

void draw(){
 background(127);
 fill(255);                      // <- color of white ellipse
 ellipse(350,225,50,50);         // <- white ellipse
 fill(0);                        // <- color of black dot
 if(mouseX>325){                 // is the mouse position bigger than 350?
   if(mouseY<250){
    if(mouseX<375){ 
     if(mouseY>200){ 
      ellipse(mouseX,mouseY,10,10); // <- black dot
     }
    }
   }
  }
}
