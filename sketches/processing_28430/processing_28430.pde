
void setup() {
  size(500, 500);
  background(0);
  smooth();
}
 
void draw() {

  fill(255);
ellipse(250,250,250,250);


 // stroke(0,mouseX/2);
 // stroke(0,width-mouseX);  

   fill(0,1);
  noStroke();
  rect(0,0,500,500);
  
  stroke(255, 99);
  line(500, 250, mouseX, mouseY);
  
  stroke(255, 99);
  line(250, 500, mouseX, mouseY);
  
  stroke(255, 99);
  line(250, 0, mouseX, mouseY);
  
  stroke(255, 99);
  line(0, 250, mouseX, mouseY);
 
  
  
  fill(0,20);
   ellipse (mouseX, mouseY,300,300);
   fill(0,30);
   ellipse (mouseX, mouseY,280,280);
     fill(0,40);
   ellipse (mouseX, mouseY,260,260);
   fill(0,50);
   ellipse (mouseX, mouseY,240,240);
   fill(0,60);
   ellipse (mouseX, mouseY,220,220);
   fill(0,70);
  
     }



