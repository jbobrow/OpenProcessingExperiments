
float r=50;
float theta= 0;

void setup (){
  size (600,600);
  background (185,241,126);
  smooth ();
}
void draw (){
 
  if(mousePressed && (mouseButton == RIGHT))
 {
ellipse(mouseX+random(15),mouseY+random(20), 10+ random(20), 10+ random(20));
float x= r * cos(theta);
float y= r * sin(theta);
  fill(34+random(214),37+random(215),30+random(216));  // Set fill to white
  
   
 }
if (mousePressed && (mouseButton == LEFT))
{
 float x = r * cos(theta);
      float y = r * sin(theta);
      noStroke();
      fill(random(255),random(255),random(255),random(255));
triangle(mouseX+30,mouseY+75,mouseX+58,mouseY+20,mouseX+86,mouseY+75);

}

else 
  {
      float x = r * cos(theta);
      float y = r * sin(theta);
      noStroke();
      fill(random(255),random(255),random(255),random(255));
 ellipse(x+mouseX, y+mouseY, 16, 16);

      theta += 1.2;

 
  }
  
 
}

