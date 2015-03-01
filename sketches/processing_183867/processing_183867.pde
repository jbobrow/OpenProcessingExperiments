
float x = 0;
float y= 0;

void setup() {
  size(400, 400);
  background(#FA08FF);
  stroke(255);
}

void change_line_color (){ 
  
  if (random (100)>80) {
    stroke (0);
  }else {
  stroke (0);
}
}
  void keyPressed () {
    save ("processingdrawing.png");
  }
  
void draw() {
  
  stroke (#E0B2FF);
  strokeWeight(8);
  
  if (mousePressed ==true) {
      point (mouseX,mouseY);
  }
  

 
  stroke (#65FAEC);
  strokeWeight(8);
  line(x, 200, x, 100);
  x = x + 1;
  
   line (200, y, 200, y);
  //strokeWeight ();
   y = y + 1;

stroke (#65FAEC);
  strokeWeight(8);
  line(x,100,x,200);
  
  if (x > width) {
    x = 0;
  }
  
  if (y > 400) {
  y = 0;
  }
  // sometimes we decide to change the line color
  if (random(100) > 70) {
    change_line_color ();
  }
    // now we decide if to use black or white
    if (random(100) > 50) {
      change_line_color ();
  
      stroke(0);
    } 
    else {
      stroke(255);
    }
    
  }
