
void setup(){
  size(750,750);
    colorMode(HSB,100);
   background(75);
   frameRate(30);
  
}

 void mousePressed (){
   colorMode(HSB,100);
   background(75);
   ellipse(mouseX,mouseY,15,15);
}

 int x = 1;

void draw(){
  stroke(0);
   colorMode(HSB,100);
  fill(20,100,100);
  smooth();
   ellipse(mouseX+x,mouseY+x,15,15);
   ellipse(mouseX-x,mouseY-x,15,15);
    ellipse(mouseX+x,mouseY-x,15,15);
     ellipse(mouseX-x,mouseY+x,15,15);
      ellipse(mouseX+x,mouseY,15,15);
       ellipse(mouseX,mouseY+x,15,15);
        ellipse(mouseX-x,mouseY,15,15);
         ellipse(mouseX,mouseY-x,15,15);
         x++;
}
 

