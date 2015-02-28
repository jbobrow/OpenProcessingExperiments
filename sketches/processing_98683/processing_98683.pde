
PGraphics pg;

int lastMouseX = -1;
int lastMouseY = -1;

boolean drawn = false;

void setup()
{
  size(800,800);
pg = createGraphics(800, 800);

}




void draw(){
   
  fill(255,255,255,100);
  // If the mouse is not pressed, fade the drawing
  if (!mousePressed){
    rect(0, 0, width, height);
  }
  
  if (drawn == true){
    image(pg, 0, 0, 800, 800);
  }
  
  float c = 1/(sqrt( sq(abs(400-mouseX)) + sq(abs(400-mouseY)) ));

if (c > 0.1) 
    {c = 0.1;
    fill( random(255), random(255), random(255), random(0));
    }
if (pmouseX != -1) {
        strokeWeight(1.5);
stroke(0);
    line(pmouseX, pmouseY, mouseX, mouseY);
    }
    //lastMouseX = mouseX;
    //lastMouseY = mouseY; 
 
 {
  if (mousePressed == true) {
    //fill(255);
    pg.fill( random(255), random(255), random(255), random(0,10));
        pg.noStroke();
    pg.ellipse(abs(800-mouseX), abs(800-mouseY), c, c);
        pg.strokeWeight(0.1);
        pg.stroke( random(255), random(255), random(255), random(255));
        pg.line(pg.width*0.5, pg.height*0.5, mouseX, mouseY);
        //pg.line(pmouseX, pmouseY, mouseX, mouseY);
  } 
} 
  
  
  
  frameRate(20);
           // strokeWeight(0);
           noStroke();
            

    
  fill( random(255), random(255), random(255), random(255));
        ellipse(abs(800-mouseX), abs(800-mouseY), c*5000, c*5000);
    //delay(50);
}


void mousePressed(){
  pg.beginDraw();
}

void mouseReleased(){
  pg.endDraw();
  drawn = true;
}


// If the space bar is pressed, clears window entirely.
void keyPressed() {
  if (key == ' ') {
      pg.clear();
  }
}

//http://127.0.0.1:54012/


