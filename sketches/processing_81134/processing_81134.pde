
int w = 3;
int l = w*70;
int h = w*15;

void setup()
{
  size(1000,500);
  background(0);
  noStroke();
  frameRate(15);
 
  
}

void draw()
{

  fill(0,0,0,20);
  noStroke();
  rect(0,0,width,height);
  stroke(255);
  strokeWeight(3);
  translate((width/2)-l,(height/2)-h);
  atn();

}
void atn()
 {
   stroke(255);
   line(random(-5,5)*w,random(25,35)*w,random(35,45)*w,random(-5,5)*w);
   line(random(35,45)*w,random(-5,5)*w,random(35,45)*w,random(25,35)*w);
   line(random(45,55)*w,random(-5,5)*w,random(85,95)*w,random(-5,5)*w);
   line(random(65,75)*w,random(-5,5)*w,random(65,75)*w,random(25,35)*w);
   line(random(95,105)*w,random(-5,5)*w,random(95,105)*w,random(25,35)*w);
   line(random(95,105)*w,random(-5,5)*w,random(135,145)*w,random(25,35)*w);
   line(random(135,145)*w,random(25,35)*w,random(135,145)*w,random(-5,5)*w);
   stroke(255,random(0,200),0);
   line(random(-25,-15)*w,random(-25,-15)*w,random(155,165)*w,random(-25,-15)*w);
   line(random(-25,-15)*w,random(-25,-15)*w,random(-25,-15)*w,random(45,55)*w);
   line(random(-25,-15)*w,random(45,55)*w,random(155,165)*w,random(45,55)*w);
   line(random(155,165)*w,random(-25,-15)*w,random(155,165)*w,random(45,55)*w);
 }




