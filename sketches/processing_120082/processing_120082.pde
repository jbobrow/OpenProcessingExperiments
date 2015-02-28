
PImage motif1, motif2, motif3;

void setup() {
  size(800, 800);
motif1 = loadImage ("hugo-shape-4.png");
motif2 = loadImage ("hugo-shape-2.png");
motif3 = loadImage ("hugo-shape-11.png");
imageMode (CENTER);

background(255);
 }
 
 int counter = 0;

boolean drawBackground = true;
boolean drawForeground = true;

 void draw() {
   pushMatrix();
   
   rotate(random(0, 2*PI));
   
  
   float w1= motif1.width;
   float h1 = motif1.height;
   
   float x1 = random (0, width);
   float y1 = random (0, height);
   float s1 = random (7, 15);
   
   //tint(255, 255, 255, 50);
   tint(255, 100, 70, 100);
   
   if(drawBackground)
     image(motif1, x1, y1, w1/s1, h1/s1);
   
   float w2 = motif2.width;
   float h2 = motif2.height;
   
   tint(255);
   if(drawForeground)
   image(motif2, mouseX, mouseY, w2/5, h2/5);
   
  
   popMatrix();
   
   counter++;
   println(counter);
 }
 
 void mousePressed() {
   pushMatrix();
   
   translate(mouseX, mouseY);
   rotate(random(0, 2*PI));
   image(motif3, 0, 0, motif3.width/5, motif3.height/5);
   
   popMatrix();
 }
 
boolean loop = true;
 void keyPressed() {
   if (key == 't')
   {save("image" + counter + ".tif");
   }
   else if (key == 'e') {
     loop = !loop;
     if(loop) loop();
     else noLoop();
   }
   else if(key == 'b') {
     drawBackground = !drawBackground;
   }
   else if(key == 'f') {
     drawForeground = !drawForeground;
   }
 }

