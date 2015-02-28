

PFont post;
String s = "S";
String t = "t";
String r = "r";
String u = "u";
String g1 = "g";
String g2 = "g";
String l = "l";
String e = "e";

float x, y;



void setup()
{
  size(500, 500);
  smooth();

  post = loadFont("PostinkantajaJob-75.vlw");
  textFont(post);
  textAlign(CENTER, CENTER);

  x=width/2;
  y=height/2;
}

void draw()
{  
  background(255);
  fill(0);
  translate(-20, 0);

  float distS = dist(x-100, y, mouseX, mouseY);
  float distT = dist(x-60, y, mouseX, mouseY);
  float distR = dist(x-30, y, mouseX, mouseY);
  float distU = dist(x, y, mouseX, mouseY);
  float distG1 = dist(x+30, y, mouseX, mouseY);
  float distG2 = dist(x+60, y, mouseX, mouseY);
  float distL = dist(x+100, y, mouseX, mouseY);
  float distE = dist(x+140, y, mouseX, mouseY);

  if (distS <= 100) 
  {  
    text(s, x-(random(90, 120)), random(240,260));
  }
  else
  {   
    text(s, x-100, y);
  }

  if (distT <= 100) 
  {  
    text(t, x-(random(50, 90)), random(240,260));
  }
  else
  {
    text(t, x-60, y);
  }

  if (distR <= 100) 
  {  
    text(r, x-(random(20, 40)), random(240,260));
  }
  else
  {
    text(r, x-30, y);
  }

  if (distU <= 100) 
  {  
    text(u, x+(random(20)), random(240,260));
  }
  else
  {
    text(u, x, y);
  }

  if (distG1 <= 100) 
  {  
    text(g1, x+(random(20, 60)), random(240,260));
  }
  else
  {
    text(g1, x+30, y);
  }

  if (distG2 <= 100) 
  {  
    text(g2, x+(random(50, 90)), random(240,260));
  }
  else
  {
    text(g2, x+60, y);
  }

  if (distL <= 100) 
  {  
    text(l, x+(random(90, 130)), random(240,260));
  }
  else
  {
    text(l, x+100, y);
  }

  if (distE <= 100) 
  {  
    text(e, x+(random(130, 180)), random(240,260));
  }
  else
  {
    text(e, x+140, y);
  }
}



