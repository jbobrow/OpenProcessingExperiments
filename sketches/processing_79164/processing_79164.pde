
int x = 0; // Global variable for location 
int speed = 1; // Variable for ball's speed. When (+) it will move right, when (-) it will move right

// Ben
void setup() {
size(200,200);// Set the size of the window
smooth();
frameRate(60);

}

void draw() {
  background(0,158,11); // Draw a green background
  
 x = x + speed; // Add the current speed to the x location 
 
if ((x > 100) || (x < -100)) {
  speed = speed  * - 1;
} 

// Set ellipses and rects to CENTER mode
ellipseMode(CENTER);
rectMode(CENTER);

// Draw Ben's legs
stroke(0);
fill(69,72,84);
rect(x+91,160,16,53);
rect(x+109,160,16,53);

// Draw Ben's arms
stroke(0);
fill(168,185,226);
ellipse(x+80,100,25,70);
ellipse(x+120,100,25,70);

// Draw Ben's body
stroke(0);
fill(168,185,226);
ellipse(x+100,100,65,75);

// Draw Ben's head
stroke(0);
fill(241,197,158);
ellipse(x+100,40,40,50);

// Draw Ben's eyes
fill(255);
ellipse(x+92,40,15,12);
ellipse(x+108,40,15,12);
fill(31,80,239);
ellipse(x+92,40,7,7);
ellipse(x+108,40,7,7);
fill(0);
ellipse(x+92,40,3,3);
ellipse(x+108,40,3,3);

// Draw Ben's mouth
stroke(0);
ellipse(x+100,58,10,5);


// Draw Ben's feet
stroke(0);
fill(0);
rect(x+86,190,26,13);
rect(x+114,190,26,13);

// Draw Ben's hands
fill(241,197,158);
ellipse(x+78,130,20,14);
ellipse(x+122,130,20,14);

// Draw Ben's buttons
fill(0);
ellipse(x+103,82,3,3);
ellipse(x+103,100,3,3);
ellipse(x+103,118,3,3);

// Draw Monster
    stroke(0);
    fill(212,0,20);
    ellipse(mouseX,mouseY,10,30);
    
    stroke(0);
    fill(212,0,20);
    ellipse(mouseX,mouseY-30,35,35);
    
    fill(mouseX,0,mouseY);
    ellipse(mouseX-5,mouseY-30,8,10);
    ellipse(mouseX+5,mouseY-30,8,10);
    
  }
  
  void mousePressed() {
  }








