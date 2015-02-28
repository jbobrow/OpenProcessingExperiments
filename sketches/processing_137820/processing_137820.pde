

// i decided to make a tool to invent a personal subway system. 
// in my town i always have to take my bike, rain or snow.
// the old map is from the public domain,
// pick a color with the  mouse, and click to pick a place for the station
// click once more, to make a new station and connect the two.
// each line gets its own color.
// s to save image. backspace to wipe out the map.



//declare PImage en kleurenpalette
PImage city;
int c; int h;
int lastMouseX = -1;
int lastMouseY = -1;
color[] colors = {#000000, #FF0000, #00FF00, #0000FF, #0DECFF, #E8990C, #63431D, #FFF426};



//draw map to the screen, and draw blocks of color, using a for-loop to draw and to pick from the palette 
void setup()  {
  size(800,600);
  background(255);
  city = loadImage("zwoldcitymap.jpg");
  c=0;
  image(city,0,0, 800, 450);
 strokeWeight(5);
    for (c=1; c<8; c++)  {
     fill(colors[c]);
     rect(c*100, 475, 50, 50,5);
     } //for
      fill(0);
        textSize(32);
       text("Pick color, draw stations", 100,570);
        textSize(18);
        text("s to save image", 600,560);
        text("backspace to clear", 600,580);
        
} //setup


void draw()  {
  
    for (c=1; c<8; c++)  { 
      for (h=1; h<5; h++) {
    
     strokeWeight(1);
     line(c*100, 0, c*100, 450);
     line(0, h*100, width, h*100);
   
       
  } //for
  } //for
  strokeWeight(5);
 

  
     //if person clicks in a color, this will be the new fill-color
if (mousePressed) { 
      if (mouseX > 100 && mouseX < 150 && mouseY>450) 
      {
      fill(colors[1]);
      lastMouseX =-1;
      } //if
    
      if (mouseX > 200 && mouseX < 250 && mouseY>450) 
      {
      fill(colors[2]);
      lastMouseX =-1;
       } //if
       
     if (mouseX > 300 && mouseX < 350 && mouseY>450) 
      {
      fill(colors[3]);
      lastMouseX =-1;
       } //if   
    
     if (mouseX > 400 && mouseX < 450 && mouseY>450) 
      {
      fill(colors[4]);
      lastMouseX =-1;
       } //if   
    
     if (mouseX > 500 && mouseX < 550 && mouseY>450) 
      {
      fill(colors[5]);
      lastMouseX =-1;
       } //if   
     
        if (mouseX > 600 && mouseX < 650 && mouseY>450) 
      {
      fill(colors[6]);
      lastMouseX =-1;
       } //if   
    
      if (mouseX > 700 && mouseX < 750 && mouseY>450) 
      {
      fill(colors[7]);
      lastMouseX =-1;
       } //if   
      
    
 
} // einde mousepressed
}  //draw 


void mousePressed()
{
  if (mouseY < 450)  {
  ellipse(mouseX,mouseY,20,20);
  if (lastMouseX != -1) {
    line(lastMouseX, lastMouseY, mouseX, mouseY);
  }
  lastMouseX = mouseX;
  lastMouseY = mouseY;
  
  }
}

void keyReleased(){

 
//  save image - clear screan redraw setup, including kleurendoos
  
  if (key == 's' || key == 'S') 
  {saveFrame("metroplan.png");
  }
  if (key == DELETE || key == BACKSPACE) {
  background(255);
  lastMouseX =-1;
  city = loadImage("zwoldcitymap.jpg");
  c=0;
  
   image(city,0,0, 800, 450);
 
 for (c=1; c<8; c++)  {
   fill(colors[c]);
   rect(c*100, 475, 50, 50);
  
    } //for
  } // if backspae
}  // end keyreleased


  


