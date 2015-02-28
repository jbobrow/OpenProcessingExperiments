
float bx;
float by;
int bs = 20;
boolean bover = false;
boolean locked = false;
float bdifx = 0.0; 
float bdify = 0.0; 


void setup() 
{
  size(400, 400);
  bx = width/2.0;
  by = height/2.0;
  rectMode(RADIUS);  
}

void draw() 
{ 
  background(255);
  // Test if the cursor is over the box 
  if (mouseX > bx-bs && mouseX < bx+bs && 
      mouseY > by-bs && mouseY < by+bs) {
    bover = true;  
    if(!locked) { 
      stroke(255); 
      fill(76,82,242);
      background (250,109,125);
    } 
  } else {
    stroke(153);
    fill(105,187,247);
    bover = false;
  }
  
  // Draw the box
  
  rect(bx, by, bs, bs);
  rect(by,bx,bs,bs);
  rect(bx,bs,by,bs);
}

void mousePressed() {
    if(bover) {
    locked = true; 
    fill(68,240,204);
    
    
    
  } else {
    locked = false;
    
  }
  bdifx = mouseX-bx; 
  bdify = mouseY-by; 

}

void mouseDragged() {
  if(locked) {
    bx = mouseX-bdifx; 
    by = mouseY-bdify; 
    
  }
}

void mouseReleased() {
  fill(250,109,125);
    
  locked = false;
}



