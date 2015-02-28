
//John Weiler P4 Engineering
//4/8/2014
//4/9/2014
//4/10/2014
//4/10/2014
int a = 150;
int rx = 0;
int rgrow =1;
int ry = 0;
int a2 = 150;
int r2x = 0;
int r2grow =1;
int r2y = 0;
void setup()
{
 size (400,400);
  
 {background (random(0,255),random(0,255),random(0,255));}
}
void draw()
{
  
  if (mousePressed) {background (random(0,255),random(0,255),random(0,255));}
  else background (255,255,255);
   textSize(11);
  text("Space will ad some rectangles and click will randomize the background!", 10, 300);
  fill(82, 192, 150);
 pushMatrix();
   fill(random(0,255),random(0,255),random(0,255));
   ellipse(mouseX ,mouseY ,50,50);
 popMatrix();
   
rect(rx,ry,250,25);
 rx = rx + rgrow;
 if (rx==0||rx==400)
 {rgrow = rgrow *-1;
  fill (random(0,255),random(0,255),random(0,255));
  rect(rx,ry,25,25);}
  ry = ry + rgrow;
  if (ry==0||ry==400)
 {rgrow = rgrow *-1; fill (random(0,255),random(0,255),random(0,255));
  rect(rx,ry,25,25);}
  if (keyPressed)
   rect(200,20,20,20);
  if (keyPressed)
   rect(200,200,20,20);
   println ("This is my print screen, I cant think of any thing to put here but i want to prove that I can do it!!");
  textSize(32);
  text("Avoid", 10, 30);
  fill(0, 102, 153);
  text("The", 10, 60);
  fill(0, 102, 153, 51);
  text("Shapes", 10, 90);
   textSize(20);
  text("By", 200, 30);
  fill(100, 150, 153);
  text("John", 200, 60);
  fill(100, 102, 153, 99);
  text("Weiler", 200, 90);
 
}

