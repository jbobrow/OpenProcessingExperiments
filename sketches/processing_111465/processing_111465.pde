
PImage pic;
float stat = 0;
boolean drawApllied = false;

void setup()
{
  size(750, 500);
  pic = requestImage("order_v_chaos.jpg");
  frameRate(3);
}
  
void draw()
{

    if (pic.width > 0)
    {
      image(pic, -75, -100, width+210, height+140);
      pic.filter(GRAY);
    }
    
    //pic = loadImage ("order_v_chaos.jpg");
    //image(pic, 0, 0);
    //pic.filter(GRAY);
    //image(pic, -75, -100);
    
    stroke(random(255), random(0), random(0));
    ellipse(64, 160, 50, 60);
    stroke(random(0), random(0), random(255));
    ellipse(143, 138, 50, 60);
    stroke(random(0), random(255), random(0));
    ellipse(215, 140, 50, 60);
    stroke(random(255), random(0), random(0));
    ellipse(285, 145, 50, 60);
    stroke(random(0), random(0), random(255));
    ellipse(360, 140, 50, 60);
    stroke(random(255));
    ellipse(425, 120, 50, 60);
    stroke(random(0), random(255), random(0));
    ellipse(496, 136, 50, 60);
    stroke(random(255), random(0), random(0));
    ellipse(570, 146, 50, 60);
    stroke(random(0), random(0), random(255));
    ellipse(661, 132, 50, 60);
    stroke(random(0), random(255), random(0));
    ellipse(736, 140, 50, 60);
    
    stroke(random(255));   
    line(172, 500, 750, 398);
    line(0, 483, 750, 363);   
    line(475, 500, 750, 445);  
    line(103, 500, 100, 468);
    line(243, 500, 220, 449);
    line(385, 500, 328, 430);
    line(536, 500, 425, 415);
    line(684, 500, 515, 402);
    line(750, 459, 590, 389);
    line(750, 405, 670, 376);
    
if (drawApllied == false)
  {
float x = 0;
float y = 20;
float prevX = x;
float prevY = y;
strokeWeight(2);
while (x < 750)
{
  x += 10;
  y += random(-10,10);
  line(prevX, prevY, x, y);
  line(prevX, prevY + 15, x, y + 15);
  prevX = x;
  prevY = y;
}
//drawApllied = true;
  }
    
    
  stroke(0);  
  stat = stat + .01;
  float nois = noise(stat) * width;
  line(nois, 0, nois, height);
  line(nois + 1, 0, nois + 1, height);
  line(nois + 30, 0, nois + 30, height);
  line(nois + 31, 0, nois + 31, height);
  line(nois + 90, 0, nois + 90, height);
  line(nois + 91, 0, nois + 91, height);
  
}



