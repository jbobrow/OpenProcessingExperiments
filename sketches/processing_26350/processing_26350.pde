
color fil;
 	

import processing.video.*;

MovieMaker mm;  // Declare MovieMaker object

void setup(){
  size(500,500);
  smooth();
  mm = new MovieMaker(this, width, height, "drawing.mov",
                       30, MovieMaker.ANIMATION, MovieMaker.BEST);

  background(255);
  noStroke();
  fill(68,14,98);
  rect(50,400,100,60);
    fill(75,200,73);
  rect(200,400,100,60);
    fill(202,50,50);
  rect(350,400,100,60);
}
void draw(){
  if (mousePressed ==true){
    fill(fil);
    ellipse(mouseX,mouseY+10,5,5);
        ellipse(mouseX,mouseY-10,5,5);
           ellipse(mouseX+10,mouseY,5,5);
        ellipse(mouseX-10,mouseY,5,5);
   rect(mouseX-5,mouseY-5,10,10);
    mm.addFrame();  // Add window's pixels to movie

    if(mouseX>50 && mouseX<150 && mouseY>400 && mouseY<460 &&(mousePressed== true))
   {
     fil = color(68,14,98);
   
   }
   if(mouseX>200 && mouseX<300 && mouseY>400 && mouseY<460 &&(mousePressed== true))
   {
     fil = color(75,200,73);
  }
   if(mouseX>350 && mouseX<450 && mouseY>400 && mouseY<460 &&(mousePressed== true))
   {
     fil = color(202,50,50);
}
  }
}
void keyPressed() {
  if (key == ' ') {
    mm.finish();  // Finish the movie if space bar is pressed!
  }
}
 
  

