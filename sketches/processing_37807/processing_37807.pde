
import processing.pdf.*;

float random1 = random(768);
float random2 = random(768);
float random3 = random(1024);
float random4 = random(768);
float random5 = random(1024);

void setup()
{
 size(1024, 768, PDF, "wallpaper.pdf");
 background(0);
 
}

void draw()
{
for (int i=1; i <= 100; i++)
  {
    fill(255,255,255,160);
    strokeWeight(20/i);
    stroke(200,200-i,(i*12.6));
    ellipse(random1,random2, 800/i, 800/i);
    stroke(200-i,(i*26.6),200);
    ellipse(random2,random3, 800/i, 800/i);
    stroke((i*6.6),200,200-i);
    ellipse(random3,random4, 800/i, 800/i);
    stroke((i*16.6),(i*3.1),200-i);
    ellipse(random5,random3, 800/i, 800/i);
    stroke(200-i,(i*6.6),(i*3.1));
    ellipse(random4,random5, 800/i, 800/i);
    smooth();
  }
  exit();
}

