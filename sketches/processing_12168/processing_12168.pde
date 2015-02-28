
//Smoky Rainbow by Jeffrey Xu
//17 September, 2010

boolean nowDragging;
int clickX, clickY, releaseX, releaseY;
void setup()
{
  random (50,100);
  background(0);
 size(1000,1000);
 smooth();
 noStroke();
}
void draw()
{

  fill(mouseX,mouseY,mouseX,20);
  if (mousePressed == true) {
    fill(random(0,255),random(0,255),random(0,255));
    rect(mouseX,mouseY,50,50);}
    else {
      ellipse(mouseX,mouseY,50,50);}
  

  if (mousePressed && (mouseButton == LEFT)){
    fill(0);
  } else {
    fill(255);
  }

}
  
  
  



  
  

