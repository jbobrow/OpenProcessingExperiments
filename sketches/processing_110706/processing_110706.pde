
// Draws a line where you move your mouse over

// Fills a pixel your mouse is pointing to, thus allowing you to draw..
// lines and other shapes
// void draw(){
//  point(mouseX, mouseY);
// }

// Draws a complete line by joining pixels together as the mouse moves across the screen 
// void draw(){
//  line(pmouseX, pmouseY, mouseX, mouseY);
// }

// Changes the width of the line being drawn
// "By adding a value to the mouse co-ordinates, you can randomly place the point 
//somewhere near the mouse pointer. The for loop around the point() function (we will 
//cover these later), will create 30 coloured pixels around the mouse point, and will create 
// a spray can effect."

//void draw(){  
// for(int i=0; i<30; i++){
// point(mouseX + random(20), mouseY + random(20));
//  }  
// }

//Actual code needed

// REAL PROGRAM BELOW 

// Sets up the canvas
void setup(){
  //Sets the size of it
  size(600,400);
  // Sets the colour of it
  stroke(#71C7FF);
}

int value = 0;

void draw(){
textSize(15);
fill(#000000);
text("Press S and click to spraypaint", 300, 395);
fill(#FFFFFF);
text("Press W and click to paint a white line", 300, 365);
fill(#39FA05);
text("Press G and click to paint a green line", 300, 380);
fill(#FA0505);
text("Press R and click to paint a red line", 10, 365);
fill(#002CFC);
text("Press B and click to paint a blue line", 10, 380);
fill(#FFE70D);
text("Press Y and click to paint a yellow line", 10, 395);


}

void mouseDragged() 


{
  for(int i=0; i<30; i++)
  
  if (keyPressed) {
    if (key == 'y' || key == 'Y') {
        line(pmouseX, pmouseY, mouseX, mouseY);
        stroke(#FFE70D);
    }
    
     if (key == 'w' || key == 'W') {
        line(pmouseX, pmouseY, mouseX, mouseY);
        stroke(#FFFFFF);
    }
     if (key == 'b' || key == 'B') {
        line(pmouseX, pmouseY, mouseX, mouseY);
        stroke(#0528E8);
        
      } 
      
      if (key == 'r' || key == 'R') {
        line(pmouseX, pmouseY, mouseX, mouseY);
        stroke(#FF0004);
      }
      
      if (key == 'g' || key == 'G') {
       line(pmouseX, pmouseY, mouseX, mouseY);
        stroke(#39FA05);
        }
        
      if (key == 's' || key == 'S') {
       point(mouseX + random(20), mouseY + random(20));
       stroke(#000000);
        }
        
        
      }else {
        line(pmouseX, pmouseY, mouseX, mouseY);
        stroke(#000000);
     
     
  }
 }




