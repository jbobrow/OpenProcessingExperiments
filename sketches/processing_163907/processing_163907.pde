
// Sets up the program to run, only runs once at begining 
void setup(){
// sets the canvas size to 750pi by 750pi  
  size(750,750);
// sets back ground color to a shade of black  
  background(255);
// sets frame rate to 60 frames per second  
  frameRate(60);
}
// Draws info in a loop
void draw(){
// asks if mouse is pressed then stops drawing  
    if(mousePressed){
    mouseX = 0;
    }
//fills accoriding to placement of mousex/mousey
  fill(mouseX-50,mouseY+50,mouseX+50,mouseY);
// no stroke on object  
  noStroke();
// size and placement of ellipse depend on placement of mouse in canvas  
  ellipse(mouseX, mouseY, mouseY, mouseY);

    
}


