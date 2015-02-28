
void setup() {
background(100, 100, 10);
size(500, 500);
smooth();
}
  
void draw() {
 
 
 
fill(255, 0, 255-mouseX);
quad(mouseX, mouseY, 50, 500, 425, 500, 450, 200);
 
fill(255, 0-mouseY, 143-mouseX);
ellipse(mouseY, mouseX, 400, 350);
 
 
 
line(200, 185,500- mouseX,500- mouseY);
line(500-mouseX,500- mouseY, 250, 200);
 
 
 
ellipseMode(CENTER); 
ellipse(300, 150, (400-mouseX) * 0.1,(400-mouseX)* 0.1);
ellipseMode(CENTER);
ellipse(200, 200, (400-mouseX)* 0.1, (400-mouseX)* 0.1);
 
line(mouseX, mouseY, 500, 300);
line(mouseX, mouseY, 200,500);
line(mouseX, mouseY, 200,100);
line(mouseX, mouseY, 100,100);
line(mouseX, mouseY, 50,500);
line(mouseX, mouseY, 10,500);
line(mouseX, mouseY, 5,500);
  
  
  
  //stroke(255,20,100);
  //strokeWeight(mouseX / 200);
  
 
  //line(mouseX, mouseY, 50-mouseX,  mouseY);
  //line(mouseX, 300-mouseY, 300-mouseX,  mouseY);
  //line(50-pmouseX, mouseY, mouseX,  mouseY);
   
   
  //ellipseMode(CENTER);
  //ellipse(300-pmouseX,300- pmouseY,300 - pmouseX,300 - pmouseY);
  //ellipseMode(CORNER);
  //fill(255-mouseY,100-mouseY,255-mouseX,255-mouseY);
  //ellipse(mouseX,mouseY, mouseX, mouseY);
 
}
