
float xpos=0;
float ypos=0;
int elipseR=100;
float bx=0;
float by=0;
boolean over = false;
boolean locked = false;
float xOffset=0;
float yOffset=0;

void setup()
{
  size(500,500);
  background(255);
  bx=width/2;
  by=height/2;
}
void draw(){
    
  xpos+=0.1;
  ypos+=0.1;
   background(255);
  strokeWeight(10);
  stroke(0);
  
  point(10,10);
  strokeWeight(0);
  stroke(255,0,0);
  line(15,1,100,30);
  
  noStroke();
  fill(200,100,0,70);
  rect(xpos,ypos,200,50);
  noStroke();
  
  fill(0,100,200,80);
  triangle(bx,20,bx,elipseR,elipseR,by);
 
   if(mouseX>bx-elipseR && mouseX<bx+elipseR && mouseY>by-elipseR && mouseY < by+elipseR)
   {
     over=true;
    }
      else {
    stroke(153);
    fill(153);
    over = false;
    }    
     ellipse(bx,by,elipseR,elipseR);
}

void mousePressed()
{
  if(over) { 
    locked = true; 
    fill(50, 255, 50);
  } 
  else
  {
    locked = false;
  }
  
  xOffset = mouseX-bx; 
  yOffset = mouseY-by; 
}
void mouseDragged() {
  if(locked) {
    bx = mouseX-xOffset; 
    by = mouseY-yOffset; 
  }
}

void mouseReleased() {
  locked = false;
}



