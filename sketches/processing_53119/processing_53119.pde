
//Homework #7 :: 51-257 Sec A :: Michael Loffredo :: mlloffre
//copyright michael loffredo 2012 

float bx, by, bd, bxSpeed, bySpeed; 
float gx, gy, gd, gxSpeed, gySpeed; 
float d; 
float px, py, pd, rx, ry, rd, ox, oy, od, lx, ly, ld; 
float hits; 
float tx, ty, twd, tht;

void setup () 
{ 
  size (400, 400); 
  smooth (); 
  bx = 0;
  by = random (height); 
  bd = 100; 
  bxSpeed = 6;
  bySpeed = 7; 
  
  gx = width/2;
  gy = height/2;
  gd = 100;
  gxSpeed = 0;
  gySpeed = 0;
  
  pd = 100;
  rd = 100;
  od = 100;
  ld = 100;
  
  tx = width/3.5;
  ty = height/4.25;
  twd = width/2;
  tht = height/4;
  
  
  hits = 0; 
  
  textSize (16);
  textAlign (RIGHT);
  
}

void draw ()
{ 
  backdrop ();
  drawPacman (bx, by); 
  bouncePacman (); 
  drawGhost (gx, gy);
  moveGhost ();
  collision ();
  displayText ();
  collisionDetection ();
  textRect (tx, ty);
 
}
  
void textRect (float tx, float ty)
{
  noFill ();
  stroke (255);
  strokeWeight (3);
  rect (tx, ty, twd, tht);
  rectMode (CENTER);
}
  
  
void displayText () 
{ 
  fill (255);
  text ("TIME" +" " + " " + " " + " " + ":" + " " +  " " + " " + " " + millis ( )/1000, width*.45, height*.2);
}
  
  
  
  
void backdrop ()
{
  noStroke ();
  fill (0, 0, 0, 75);
  rect (width/2, height/2, width, height);
}

  
void drawPacman (float bx, float by)
{ 
  fill (240, 217, 44);
  noStroke ();
  arc (bx, by, 50, 50, PI/12, PI*1.75);
}

void bouncePacman ()
{
  bx = bx + bxSpeed; 
  if (bx > width) 
  { 
    bxSpeed = -bxSpeed; 
  } 
  else if (bx < 0)
  {
    bxSpeed = -bxSpeed;
  }
  
  by = by + bySpeed;
  if (by > height)
  { 
    bySpeed = -bySpeed;
  }
  else if (by < 0) 
  { 
    bySpeed = -bySpeed;
  } 
}

void drawGhost (float gx, float gy) 
{ 
fill (26, 39, 255);
rect (gx-4, gy, gd/10, gd/2);
rect (gx+4, gy, gd/10, gd/2);
rect (gx-13, gy+4, gd/10, gd/2);
rect (gx+13, gy+4, gd/10, gd/2);
rect (gx + 20, gy + 5, gd/18, gd/2.25);
rect (gx - 20, gy + 5, gd/18, gd/2.25);
rect (gx - 11, gy + 8, gd/18, gd/2);
rect (gx + 11, gy + 8, gd/18, gd/2);
rect (gx + 24, gy + 12, gd/18, gd/2.25);
rect (gx - 24, gy + 12, gd/18, gd/2.25);
fill (255);
rect (gx - 10, gy - 3, gd/16, gd/16);
rect (gx + 10, gy - 3, gd/16, gd/16); 
rect (gx - 21, gy + 16, gd/20, gd/20); 
rect (gx - 14, gy + 11, gd/12, gd/20); 
rect (gx - 07, gy + 16, gd/12, gd/20);
rect (gx , gy + 11, gd/12, gd/20);
rect (gx + 07, gy + 16, gd/12, gd/20); 
rect (gx + 15, gy + 11, gd/12, gd/20); 
rect (gx + 21, gy + 16, gd/20, gd/20);
 
  
}

void mouseDragged () 
{ 
 if (mouseX > pmouseX) 
 { 
   gxSpeed = gxSpeed + .25;
 }
 else if (mouseX < pmouseX)
{
  gxSpeed = gxSpeed - .25;
}
 if (mouseY > pmouseY)
 { 
   gySpeed = gySpeed + .25;
 }
 else if (mouseY < pmouseY)
 {
   gySpeed = gySpeed - .25;
 }

  
}

void moveGhost () 
{
  gx = gx + gxSpeed;
  if (gx > width + gd*.50)
  {
    gx = -gd*.50;
  } 
  else if(gx < -gd*.50)
  {
    gx = width + gd*.50;
  }
  gy = gy + gySpeed;
  if (gy > height + gd*.50)
  { 
    gy = -gd*.50;
  }
  else if (gy < -gd*.50)
  {
    gy = height + gd*.50;
  }
} 


