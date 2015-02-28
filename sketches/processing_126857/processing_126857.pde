
void setup() {
  size(200, 200);
 
}
 
void draw() {
  background(255);
   
  fill(100, 300, 15);
  rect(mouseX, mouseY, 50, 60, 100); //body// 
 
  line(mouseX +12, mouseY+50, mouseX+40, mouseY+50); //mond//75,15 //115, 135
  
  fill(300, 1, 1);
  line(mouseX +15, mouseY, mouseX+10, mouseY -25);//antenne 110, 70, 110, 50
    
  ellipse(mouseX +10, mouseY -25, 8, 8);//antennebol 110, 50
 
 
  fill(300, 1, 1);
  rect(mouseX +4, mouseY +79, 20, 12, 2);//linkerbeen 29 149
  rect(mouseX +26, mouseY +79, 20, 12, 2);//rechterbeen 61 149
 
  fill(100, 300, 15);
  rect(mouseX -20, mouseY +50, 20, 6, 5);//linkerarm 55, 100
  rect(mouseX +50, mouseY +50, 20, 6, 5);//rechteram 100, 100

 
  fill(300, 1, 1);
 
  ellipse(mouseX +15, mouseY+25, 15, 15);//oog links
  ellipse(mouseX +37, mouseY+25, 15, 15);//oog rechts
  
  fill(100,300,15);
  
  ellipse(mouseX +15, mouseY+25, 8, 8);//oog midden links
  ellipse(mouseX +37, mouseY+25, 8, 8);//oog midden rechts
 
}
