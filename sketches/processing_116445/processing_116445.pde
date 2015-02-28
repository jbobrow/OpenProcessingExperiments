
int x; //declaring x and y as intergers 
int y;
 
void setup() { //setting up the window/screen
  size(300, 300);
  background(0); //background set to white!
}
 
void draw() {
  x = mouseX; //assigning x and y value (the postion of the mouse
  y = mouseY;
 
 //starting my 'if' statments (' if _  and _is greater to/ less than one half the 
 //screen, turn background _ color) 
  if (x < width/2 && y < height/2) { // upper left (+,+)
    background(193, 12, 222);
    
    
 if (mousePressed == true) { //if you press the mouse on ( +,+) change background to black 
    background(12,222,193);
  } else {
    background(193,12,222);
  }
  }
 
  if (x < width/2 && y > height/2) { //upper right (+,-)
    background(291, 29, 93);
   
    
 if (mousePressed == true) { //if you press the mouse on ( +,-) change background to black 
    background(29,93,291);
  } else {
    background(291,29,93);
  }
  }
 
  if (x > width/2 && y <height/2) { //lower right (-,+)
    background(291, 9, 239);
    
    
 if (mousePressed == true) {//if you press the mouse on ( -,+) change background to black 
    background(9,239,291);
  } else {
    background(291, 9, 293);
  }
  }
  
  if (x > width/2 && y > height/2) { //lower left (-,-)
  background(61, 22, 67);
  

 if (mousePressed == true) {//if you press the mouse on ( -,-) change background to black 
    background(22,67,61);
  } else {
    background(61,22,67);
  }
  }
}
