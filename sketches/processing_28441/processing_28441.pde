
void setup(){
  size(800, 400);
  background(255);
  smooth();
}
 
void draw(){
   frameRate (20);
  if (mousePressed) {
  
    
    fill(0, 5);
  ellipse(mouseX, mouseY, 10, 10);
  ellipse(mouseX, mouseY, 15, 15);
  ellipse(mouseX, mouseY, 20, 20);
  ellipse(mouseX, mouseY, 25, 25);
  ellipse(mouseX, mouseY, 30, 30);
  ellipse(mouseX, mouseY, 35, 35);
  ellipse(mouseX, mouseY, 40, 40);
  ellipse(mouseX, mouseY, 50, 50);
  ellipse(mouseX, mouseY, 60, 60);
  ellipse(mouseX, mouseY, 70, 70);
  ellipse(mouseX, mouseY, 80, 80);
  ellipse(mouseX, mouseY, 90, 90);
  ellipse(mouseX, mouseY, 100, 100);
  ellipse(mouseX, mouseY, 150, 150);
  ellipse(mouseX, mouseY, 200, 200);
  ellipse(mouseX, mouseY, 300, 300);
  ellipse(mouseX, mouseY, 400, 400);
  ellipse(mouseX, mouseY, 500, 500);
  ellipse(mouseX, mouseY, 700, 700);
  ellipse(mouseX, mouseY, 1000, 1000);
  ellipse(mouseX, mouseY, 2000, 2000);
     
  
  
     fill(0, 0, 0);
  fill(100);
  noStroke();
   quad(pmouseX, pmouseY, mouseX, mouseY, 400, 0, 400, 400 );
     
} else
{

  fill(0, 0, 0);
 
   
  
   
}
}


