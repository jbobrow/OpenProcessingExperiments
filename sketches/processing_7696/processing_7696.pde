
/*Libby Riefler <er845@bard.edu
  Feb 17 2010
  TVSelfPortrait
*/

void setup()
{
  size(400, 300);
  smooth();
}


void draw()
{
  background(102, 183, 127);
  strokeWeight(3); 
  fill(40, 75, 100); 
  rect(100, 75, 200, 150);
  line(125, 225, 132.5, 240);
  line(140, 225, 132.5, 240);
  line(260, 225, 267.5, 240);
  line(275, 225, 267.5, 240);//TV
  
  strokeWeight(2);
  fill(160);
  rect(115, 90, 150, 120);//screen boarder
  
  strokeWeight(1);
  rect(125, 100, 130, 100);//screen
  
  fill(120);
  ellipse(282, 120, 12, 12);
  ellipse(282, 150, 12, 12);
  line(270, 170, 295, 170);
  line(270, 180, 295, 180);
  line(270, 190, 295, 190);//dials
  
  fill(252, 167, 82);
  ellipse(190, 150, 50, 60);//face
 
  fill(255);
  ellipse(182, 145, 9, 7);
  ellipse(198, 145, 9, 7);
  fill(5, 87, 167);
  ellipse(182, 145, 3, 3);
  ellipse(198, 145, 3, 3);//eyes
 
  fill(252, 167, 82);
  bezier(187, 155, 190, 160,
         190, 160, 193, 155);//nose
  
  stroke(203, 29, 55);
  bezier(180, 170, 195, 160,
         195, 160, 200, 170);//mouth
  
  float power = 3;
  float d = mouseX/8;
  for (int y = 100; y < 200; y++)
  {
    for (int x = 125; x < 255; x++)
    {
       float total = 0.0;
       for (float i = d; i >= 1; i = i/2.0)
       {
          total += noise(x/d, y/d) * d;
       }
       float turbulence = 128.0 * total / d;
       float base=(x * 0.2) + (y * 0.12);
       float offset = base + (power * turbulence / 256.0);
       float gray= abs(sin(offset)) * 256.0;
       stroke(gray);
       point(x, y);
    }
  }//screen 
         
  stroke(0);
  line(275, 75, mouseX, mouseY);//TVsignal
}



