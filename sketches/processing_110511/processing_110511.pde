
// Hyun Jean Kwon
// © Hyun Jean Kwon Fall 2013, Pittsburgh, PA
// HW4 Course 60257

float x = 200;
float y = 200;

void setup()
{
  size (400, 400);
  background (50);
  smooth();
  frameRate(10);
}


void draw() {
noFill();
strokeWeight(20.0);
stroke(48, 250, 198);
strokeCap(PROJECT);
      strokeJoin(MITER);
      beginShape();
        vertex(mouseX, x-100);
        vertex(100, x);
        vertex(mouseX, x+100);
      endShape();
stroke(150);      
      strokeJoin(MITER);
      beginShape();
        vertex(200, x-70);
        vertex(130, x);
        vertex(200, x+70);
      endShape();
stroke(48, 250, 198);
fill(250, 200, 100);


noFill();
stroke(255, 225, 162);  
     strokeJoin(MITER);
     beginShape();
        vertex(mouseX, y-100);
        vertex(300, y);
        vertex(mouseX, y+100);
    endShape();
    
stroke(200);      
      strokeJoin(MITER);
      beginShape();
        vertex(200, y-70);
        vertex(270, y);
        vertex(200, y+70);
      endShape();
fill(250, 200, 100);

}

void keyPressed( ) { 
    if (key==CODED)
       if (keyCode== DOWN)
         y++;
     else if (keyCode== UP)
              if (x>1)
              y--;
    if (keyCode== RIGHT)
         x++;
     else if (keyCode==LEFT)
              if (x>1)
              x--;
  }



