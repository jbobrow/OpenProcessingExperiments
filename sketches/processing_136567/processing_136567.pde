
/*A brief example of using conditional statements to effect a 
change of background colors, next step mouse over type functions*/

int x; // our x value
int y; // our y value

void setup() {
  size(500, 500);  //set size
  background(0);   //set a beginning background color
}

void draw() {
  //We can monitor (x,y) by printing out location
  println("Mouse coordinates:(" + x + "," + y + ")");  
  x = mouseX;
  y = mouseY;
  
  if (x < width/2 && y < height/2){ //upper left
    background(255, 0, 0);
  }
  
  if (x < width/2 && y > height/2){ //lower left
    background(0, 255, 0);
  }
  
  if (x > width/2 && y < height/2){  //upper right
    background(0, 0, 255);
  }
  
  if (x > width/2 && y > height/2){  //lower right
    background(255, 255, 255);
  }
}
    
  


