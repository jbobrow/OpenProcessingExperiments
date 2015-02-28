
int x = 0; // x position 
int y = 0; // y position 
 
int speed = 3; 
 
int state = 0; 
 
void setup(){ 
  size(400,400); 
 
} 
 
void draw() { 
  background (#DDFF00); 
  
// Ogen
  fill(255); 
rect(65,42,112,112); 
  fill(255); 
rect(235,42,112,112); 

// Pupil
fill(0); 
ellipse(280,118,50,50); 

// Neus 
fill(#AFFC00); 
ellipse(200,222,100,75); 
 
// Mondvorm  
fill(#CCFD44);  
rect(100,265,200,100); 
 
// Tanden 
fill(255);  
rect(112,277,175,75); 
 

 
// Beweging 
noStroke(); 
fill(0); 
ellipse(x,y,50,50); 
if(state == 0 ) { 
  x = x + speed; 
  if (x > width-50) { 
    x = width-50; 
    state = 1; 
    } 
} else if (state == 1) { 
  y = y + speed - 2; 
  x = x - speed + 1; 
  if (x < 0) { 
   y = 175; 
   x = 0; 
   state = 2; 
  }  
} else if (state == 2) { 
    x = x + speed; 
  if (x > width-50) { 
   y = 175; 
   x = 350; 
   state = 3; 
} 
} else if (state == 3) { 
  y = y + speed - 2; 
  x = x - speed + 1; 
  if (x < 0) { 
   y = 350; 
   x = 0; 
   state = 4; 
} 
} else if (state == 4) { 
    x = x + speed; 
  if (x > width-50) { 
   y = 350; 
   x = 350; 
   state = 5; 
} 
} else if (state == 5) { 
  x = 0; 
  y = 0; 
  state = 0; 
} 
} 
 


