
// Homework #5
//© Eden Weingart 2013
// eweingart@andrew.cmu.edu

float x, y, x1, y1, wd, ht;
color col;
float easing = 0.05;
float easing2 = 0.06;

void setup()
{
  size (400, 400);
  rectMode(CENTER);
  col= color(200, 200, 100);
  x=200;
  y=200;
  x1=200;
  y1=200;
  wd=215;
  ht=215;
}

void draw()
{
  prepScreen();
  
  float targetX = mouseX;
  float dx = targetX -x;
  if(abs(dx) > 1) {
    x += dx * easing;
  }
  
  float targetY = mouseY;
  float dy = targetY - y;
  if(abs(dy) > 1) {
    y += dy * easing;
  }
  
   float targetX1 = mouseX;
  float dx1 = targetX1 -x1;
  if(abs(dx1) > 1) {
    x1 += dx1 * easing2;
  }
  
  float targetY1 = mouseY;
  float dy1 = targetY1 - y1;
  if(abs(dy1) > 1) {
    y1 += dy1 * easing2;
  }
  
  drawHead(x, y, wd, ht);
  drawEars(x, y, wd, ht);
  drawMustache(x, y, wd, ht);
  drawNose(x, y, wd, ht);
  drawGlasses(x, y, wd, ht);
  drawEyes(x1 ,y1 , wd, ht);
}

void keyPressed()
{
  if (key == CODED)
   if ( keyCode == UP )
    { 
      if( ht < 300)
      {ht = ht+5;
      }
    }
    
   else if (keyCode == DOWN)
   { 
     if (ht > 100)
     {
     ht = ht-5;
     }
     
   }
   
   else if (keyCode == RIGHT)
   { 
     if (wd < 300)
    {
     wd = wd+5;
    }
   }
   
   else if(keyCode == LEFT)
   { 
     if (wd > 100 )
     {
     wd = wd-5;
     }
   
   }

   if(key == 'a')
   { 
     if ( wd > 100)
     {
     wd=wd*.9;
     ht=ht*.9;
     }
   }
   
   if(key == 's')
   { 
     if ( wd < 400)
     {
     wd=wd*1.1;
     ht=ht*1.1;
     }
   }
}

void prepScreen()
{
  noStroke();
  fill (col);
  rect (200, 200, 500, 500);
  fill (0, 0, 0, 50);
  
 
  if(key == '1')
  {
    rect (100, 200, 200, 400);
  }
  
  else if (key == '2')
  {
    rect (100, 100, 200, 200);
    rect (300, 300, 200, 200);
  }
  
  else if (key == '3')
  {
    rect (200, 67, 134, 134);
    rect (67, 200, 134, 134);
    rect (333, 200, 134, 134);
    rect (200, 333, 134, 134);
  }
   
  else if (key =='4')
 {
   rect (50, 50, 100, 100);
   rect (250, 50, 100, 100);
   rect (50, 250, 100, 100);
   rect (150, 150, 100, 100);
   rect (350, 150, 100, 100);
   rect (250, 250, 100, 100);
   rect (150, 350, 100, 100);
   rect (350, 350, 100, 100); 
 } 
  
}

void mouseReleased()
{
  col= color (random(255), random(255), random(255));
}

void drawHead(float x, float y, float wd, float ht)
{
noStroke();
fill(255, 242, 237);
ellipse( x, y, wd*1.05, ht*1.05);
}

void drawEars(float x, float y, float wd, float ht)
{
//ears
ellipse( x-wd*.525, y-ht*.09, wd*.15, ht*.125);
ellipse( x+wd*.525, y-ht*.09, wd*.15, ht*.125);;
}

void drawGlasses(float x, float y, float wd, float ht)
{
//left glasses
fill(255);
stroke(0);
strokeWeight(5);
beginShape();
  curveVertex(x+wd*.01, y-ht*.5);
  
  curveVertex(x, y-ht*.15);
  curveVertex(x-wd*.1, y+ht*.01);
  curveVertex(x-wd*.3, y+ht*.01);
  curveVertex(x-wd*.4,y-ht*.15);
  
  curveVertex(x-wd*.35, y-ht*.5);
endShape();

//right glasses
beginShape();
  curveVertex(x-wd*.01, y-ht*.5);
  
  curveVertex(x, y-ht*.15);
  curveVertex(x+wd*.1, y+ht*.01);
  curveVertex(x+wd*.3, y+ht*.01);
  curveVertex(x+wd*.4, y-ht*.15);
  
  curveVertex(x+wd*.35, y-ht*.5);
endShape();

//glasses
line(x-wd*.55, y-ht*.15, x+wd*.55, y-ht*.15);
}

void drawEyes(float x, float y, float ht, float wd)
{
//eyes
strokeWeight(8);
point(x-wd*.20, y-ht*.07);
point(x+wd*.20, y-ht*.07);
}

void drawMustache(float x, float y, float ht, float wd)
{
//mustache
noStroke();
fill(129, 117, 107);
arc(x, y+ht*.325, wd*.6, ht*.3, radians(180), radians(360));
stroke(255, 242, 237);
strokeWeight(3);
line(x, y+ht*.175, x, y+ht*.325);
line(x-wd*.085, y+ht*.17, x-wd*.085, y+ht*.325);
line(x+wd*.085, y+ht*.17, x+wd*.085, y+ht*.325);
line(x-wd*.17, y+ht*.17, x-wd*.17, y+ht*.325);
line(x+wd*.17, y+ht*.17, x+wd*.17, y+ht*.325);
}

void drawNose(float x, float y, float ht, float wd)
{
//nose
noStroke();
fill(224, 197, 186);
quad(x-wd*.035, y-ht*.30, x+wd*.035, y-ht*.30, x+wd*.065, y+ht*.20, x-wd*.065, y+ht*.20);
triangle(x+wd*.065,y+ht*.20, x-wd*.065, y+ht*.20, x, y+ht*.25);

}



