
void setup()
{
  size (500,500);
     background(239,236,205);
  smooth();
}
void draw()
{
 
  float haha=random(255);
 float hehe=random(80);
 
stroke (haha,random(mouseX/10,mouseY/10),random(mouseX/10,mouseY),20);
strokeWeight(3);
if (mousePressed == true) {
    fill(0);
  } else {
    fill(255);
 
fill (haha,random(mouseX/5,mouseY/5),random(mouseX/5,mouseY),15);
 
  ellipse (mouseX,mouseY,hehe,hehe);
 

  }
 
  
}
                
                
