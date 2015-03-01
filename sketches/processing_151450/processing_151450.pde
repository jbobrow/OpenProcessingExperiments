
void setup(){ 
  size (500, 500);
  background(255);
  frameRate(35);
}
 
void draw() { 
  noStroke();
   fill(255, 255, 250);
       rect(0, 0, mouseX, mouseY);
      
///obenr
   fill(110, 210, 210);
       rect(mouseX, 0, 500, mouseY);
      
//rechts
     fill(60, 170, 200);
         rect(mouseX, mouseY, 500, 500);
      
//links 
          rect(0, mouseY, mouseX, 500);
         
         if(mouseX>width/2)
          {
            noStroke();
            fill(210,210,210);
          rect(mouseX/2, mouseY/2, 500/2, 500/2);
          }
          
}

