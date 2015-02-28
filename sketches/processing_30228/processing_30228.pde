
void setup(){
  size (255,255);
}

void draw(){
  background(mouseX,mouseY,sqrt((mouseY-255)^2));
}
  
 void mousePressed(){
    println("("+Integer.toString(mouseX)+","+Integer.toString(mouseY)+","+ Integer.toString(255-mouseY)+")");
}

