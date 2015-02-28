
/*

move mouse to erase the colors shapes.
can you erase the colored shape faster than it appear? :D
created by Miranda Kuang

*/

int blocksize , blocksize0;

void setup() {
  size(500, 500);
  blocksize = 15;
  blocksize0 = 40;
  noStroke();
  background(255);
}

void keyPressed()
{
  if (key == ' ') background(255);
}


void draw() {
  for (int y=-25; y<height; y+=blocksize+50) {
    for (int x=-25; x<width; x+=blocksize+50) {
      fill(255,75);
      //fill(random(0,255), random(0, 255), random(0, 255), 5);
      rect(mouseX + x +5, mouseY + y + 5, blocksize0, blocksize0);
    }
  }
  
  for (int y=-25; y<height; y+=blocksize+50) {
    for (int x=-25; x<width; x+=blocksize+50) {
      fill(random(0,255), random(0, 255), random(0, 255), 30);
      ellipse(x+random(-50,400) , y+random(-50,400) , blocksize, blocksize);
    }
  }
  
   for (int y=-25; y<400; y+=blocksize+50) {
    for (int x=-25; x<400; x+=blocksize+50) {
      fill(255, 55);
      ellipse(x+random(-50,400) , y+random(-50,400) , blocksize+10, blocksize+10);
    }
  }
  
    for (int y=-25; y<height; y+=blocksize+50) {
    for (int x=-25; x<width; x+=blocksize+50) {
      fill(random(0,255), random(0, 255), random(0, 255), 30);
      rect(x+random(-50,400) , y+random(-50,400) , blocksize, blocksize);
    }
  }
  
   for (int y=-25; y<400; y+=blocksize+50) {
    for (int x=-25; x<400; x+=blocksize+50) {
      fill(255, 55);
      rect(x+random(-50,400) , y+random(-50,400) , blocksize+10, blocksize+10);
    }
  }
}


     
                                                                
