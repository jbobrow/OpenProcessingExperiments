
//Credit to Enrico Fraioli 
PFont font1; PFont font2;

void setup() {
  size(400, 400);
  background(0);
  smooth();
  frameRate(100);
  
  font1= loadFont("Garton-48.vlw");
  textFont(font1);
 
  font2= loadFont("FelixTitlingMT-48.vlw");
  textFont(font2);
  
}
 
void draw() {
 
   textFont(font1);
  textSize(20);
  fill(#FF0000);
  text("rita", random(400), random(400));
  textFont(font2);
  textSize(20);
  fill(#F200FF);
  text("kassia", random(400), random(400));
  
  
  
  fill(255, 30);
  noStroke();
  rect(0, 0, width, height);
 
  stroke(0);
  ellipse(50, 50, mouseX/2-20, mouseX/2-20);
  ellipse(250, 250, mouseX/2, mouseX/2);
  ellipse(150, 150, mouseY/2, mouseY/2);
  ellipse(350, 350, mouseY/2-20, mouseY/2-20);
  stroke(0);
  ellipse(50, 350, mouseX/2-20, mouseX/2-20);
  ellipse(250, 150, mouseX/2-50, mouseX/2-50);
  ellipse(150, 250, mouseY/2-50, mouseY/2-50);
  ellipse(350, 50, mouseY/2-20, mouseY/2-20);
   stroke(0);
  ellipse (mouseX, mouseY, 100,100);
  ellipse (mouseX, mouseY, mouseX-50, mouseY-70);
  ellipse (mouseX, mouseY, mouseX-100, mouseY-30);
  ellipse (mouseX-150, mouseY+150, 100, 100);
  ellipse (mouseX-150, mouseY+150, mouseX-50, mouseY-70);
  ellipse (mouseX-150, mouseY+150, mouseX-100, mouseY-30);
  
  //Rita's Edit - edited the colours & added the fonts & the text
  

}

void mouseMoved(){
  
   textFont(font1);
  textSize(20);
  fill(#9800FF);
  text("rita", random(400), random(400));
  textFont(font2);
  textSize(20);
  fill(#46B736);
  text("Angela", random(400), random(400));
}


