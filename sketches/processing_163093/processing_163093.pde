
void setup()
{
 size(1000,1000);
 frameRate(4); 
}

void draw()
{
  float x = random(200,700);
  switch(frameCount%4)
  {
    case 2: background (50);
    noStroke();
    fill(0,200,0);
   triangle(100,1000,400,700,600,1000);
   noStroke();
     fill(0,200,0);
   triangle(600,1000,700,500,900,1000);
   stroke(225,225,0,140);
   strokeWeight(random(4,10));
   line(x,0,x-100,300);
    break;
    case 3: background (100);
    noStroke();
    fill(0,200,0);
   triangle(100,1000,400,700,600,1000);
   noStroke();
     fill(0,200,0);
   triangle(600,1000,700,500,900,1000);
   stroke(225,225,0,140);
   strokeWeight(random(4,10));
   line(x,0,x-100,300);
   stroke(225,225,0,140);
   strokeWeight(random(4,10));
   line(x-100,300,x+400,300);
   stroke(225,225,0,140);
   strokeWeight(random(4,10));
   line(x+400,300,x+100,700);
    break;
    default: background(0);
    break;
  }
}
