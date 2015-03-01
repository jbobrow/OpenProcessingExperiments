
void setup()
{
  size(500,500);
  background(255);
  smooth();
  frameRate(120);
 
}

void draw() {
  int frames = 0;
  frames=frameCount;
  background(255);
  stroke(0);
  noFill();
  ellipseMode(CENTER);
  translate(width/2,height/2);
  ellipse(0,0,mouseX,mouseX);

  
  /*if(mousePressed) {
    noFill();
    ellipse(0,0,mouseX,mouseX);
  }*/
  

  if (frames>300){
    
   fill(0);
   ellipse(0,0,300,300);
   
  
  }
  else {
  fill(0);
  ellipse(0,0,frames,frames);
  }
  
     float bx;
  float by; 
  bx = width/2.0;
  by = height/2.0;
  if (mouseX > bx-300 && mouseX < bx+300 && 
      mouseY > by-300 && mouseY < by+300) {
   stroke(255);
   noFill();
   ellipse(0,0,mouseX+1,mouseX+1);
  }
}

  
