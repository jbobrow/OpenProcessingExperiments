
int b;
void setup()
{
  size (800,800);
  background(255);
  smooth();
}

void draw() 
{
  if(mousePressed == false) {
    cursor(ARROW);
  } else {
    cursor(CROSS);
    fill(b);
    ellipse(mouseX, mouseY, 50, 50);
    fill(random(255),random(255),random(255));
    strokeWeight(5);
    line(mouseX,mouseY,pmouseX,pmouseY);

    mouseDragged() ;
  b = b + 5;
  if (b > 255) {
    b = 0;}
  

  }
 }
   void keyPressed()
   {
    if(keyPressed==true)
    {
     background(255);
    }  
   }




