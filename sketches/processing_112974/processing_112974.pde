

float hue = 0.0;
float offset = 20;
float timer = 0.0;
float r = 0;
float thick = 1; 

void setup() {
  
 size(500, 500);
 colorMode(HSB, 285,200,150);
 background(0);

}

void draw() {

 noStroke();
  strokeWeight(2);
  drawRect();

}
float rectX = 0.0;
 
void drawRect()
{
  rectX += 1;
   
  if (rectX > width/2)
  {
    rectX = 0;
  }
   
  hue += offset;
  if (hue >= 360)
  {
     offset = -offset;
     hue = 360; 
  }
  else if (hue < 0)
  {
    offset = -offset;
    hue = 0; 
  }
  fill(hue, 150, hue);
   
  float angle = rectX * 1;
  float rectY = (height / 2) + sin(radians(random(-angle,angle))) * (height / 2);
  rect(rectY, rectX, 50, 50);
  rect(rectX, rectY, random(50,150), random(100,150));
  
  
   noStroke();
  strokeWeight(2);
  drawEllipse1();
}
 
float ellipseX1 = 0.0;
 
void drawEllipse1()
{
  ellipseX1 += .56;
   
  if (ellipseX1 >random(width/4,width/2))
  {
    ellipseX1 = 0;
  }
   
  hue += offset;
  if (hue >= 180)
  {
     offset = -offset;
     hue = 180; 
  }
  else if (hue < 0)
  {
    offset = -offset;
    hue = 0; // 
  }
  fill(hue, 350, hue);
   
  float angle1 = ellipseX1 * 2;
  float ellipseY1 = (width / 2) + cos(radians(angle1)) * (width / 2);
  ellipse(ellipseX1, ellipseY1, random(50,100),random(50,100));
  ellipse(ellipseY1, ellipseX1, 50, 50);
  
  thick = thick + 1;
   if (thick > 5)
   {
     thick = 1.5;
   }
  
  stroke(255);
  strokeWeight(thick);
   r = r + 0.1;
  pushMatrix(); 
    translate(400,400); 
    smooth();
    fill(hue,250,hue);
    rotate(r); 
    rect(-100,-100,100,100);
   
   
  
   translate(100, 100);
    rotate(r); 
    rect(-25,-25,50,50);
    popMatrix();


}





