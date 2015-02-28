
/* @pjs preload="moleskinesmall.jpg"; crisp="true"; */
void setup() {
  size(644,500);
  PImage img = loadImage("moleskinesmall.jpg");
  background(img);
  
}

void draw(){
   textSize(14);
    text("Left click for pencil. right click for ruler", 30, 25); 
    fill(0,0,0);
  if (mousePressed && (mouseButton == LEFT)) {
    for(int i=0; i<10; i++) {
  point(mouseX + random(4), mouseY + random(4));
    }
  }else if(mousePressed && (mouseButton == RIGHT)){
    line(pmouseX, pmouseY, mouseX,200);
}
}

 








