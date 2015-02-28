
int threshold;
int prevMillis=0;
float l =0;
PFont oldstyle;
String emerge = "emerge";


float x, y;



void setup()
{
  size(500, 500);
  smooth();
  threshold = 200;
  oldstyle = loadFont("OldStyle1HPLHS-25.vlw");
  textFont(oldstyle);
  textAlign(CENTER, CENTER);

  x=width/2;
  y=height/2;
}

void draw()
{  
  

  float distText = dist(x, y, mouseX, mouseY);

  if (distText <= 60)
  { 
   
    if (millis() - prevMillis >= threshold)
    {
       pushMatrix();
      background(6);
      fill(l);
      text(emerge, x, y);
      l += 15;

      prevMillis += threshold;
       popMatrix();
    }
   
  }
 

  else
  { 
   if (millis() - prevMillis >= threshold)
    {
       pushMatrix();
      background(6);
      fill(l);
      text(emerge, x, y);
      l -= 35;

      prevMillis += threshold;
       popMatrix();
    }
  }
}


