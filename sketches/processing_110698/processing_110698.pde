


// this runs once when the program starts
void setup(){
  size(600, 600);background (0,178,238);stroke(0);strokeWeight(12.0);
strokeCap(ROUND);
 

}

// this runs every time the operating 
// system tells java to update the screen
void draw(){
  
  
  
   //line(pmouseX, pmouseY, mouseX, mouseY);
}

void mouseDragged(){
  for(int i=0; i<30; i++){
    //point(mouseX, mouseY);
   fill(0); 
    ellipse(mouseX, mouseY, 3, 3);

  }
}




