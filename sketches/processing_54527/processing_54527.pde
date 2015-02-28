
int rectWidth;
   
void setup() {
  size(320, 240);
  noStroke();
  background(0);

}

void draw() { 
text("Press A, B or C !",20,20);
}

void keyPressed() {
 
  if (key == 'a'){
    background(0);
    fill(255,0,0);
    rect (45,45,35,35);
    println("a");
  }
  
    else if (key == 'b'){
      background(0);
      fill(255,255,0);
      triangle(180, 10, 200, 200, 160, 200); 
      println("b");
    
  }
  
    else if (key == 'c'){
      background(0);
      fill(0,0,255);
      ellipse(140, 80, 40, 40);
      println("c");
    
  }
  
 
}

