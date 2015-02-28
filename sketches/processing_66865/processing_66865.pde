
void setup(){
  size(500,400);
  background(255);
  noStroke();
  smooth();

}

void draw(){
}

void mousePressed(){
    fill(44,147,255,20);
    rect(0,0,500,400);  
}

void mouseDragged(){
   fill(random(0,255),random(0,40),random(100,255), 127);
//   ellipse(mouseX,mouseY,25,25);
   quad(mouseX,mouseY,190,110,190,150,115,150);
 }
 
void mouseReleased(){
   fill(255,0,0);
   ellipse(mouseX,mouseY, 30,30);
}

 
  


