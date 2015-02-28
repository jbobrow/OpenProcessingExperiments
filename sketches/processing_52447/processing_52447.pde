

int clk = 0;

void setup (){
  size (900,300);
  background (0);
  smooth();
  noFill ();
} 

void draw (){
  pushMatrix();
  for (int i=0; i < width; i+=10){
    strokeWeight(6);
    fill (i,i*2,i*3);
    fill (clk);//used to switch ellipse black to white.
    quad (i,i,random(10-100),random(10-100),mouseX,random(50-200),mouseY,random(0-200));
    fill (i,30,i*20);
    rect (i,0,100,100);
     rect (i,random(10-100),100,random(200-50));
    rect (i,i,random(0-150),i);
    rect (i,i,random(0-200),i);
     rect (i,i,random(0-300),i);
  }
  popMatrix ();
}


  void mouseReleased() {
  if(clk == 0) {
    clk = 255;
    ellipse(width,height,100,100);
  } else {
    clk = 0;
    ellipse(width,height,0,0);
  }
}

