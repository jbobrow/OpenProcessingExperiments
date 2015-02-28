
//Homework Assingment 4
//51-257 A
//Copyright 2012 Marcos Gonzalez-Bode megonzal@andrew.cmu.edu



float wd, ht,f,w,rw,rt;

void setup() {
  size(400, 400);
  smooth();
  
  
  wd = 50;
  ht = 50;
  rw = 35;
  rt = 35;
  f = color(0);
  w = color(255);
}

void draw() {  
  
  drawCircxx(mouseX, mouseY);
  
  //saveFrame("Hw3.jpg");

}
  
void drawCircxx(float x, float y) {
   fill(f,20);
   noStroke();
   rect(0,0, width, height);
      if(mousePressed) {    
        noFill();
        stroke(255);
        strokeWeight(2);
        ellipseMode(CENTER);
        ellipse(x, y, wd, ht);
        rect(x,y,rw,rt);
          }
          
        else {
          fill(random(45,50));
          rect( 0, 0, width, height);  
        }
        
}


