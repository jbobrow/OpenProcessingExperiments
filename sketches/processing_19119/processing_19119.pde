
void setup() {
  size(250,250);
  background(0);
    smooth();
    noFill();
}
 
void draw() {
  if (mousePressed)// on mouse actions
  {
    float n = dist(width/2,height/2,mouseX,mouseY);//set of float prop.
    ellipse(mouseX, mouseY, n/2, n/2);//mouse hovers
    ellipse(250-mouseX, mouseY, n/2, n/2);
    ellipse(mouseX, 250-mouseY, n/2, n/2);
    ellipse(250-mouseX, 250-mouseY, n/2, n/2);
    
    if((mouseX<125)&(mouseY<125))
   
    {
      stroke(random(65), random(170), 150, 50);//colours
    }
  }
  
}


