
// Inspired from Composition No. 10 (Pier & Ocean) by Piet Mondrian 

size(600, 130);



for (int x=50; x < 550; x+=random(10,30)) { //creating boundaries for how far x can be defined and creating
  // random interval (in between 10 and 30) separating each vertical line 
  
  for (int y=30; y < 100; y+=10) { // horizontal lines confined in between 30 and 100 on y axis
    
    for (float z=random(10,200); z < 100; z+=random(30,60)) { //range of z's size greater than it's maximum
      //in order to create greater diversity 
      
      strokeWeight(1.5); // making vertical lines thicker in order to create hierarchy and emphasize cross grain of composition
      stroke(255, 0, 0); // using blue and red - calling back to Mondrian's other famous compositions
      line(x, z, x, z+10); // size of vertical lines is random because of z's parameters
      
      strokeWeight(1); 
      stroke(0, 0, 255);
      line(x, y, x+random(40), y);
    }
  }
}


