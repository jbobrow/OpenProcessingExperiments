
color fil;
color r = color(255,0,0);
color g = color(0,255,0);
color b = color(0,0,255);
 
void setup() {
   
  size (700,400);
  background(0);
  fill(r);
  smooth();
  
   
  ellipse (70,325,49,49);
  rect (70,300,50,50);
  fill(g);
  ellipse (170,325,49,49);
  rect (170,300,50,50);
  fill(b);
  ellipse (270,325,49,49);
  rect (270,300,50,50);
  fill(150);
 
   
   
}
 
void draw() {
  
   
 
  if (mousePressed == true) {
    fill(fil);
 
    ellipse(mouseX,mouseY, 40,40);
  }
 
 
  if (mouseX>70 && mouseX<130 && mouseY>300 &&mouseY<350 &&(mousePressed == true)) {
    fil = color(r);
  }
 
  if (mouseX>170 && mouseX<230 && mouseY>300 &&mouseY<350 &&(mousePressed == true)) {
    fil =  color(g);
  }
 
  if (mouseX>270 && mouseX<330 && mouseY>300 &&mouseY<350 &&(mousePressed == true)) {
    fil = color(b);
  }
   
   
}
 

