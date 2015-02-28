
int x=0;
int moving = 1;

void setup() { // runs once
  size(800,600);
}

void draw() {
  background(0); // draw black 
  
  if (moving == 1) {
    x = x + 1;
  }  
  println(x);
  
  pushMatrix();
  translate(x,0); // moves the origin
  
  fill(0,0,255);
  stroke(204, 102, 0);
  strokeWeight(5);
  ellipse(400,300,100,100);
  rect(400,300,100,100);
  
  
  popMatrix();
 
 
  // GUI
  rect(10,40,10,10);
  textSize(32);
  text("word", 10, 30); 
}

void mousePressed() {
  println("mouse clicked");
  // rect(10,40,10,10);
  
  if (mouseX>10 && mouseX<20 && mouseY>40 &&  mouseY< 50) {
  
    if (moving == 1) {
      moving = 0;
    } else if (moving == 0) {
      moving = 1;
    }
    
  
  }
  

}

