

int timer = 0;
float m;
void setup() {
  size(800, 800);
  background(102);
}

void draw() {
  
  stroke(255);
 {
  line(mouseX, mouseY, pmouseX, pmouseY);
}
 if(m%5000 == 0){
   println(m);
    println ("x=" + mouseX);
    println ("y=" + mouseY);
  }
  
  
    line(mouseX, mouseY, pmouseX, pmouseY);
    
  }