void collision ()
{
  d = dist (bx, by, gx, gy); 
  if (d < 50)
  { 
  fill (255);
  rect (width/2, height/2, width, height);
  hits++;
  bx = random (0, width);
  by = random (0, height);
  bxSpeed = random (0, bd/10); 
  bySpeed = random (0, bd/10);
  px = random (0, width);
  py = random (0, height); 
  fill (255, 134, 227);
  rect (px-4, py, pd/10, pd/2);
  rect (px+4, py, pd/10, pd/2);
  rect (px-13, py+4, pd/10, pd/2);
  rect (px+13, py+4, pd/10, pd/2);
  rect (px + 20, py + 5, pd/18, pd/2.25);
  rect (px - 20, py + 5, pd/18, pd/2.25);
  rect (px - 11, py + 8, pd/18, pd/2);
  rect (px + 11, py + 8, pd/18, pd/2);
  rect (px + 24, py + 12, pd/18, pd/2.25);
  rect (px - 24, py + 12, pd/18, pd/2.25);
  fill (255);
  rect (px - 10, py - 3, pd/16, pd/16);
  rect (px + 10, py - 3, pd/16, pd/16); 
  rect (px - 21, py + 16, pd/20, pd/20); 
  rect (px - 14, py + 11, pd/12, pd/20); 
  rect (px - 07, py + 16, pd/12, pd/20);
  rect (px , py + 11, pd/12, pd/20);
  rect (px + 07, py + 16, pd/12, pd/20); 
  rect (px + 15, py + 11, pd/12, pd/20); 
  rect (px + 21, py + 16, pd/20, pd/20);
   


  rx = random (0, width);
  ry  = random (0, height); 
  fill (247, 7, 7);
  rect (rx-4, ry, rd/10, rd/2);
  rect (rx+4, ry, rd/10, rd/2);
  rect (rx-13, ry+4, rd/10, rd/2);
  rect (rx+13, ry+4, rd/10, rd/2);
  rect (rx + 20, ry + 5, rd/18, rd/2.25);
  rect (rx - 20, ry + 5, rd/18, rd/2.25);
  rect (rx - 11, ry + 8, rd/18, rd/2);
  rect (rx + 11, ry + 8, rd/18, rd/2);
  rect (rx + 24, ry + 12, rd/18, rd/2.25);
  rect (rx - 24, ry + 12, rd/18, rd/2.25);
  fill (255);
  rect (rx - 10, ry - 3, rd/16, rd/16);
  rect (rx + 10, ry - 3, rd/16, rd/16); 
  rect (rx - 21, ry + 16, rd/20, rd/20); 
  rect (rx - 14, ry + 11, rd/12, rd/20); 
  rect (rx - 07, ry + 16, rd/12, rd/20);
  rect (rx , ry + 11, rd/12, rd/20);
  rect (rx + 07, ry + 16, rd/12, rd/20); 
  rect (rx + 15, ry + 11, rd/12, rd/20); 
  rect (rx + 21, ry + 16, rd/20, rd/20); 
  
  ox = random (0, width);
  oy  = random (0, height); 
  fill (247, 128, 7);
  rect (ox-4, oy, od/10, od/2);
  rect (ox+4, oy, od/10, od/2);
  rect (ox-13, oy+4, od/10, od/2);
  rect (ox+13, oy+4, od/10, od/2);
  rect (ox + 20, oy + 5, od/18, od/2.25);
  rect (ox - 20, oy + 5, od/18, od/2.25);
  rect (ox - 11, oy + 8, od/18, od/2);
  rect (ox + 11, oy + 8, od/18, od/2);
  rect (ox + 24, oy + 12, od/18, od/2.25);
  rect (ox - 24, oy + 12, od/18, od/2.25);
  fill (255);
  rect (ox - 10, oy - 3, od/16, od/16);
  rect (ox + 10, oy - 3, od/16, od/16); 
  rect (ox - 21, oy + 16, od/20, od/20); 
  rect (ox - 14, oy + 11, od/12, od/20); 
  rect (ox - 07, oy + 16, od/12, od/20);
  rect (ox , oy + 11, od/12, od/20);
  rect (ox + 07, oy + 16, od/12, od/20); 
  rect (ox + 15, oy + 11, od/12, od/20); 
  rect (ox + 21, oy + 16, od/20, od/20);
    
    
 
  lx = random (0, width);
  ly  = random (0, height); 
  fill (68, 250, 245);
  rect (lx-4, ly, ld/10, ld/2);
  rect (lx+4, ly, ld/10, ld/2);
  rect (lx-13, ly+4, ld/10, ld/2);
  rect (lx+13, ly+4, ld/10, ld/2);
  rect (lx + 20, ly + 5, ld/18, ld/2.25);
  rect (lx - 20, ly + 5, ld/18, ld/2.25);
  rect (lx - 11, ly + 8, ld/18, ld/2);
  rect (lx + 11, ly + 8, ld/18, ld/2);
  rect (lx + 24, ly + 12, ld/18, ld/2.25);
  rect (lx - 24, ly + 12, ld/18, ld/2.25);
  fill (255);
  rect (lx - 10, ly - 3, ld/16, ld/16);
  rect (lx + 10, ly - 3, ld/16, ld/16); 
  rect (lx - 21, ly + 16, ld/20, ld/20); 
  rect (lx - 14, ly + 11, ld/12, ld/20); 
  rect (lx - 07, ly + 16, ld/12, ld/20);
  rect (lx , ly + 11, ld/12, ld/20);
  rect (lx + 07, ly + 16, ld/12, ld/20); 
  rect (lx + 15, ly + 11, ld/12, ld/20); 
  rect (lx + 21, ly + 16, ld/20, ld/20);
    
    
    
  }
    
  }
  
  void collisionDetection ()
  {
  fill (255);
  text ("GHOST EATEN" + " " + " : " + " " + hits, width*.475, height*.3 );
  }

