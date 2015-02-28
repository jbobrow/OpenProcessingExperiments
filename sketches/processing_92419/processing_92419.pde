
/* @pjs font="Sanchez-Regular.ttf"; */
//http://processing.org/learning/basics/mousefunctions.html
int myState = 0 ;

PFont myFont ;

void setup() {
size (500,500);
fill (40) ;
myFont = createFont("Sanchez-Regular.ttf", 35);
}

void draw () {
 
  background (255);
  
  rect(0, 350, 500, 150);
  rect(75, 200, 200, 200);
  triangle(175, 150, 75, 200, 275, 200);
  rect(150, 300, 50, 100);
  


  switch(myState) {
    
  case 0:
  textFont(myFont, 27);
  text ("Mouse over objects to paint them!", 15, height/10) ;
  text ("First", 3*width/5, 2*height/10) ;
  text ("try", 3*width/5, 3*height/10) ;
  text ("the", 3*width/5, 4*height/10) ;
  text ("sky", 3*width/5, 5*height/10) ; 
  if (mouseX > 0 && mouseX < width && 
      mouseY > 0 && mouseY < 350) {
        myState = 1 ;
      }
  break ; 
  
  case 1:
  textFont(myFont, 27);
  background (#99FFFF);
  fill(255);
  ellipse (400, 100, 100, 100);
  fill (40);
  rect(0, 350, 500, 150);
  rect(75, 200, 200, 200);
  triangle(175, 150, 75, 200, 275, 200);
  rect(150, 300, 50, 100);
  
  text ("Next", 3*width/5, 4*height/10) ;
  text ("the", 3*width/5, 5*height/10) ;
  text ("grass", 3*width/5, 6*height/10) ;
 
  if (mouseX > 0 && mouseX < width && 
      mouseY > 350 && mouseY < height) {
        myState = 2 ;
      }
  break ; 
  
  case 2:
  textFont(myFont, 27);
  background (#99FFFF);
  fill(255);
  ellipse (400, 100, 100, 100);
  fill(#009900);
  rect(0, 350, 500, 150);
  fill(40);
  rect(75, 200, 200, 200);
  triangle(175, 150, 75, 200, 275, 200);
  rect(150, 300, 50, 100);
  
  text ("Next", 3*width/5, 4*height/10) ;
  text ("the", 3*width/5, 5*height/10) ;
  text ("house", 3*width/5, 6*height/10) ;
  if (mouseX > 75 && mouseX < 275 && 
      mouseY > 200 && mouseY < 400) {
        myState = 3 ;
      }
  break ;
 
  case 3:
  textFont(myFont, 27);
  background (#99FFFF);
  fill(255);
  ellipse (400, 100, 100, 100);
  fill(#009900);
  rect(0, 350, 500, 150);
  fill(255, 0, 0);
  rect(75, 200, 200, 200);
  fill (0);
  triangle(175, 150, 75, 200, 275, 200);
  rect(150, 300, 50, 100);
  
  text ("Next", 3*width/5, 4*height/10) ;
  text ("the", 3*width/5, 5*height/10) ;
  text ("sun", 3*width/5, 6*height/10) ;
 
  if (mouseX >350 && mouseX < 450 && 
      mouseY > 50 && mouseY < 150) {
        myState = 4 ;
      }
  break ;
  
  case 4:
  textFont(myFont, 27);
  background (#99FFFF);
  fill(#FFFF00);
  ellipse (400, 100, 100, 100);
  fill(#009900);
  rect(0, 350, 500, 150);
  fill(255, 0, 0);
  rect(75, 200, 200, 200);
  fill (0);
  triangle(175, 150, 75, 200, 275, 200);
  rect(150, 300, 50, 100);
  
  text ("Click the mouse to reset", width/5, height/20) ;
  fill (40);
  break ;
}
}
void mousePressed (){
  myState = 0 ;
}



