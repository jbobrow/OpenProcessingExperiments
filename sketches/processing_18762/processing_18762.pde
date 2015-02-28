
 
int size = 30;      
float xpos, ypos;      

float xspeed = 2.8; //speed it's moving 
float yspeed = 2.2;  

int xdirection = 1;  // Left or Right
int ydirection = 1;  // Top to Bottom


void setup() 
{
  size(250,250);
  noStroke();
  smooth();
  xpos = width/2;
  ypos = height/2;
}


void draw() 
{
  background(255);
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
  
  if (xpos > width-size || xpos < 0) { //setting up position
    xdirection *= -1;
  }
  if (ypos > height-size || ypos < 0) {
    ydirection *= -1;
  }
fill(0);
  ellipse(xpos+size/2, ypos+size/2, size, size);//shape that's moving
 
  if (mousePressed){
   background(0);
   fill(mouseX,mouseY,random(30,200));
   ellipse(xpos+size/2, ypos+size/2, size, size);//when pressing mouse ball turns colours
   
  }else { 
    fill(255);
     ellipse(xpos+size/2, ypos+size/2, size, size);//shape that's moving is white
     
}
}


