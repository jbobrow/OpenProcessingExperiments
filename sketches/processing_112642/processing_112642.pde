
float angle = 0;
float timer = 0;
float timer2 = 0;
float timer3 = 0;
float hue = 0.0;
float offset = 1;
float ellipseX = 0.0;
PImage creepImage;
void setup()
{
  creepImage = requestImage("creep.jpg");
  size(500,500);
  colorMode(HSB, 360,100,100);
}

void draw()
{
  ellipseX += 1;
  hue += offset;
  timer += 1;
  background(0);
  angle += 0.1;
  //rotate(radians(45));
  float degrees = radians(45);
  rectMode(CENTER);
  hue += offset;
  fill(hue, 100, 100);
  
  if( timer <= 60)
  {
  pushMatrix(); //start transforms ONLY
  translate(width/2, height/2); //use translate first
  rotate(degrees); // rotate second
  scale(2); //scale third
  rect(0, 0, 100, 100);
  popMatrix(); //end tranforms ONLY
  }
  
  else if (timer >= 60 && timer <= 120)
  {
  pushMatrix(); //start transforms ONLY
  translate(100,100); //use translate first
  rotate(angle); // rotate second
  rect(0,0,100,100);
  popMatrix(); //end tranforms ONLY
  }
  
  else if(timer >= 120 && timer <= 180)
 {
   ellipseX += 1;
   
    if (hue >= 360)
  { 
    offset = -1;
  }
  else if (hue < 0)
  {
    offset = 1;
  }
  
  float ellipseY = (height/2) + sin(radians(ellipseX * 5)) * 100;
  ellipse(ellipseX, ellipseY, 100, 100);
  ellipse(ellipseY, ellipseX, 100, 100); 
   if(timer == 180
   )
 {
   hue = 0.0;
   offset = 1;
   ellipseX = 0.0;
 }
  
 }
 
 if (timer == 180 && timer2 != 2)
 {
   timer = 0;
   timer2 ++;
 }
 
 if (timer == 180 && timer2 == 2 || timer3 > 0)
 {
 timer3 ++;
 imageMode(CENTER);
 image(creepImage, width /2, height /2, creepImage.width, creepImage.height);
 if (timer3 == 120)
 { 
 timer = 0;
 timer2 = 0;
 timer3 = 0;
 }
 
 }

}


