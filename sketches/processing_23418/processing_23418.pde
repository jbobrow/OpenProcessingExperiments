
size(220, 220);
 //make an ellipse that touches edges of canvass using variable
 
 //ellipse (x, y, w, h)
 
 //ellipse(width/2, height/2, width, height);
 
 //now make a ellipse that touches the right side of the canvass
 
// ellipse(width/1.05, height/2, width/10, height/10);
smooth();
background(0);
 fill(84, 176, 228);
 
 
 
 

 for (int x= -10; x <= height ; x += 20) { // circlcles are drawn accros the screen
   
 for(int y= -10; y <= width; y += 20){ //circles are drawn all over the screeen
   
   ellipse(x, y, 20, 20);
    //ellipse(x + y, y + x, 20, 20);

     } 
 }  
 strokeWeight(2);
 fill(179, 0, 124);
 // make little circles within the bigger circles
 // played with the parameters to get a pattern that was interesting
 for(int x = 5; x <= width ; x += 30) {
   for(int y = 5; y <= height; y += 15){
    ellipse (x, y, 10, 10);
   ellipse (y, x, 10, 10);
  
   }
 }   
                
                
