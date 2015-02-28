
void setup()
{
  size(600, 600);
  background(255);
  smooth();

  
  strokeWeight(10);
  ellipse(300,300,300,300); //face

  ellipse(200,300,20,20); // eyes
  ellipse(400,300,50,50);
  
  strokeWeight(5);
  rect(250, 390, 30, 30); //upper teeth
   rect(280, 390, 30, 30);
   rect(310, 390, 30, 30);
   
   strokeWeight(5);
   rect(270, 420, 10, 10); //bottom teeth
   rect(280, 420, 10, 10);
   rect(290, 420, 10, 10);
   
   strokeWeight(10);
   line(325, 325, 350, 350); //nose
   line(300, 360, 350, 350);
  
  strokeWeight(20);
  strokeCap(SQUARE);
  line(220, 270, 320, 270); //eyebrow


 
  
  
  
  
  
}

