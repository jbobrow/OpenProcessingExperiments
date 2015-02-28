
void setup() {
  size(1000, 500);
  background(#FFFFFF);
 }
 
 void draw() {
  if (keyPressed == true) {
 
  background(#FFFFFF);
  
};
  smooth();
  if (mousePressed == true) {
  //relief
line(mouseX-200/5-mouseX/1.9, mouseY+300/3-mouseY/2,mouseX-200/5-mouseX/2, mouseY+300/3-mouseY/2);
line(mouseX-200/5-mouseX/2, mouseY+300/3-mouseY/2,mouseX+400/7-mouseX/1.8, mouseY+150/3-mouseY/2);
line(mouseX+600/7-mouseX/1.8, mouseY+150/3-mouseY/2,mouseX+500/7-mouseX/2,mouseY+150/3-mouseY/2);
line(mouseX+400/7-mouseX/1.8, mouseY+150/3-mouseY/2,mouseX+500/7-mouseX/2,mouseY+150/3-mouseY/2);
line(mouseX+500/7-mouseX/2,mouseY+150/3-mouseY/2,mouseX+500/7-mouseX/2, mouseY+200/3-mouseY/2);
line(mouseX+500/7-mouseX/2, mouseY+200/3-mouseY/2,mouseX+200/3-mouseX/4, mouseY+200/5-mouseY/4);
line(mouseX+200/3-mouseX/4, mouseY+200/5-mouseY/4,mouseX+200/3-mouseX/4, mouseY+500/5-mouseY/4);
line(mouseX+200/3-mouseX/4, mouseY+500/5-mouseY/4,mouseX+200/5-mouseX/6, mouseY+500/5-mouseY/6);
line(mouseX+200/5-mouseX/6, mouseY+500/5-mouseY/6, mouseX+mouseX/3,mouseY+mouseY/3);
line(mouseX+mouseX/3,mouseY+mouseY/3, mouseX+mouseX*5,mouseY+mouseY*5);
//point
line(mouseX+400/7-mouseX/1.8, mouseY+100/3-mouseY/2,mouseX+400/7-mouseX/1.8, mouseY+100/3-mouseY/2);
line(mouseX+100/9-mouseX/10, mouseY+500/9-mouseY/10,mouseX+100/9-mouseX/10, mouseY+500/9-mouseY/10);

  };
  
  }

