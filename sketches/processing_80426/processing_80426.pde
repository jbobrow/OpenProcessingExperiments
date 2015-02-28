
// my first program by BunkerBuster
//
// this is a simple art program I wrote for my sister
// it will draw a random coloured shape when you click the mouse.c
// you can select the shape by pressing a key, s for square, 
// e for ellipse, t for triangle and c to clear the screen

// define the variable blood to remember what shape the user wants
char blood = 's';

void setup()
{ 
  size(500,500);  
  background(255,0,0 );
}

void draw()  
{  
  smooth();  
  stroke(255);  
  fill(random(255),random (255 ),random (255));  
  
  if (keyPressed) 
  {
    if (key == 's' || key == 'S') {
      blood = 's';
    }
  } else if (key == 'e' || key == 'E') {
      blood = 'e';
  } else if (key == 't' || key == 'T') {
      blood = 't';
  } else if (key == 'c' || key == 'C') {
      background(255,0,0 );
      key = 's';
  }

} 

void mouseClicked() 
{
    if (blood == 's') {
      rect( mouseX, mouseY, 100,120); 
    } else if (key == 'e') {
      ellipse( mouseX, mouseY, 100,120); 
    } else if (key == 't') {
      triangle( mouseX, mouseY, mouseX+100, mouseY,mouseX, mouseY+100); 
    }
   
}
