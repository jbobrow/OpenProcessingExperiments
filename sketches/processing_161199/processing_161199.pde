
void setup() {
  smooth();
}

void draw()
{
  rectMode(CENTER);
  background(0);
 
  if (keyPressed == true)
  {
    if (key == 'a') {
      fill(255);
      ellipse(50,50,90,90);
    }
    else if (key == 'z') {
      fill(255);
      ellipse(50,50,80,80);
   }
       else if (key == 'e') {
      fill(255);
         ellipse(50,50,70,70);
   }
       else if (key == 'r') {
       fill(255);
         ellipse(50,50,60,60);
   }
       else if (key == 't') {
      ellipse(50,50,50,50);
   }
       else if (key == 'y') {
      ellipse(50,50,40,40);
   }
       else if (key == 'u') {
      ellipse(50,50,30,30);
   }
       else if (key == 'i') {
      ellipse(50,50,20,20);
   }
       else if (key == 'o') {
      ellipse(50,50,10,10);
   }
noCursor();
   
  }
}



