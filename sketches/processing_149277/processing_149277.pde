
int fy=150;

void setup() 
{
  size(500,500);
  smooth();
  // Set "ink" color, font, and alignment for rendering text.
  fill(0);  // Black
  // set up the font (system default sans serif)
  textFont(createFont("SansSerif",18));
  textAlign(CENTER);
  //noLoop();  // draw() executes only once
}

void draw() {
  background (#00FFFF);
 
  
  fill (0);
  text("It’s Spring time!", 250, 430);
 fy = fy -1;
 if (fy < 0) {fy = 0;}
  pushMatrix();
  translate(0,fy);
  fill (#60CC54);
  rect (200,210,10,50);
  fill (#FFFF00);
  ellipse (200,173,40,40);
  fill (#FF0080);
  ellipse (180,140,40,40);
  ellipse (160,178,40,40);
  ellipse (215,138,40,40);
  ellipse (240,170,40,40);
  ellipse (215,205,40,40);
  ellipse (177,205,40,40);
  popMatrix();
  
  fill (#800000);
   rect (140,260,140,150);
  quad (130,250,290,250,280,270,140,270);
      if (keyPressed)
 { if (key == 'f' || key == 'F'){
   fill (0);
    rect (195,170,1,5);
    rect (205,170,1,5);
    ellipse (200,183,8,8);
  }}
  if (keyPressed)
 { if (key == 't');
 fill (#FFFF00);
 ellipse (40,30,50,50);
 }

}

