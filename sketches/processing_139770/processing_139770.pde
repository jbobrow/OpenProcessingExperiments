
void setup() {
  size (500, 500); 
   { 
      background (209, 255, 255);
      if (key=='a' && keyPressed==true)
      frameRate (20);
    }}
void draw () {
  if (key=='a' && keyPressed==true)
  background (random (200), random(200), random (200), 30);{
    if (mousePressed) {
    stroke (random (2), 0, 0, random (300));
   ellipse (mouseX, mouseY, random (100), random (100) );
  fill(random (255));
  stroke (100, 0, 122); 
  fill (random (255), random (255), random (255), 30);}
    else if (key=='s' && keyPressed==true){
 stroke (random (2), 0, 0, random (300));
 fill(random (255), random (255), random (255), 30);
 rect (mouseX, mouseY, random (200), random (200) );}
  else if (key=='d' && keyPressed==true){
   textSize (random (30));
   text("color", random (width), random (height));
   fill(random (255), random (255), random (255), random (60));
   }}}


