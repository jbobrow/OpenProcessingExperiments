
//Gentry Demchak, Aiming Device, Code, Assignment 2

//ease effect barrowed from Yumeng Wang
//ease effect can be found at http://processing.org/examples/easing.html
float x;
float y;
float a = 0.1;

//color of background
float r = 0;
float g = 0;
float b = 0;

//color of square in center
float C = 0;

//color of target finder
float red = 255;
float green = 255;

//size of viewport
float w = 40;
float h = 40;

//asteroid variables
float sizeX = 60;
float sizeY = 60;
 
void setup() {
  size(300, 300);
  rectMode(CENTER);
  smooth();
  
}
 
void draw() {
  background(r,g,b);
  
  //asteroid
  fill(C);
  rect(width/2, height/2, width*.10, height*.10); 
   
  //ease function http://processing.org/examples/easing.html
  float targetX = mouseX;
  float dx = targetX - x;
  if(abs(dx) > 1) {
    x += dx * a;
  }
   
  float targetY = mouseY;
  float dy = targetY - y;
  if(abs(dy) > 1) {
    y += dy * a;
  }
  
  
     
//Crosshairs
  stroke(104,59,255,150);
  strokeWeight(1);
  noFill();
  triangle(x, y, 0,height-height, 0, 25);
  triangle(x, y, width,height, width,height-(height/25));
  triangle(width,height-height,width,25,x,y);
  triangle(0, height,0,height-(height/25),x,y);
  strokeWeight(5);
  rect(x,y,w,h);
  
  if(mouseX > width*.45 && mouseX < width*.55 && mouseY > height*.45 && mouseY < height*.55) {
    w = 80;
    h = 80;
    green = 255;
    red = 0;
    
  } else {
    w = 40;
    h =40;
    green = 0;
    red = 200;
    
  }
  
  //veiw window
  if(mousePressed); {
    fill(red,green,0,random(100,255));
    noStroke();
    rect(mouseX,mouseY, width/20, height/20);
  }
  
  
  // when the mouse is near the center, the color fades to red.
  if (mouseX > width/4 && mouseX < width/1.5 && mouseY > height/4 && mouseY < height/1.5) {
    r = r + 5;
  } else {
    r = r - 5;
  }
  
  //This keeps the r value in the usable color range of 0 - 255.
  if (r > 255) {
    r = 255;
  } else if (r < 0) {
    r = 0; }
  
  

}



  
  



