
/**
 
Beads - Jeff Nyhoff <br/>
 
Move mouse to draw "glass beads."
 
*/
 
 
 
void setup()
 {
   size( 400, 600 );
   background( 0, 255, 0);
   smooth();
   frameRate(20);
 }
 
void draw()
 {
   background(random(255),random(255),random(255),random(255));
   strokeWeight(50);
   fill( random(255),random(255),random(255),random(255) );
   rect(0,0,mouseY,mouseX);
   rect(mouseX,mouseY,400,600);
   line(mouseX,mouseY,0,0);
   line(mouseY,mouseX,400,600);
   textAlign(CENTER);
   text("☺",mouseX,mouseY);
   fill(random(255),random(255),random(255));
   textSize(random(155));
   fill(255, 255, 255, 30); 
   rect( 0, 0, width, height );
   text("☻",mouseX,55);
   text("☻",mouseX,600);
   text("☻",350,mouseY);
   text("☻",15,mouseY);
   ellipse(mouseX,mouseY,255,255);
   ellipse(mouseX,mouseY,400,600);
   ellipse(mouseX,mouseY,100,500);

 
}
