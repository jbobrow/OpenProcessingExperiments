
void setup() {
  size(600, 600);
  strokeCap(PROJECT);
  smooth();
  //noFill();
}

void draw() {
      //make the background a nice grey-blue
      background(197, 219, 230);
      
      //we will use this variable to make the patterns we draw change w/ the mouse position
      float trans = mouseY/5;

      //let's put everything in the center of the screen
      translate(width/2, height/2);
      //we'll make 12 copies of a rotated array of lines using variable k
      for(float k = 0; k < 360; k += 30){ 
          //first, we'll need to ready the transformation matrix for data to be loaded into it
          pushMatrix();                    
          //then, we make things rotate according to the mouseX position /3
          rotate(radians(mouseX/3));      
          //but furthermore, create copies of it for every value 'k'
          rotate(radians(k));              
          //we use this loop to create a spread of lines to rotate and clone
          for(float i = 0; i < 100; i += 7){ 
          //and make the lines glitter in neat colors
              stroke(240, 170, 130);
              //this is where the lines are drawn and told to react to the mouse 
              line(50 + trans, i, 250, 150); 
          }
          //to finish up, we pop the matrix, finalizing our translations
          popMatrix();
       //Now we draw two ellipses of differing sizes and fills in the center that react to the mouse  
       fill(177, 199, 210);                
       ellipse(0, 0, 100+mouseY/5, 100+ mouseY/5);
       
       fill(197, 219, 230);
       ellipse(0, 0, 75+mouseY/5, 75+ mouseY/5);  
      }
}
