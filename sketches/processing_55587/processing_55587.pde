
void setup()  
{ 
size (600, 600);
smooth ();
}
 
void draw () {    
if (mousePressed) {
  stroke(0,0,0);
  background (255,0,138);
  fill(255,205,232);
  quad (130,20,460,20,460,500,130,500);
  fill (255,255,255);
  ellipse (220,150, 100,180);
  ellipse (370,150, 100,180);
  fill (random(255),random(255),random(255));
  ellipse (220,150, 80, 80);
  ellipse (370,150, 80, 80);
  stroke (0, 0, 0);
  fill(random(255),0,0);
  ellipse (300,400, 250, 100);
}
 
else {
  background (0,0,0);
  stroke(0,0,0);
  fill (255,255,255);
  ellipse (220,150, 100,180);
  ellipse (370,150, 100,180);
  fill (0,0,0);
  ellipse (map(mouseX,0,width, 170,280), map(mouseY,0,width,70,230), 50,50);
  ellipse (map(mouseX,0,width, 320,430), map(mouseY,0,width,70,230), 50,50);
  stroke(255,255,255);
  line (200, 400, 400,400);
}
}

