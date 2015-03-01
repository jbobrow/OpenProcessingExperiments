
void setup() {
  size(600, 600);    
 
  background(0,0,00);   
  mouseX=width+300;
  mouseY=height-300;
}

  void mousePressed (){
  background(0);
  }
  
void draw(){
  noFill ();
  stroke (5);
  stroke (#ED0E42);
 
    ellipse(500,500, mouseX, mouseY);
    
    stroke (#72E00E);
     ellipse(100,100, mouseX, mouseY);
     
        stroke (#FFE203);
     ellipse(100,500, mouseX, mouseY);
  
     stroke (#039CFF);
     ellipse(500,100, mouseX, mouseY);
}

