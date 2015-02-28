
float angle = 1.0;
float timer = 0.0;
float scalerec = 1;
float scaleam = 0.02;
 
void setup()
{
  background(0);
  size(500,500);
  colorMode(HSB, 360, 100, 100); 
}
 
void draw()
{
    background(0);
    timer += 0.0167;
    angle+= -.1; 
    scalerec += scaleam;
    if (scalerec > 2)
    {
      scaleam = -.02;
    }
    if (scalerec < 1)
    {
      scaleam = .02;
    }
     
    if (timer >4 && timer < 7)
    {
  angle += 0.95;
      fill(random(200),random(255),random(200));
    rectMode(CENTER);
    pushMatrix();
    translate(250, 250);
    rotate(angle);
    rect(0, 0, 50, 100);
    popMatrix();
    if (timer > 30)
    angle += 0.5;
   fill(0,0,0);


    }
 
    if (timer > 0 && timer < 4)
    {
       
      rectMode(CENTER);
      pushMatrix();
      translate(75,75);
      scale(scalerec);
      rect(100,100,200,200);
      popMatrix();
     
    }
 
 }
  
     



