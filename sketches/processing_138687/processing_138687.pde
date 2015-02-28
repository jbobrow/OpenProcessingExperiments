
/*felix anderson
homework assignment week 3
creative computing B
benjamin bacon 
*/

  void setup() {
  
    size (600,600);
    
    strokeWeight(5); 
    smooth(5); 
    stroke(0, 50); 
    
    
  }

  void draw() {
    
  
  int rect_x = round( map(mouseX, 0,width, width,0) );
  int rect_y = round( map(mouseX, mouseY,width, width,0) );
   int r = round( map(mouseX, 0,width, 0,255) );
   int l = round( map(0, mouseY,width, 100,0));
   int b = round( map(mouseX, 0,width, 0,255) );
  
  
 
  size(600,600);
  background(l, 500,500);
  stroke(50,50,255);
  
  fill (l, 100,20);
  ellipse(50,mouseY,100,100);
  fill (l, 500,0);
  ellipse(550,mouseY,100,100);

 
  fill (l,0,300);
  ellipse(100,mouseY,50,50);
  rect (300, mouseY,50, 50);
  ellipse (500, mouseY, 50, 50);
  fill(r,0,0);
  rect( rect_x,200, 50,50 );
  fill (b,300,20,0);
  ellipse( mouseX,200, 50,50 );
  fill (10, 100);
  
  line(mouseX, mouseY, pmouseX, pmouseY); 
  
  
  
  }
  /*I let my brother try out the assignment. He thought it 
  was pretty cool, especially how the colors faded in and out
  for the shapes and the background. I tried to explain what
  my true intentions were for the assignment but it was still
  interesting and fun. The interaction with the computer was 
  interesting, seeing him move the mouse in every direction. 
  I think there are ways for me to improve the experience. 
  I feel I can do more and add more experiences for the user
  but I just need to figure out more things and understand 
  more material before doing anything so far.*/ 
  
  
  
   
  


