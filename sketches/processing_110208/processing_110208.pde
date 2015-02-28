
//Random Painting created by Uttam Grandhi during Fall-2013 for the course Introduction to Computational Media (ICM) taught by Prof. Daniel Shiffman at the Interactive Telecommunications Program (ITP), NYU.

float xOld = 200.0, yOld = 200.0, x, y;
float theta = 0;

void setup(){
  size(600,600);
}

void draw(){
  
  if(keyPressed){
    if( key =='h' || key =='H') {
      noFill();
      x = 300+random(100, 200)*cos(theta);
      y = 300+random(100, 200)*sin(theta);
      stroke(64,64,64,128);
      bezier(pmouseX-100*cos(theta), pmouseY-100*sin(theta), pmouseX, pmouseY, mouseX, mouseY, mouseX+100*cos(theta), pmouseY+100*sin(theta));
      xOld = x;
      yOld = y;
      
      theta = theta + 0.1;
      }
         if( key =='s' || key =='S') {
             save("Random_Painting"+random(millis())+".jpg");
         }
      }    
  
      if(mousePressed){
        background(205); //Erase the drawing.
      }
  
}
