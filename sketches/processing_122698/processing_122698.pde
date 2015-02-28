
int x,y;

void setup() {
  size(600, 600);
  frameRate(15);
}
void draw() {
  //background(0);
  line(width/2, height/2, mouseX, mouseY);
}
void mouseDragged(){
  stroke(0);
   line(mouseX, mouseY,mouseX+3,mouseY+3);
   line(mouseX, mouseY,mouseX-60,mouseY-3);
   //line(mouseX, mouseY,mouseX+40,mouseY+30); 
   rect(mouseX, mouseY,40,30);
}
  
void keyPressed() {
  
  
  switch(key){
    case'a':
    stroke(0);
    fill(255,255,0);
    println("a");
    break; 
    
    case 's':
    stroke(0);
    fill(0,255,255);
    println("s");
    break;
    
    case'd':
    stroke(0);
    fill(255);
    println("d");
    break;
    
    case'f':
     background(200);
    println("f");
    break;  
  }
 
  }



