

void setup() 
{
  size(600, 600);  
  stroke(3);
  noLoop();
}

float y = 100;

// program is stopped. 
void draw() {
  background(0);   // Set the background to black
  
  frameRate(25); // The statements in draw() are run until the 

  fill(random(230), random(115) , random(110));
  strokeWeight(4);
ellipse(50, 50, y-10, y-1);  
ellipse(100, 100, y+20, y+2);  
ellipse(150, 150, y-30, y-3);  
ellipse(200, 200, y+40, y+4);  
ellipse(250, 250, y-50, y-5);  
ellipse(300, 300, y+60, y+6);  
ellipse(350, 350, y-70, y-7);  
ellipse(400, 400, y+80, y+8);  
ellipse(450, 450, y-90, y-9);  
ellipse(500, 500, y+100, y+10);  
ellipse(550, 550, y-110, y-11);  
ellipse(600, 600, y+120, y+12);  
ellipse(650, 650, y-130, y-13);  
ellipse(700, 700, y+140, y+14);  
ellipse(750, 750, y-150, y+15);  
  y = y - 1; 
  if (y < 0) { 
    y = height; 
  } 
} 

void mousePressed() 
{
  loop();
}


