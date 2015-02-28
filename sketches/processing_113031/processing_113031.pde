
PImage Abe; 
float timer = 0.0; 
float angle = 1.0;
float scaleSize = 1; 
float scaleSpeed = 1.0; 
void setup()
{
  colorMode(HSB, 360, 100, 100);
  size (500, 500);
  Abe = requestImage("Abe.png");


}



void draw()
{


  println(timer); 
  timer += 0.01;
  angle += 0.1;
  scaleSize += scaleSpeed; 
  
  
    if (timer >1)
  {
    background(206, 8, 8);
  
    }
  if (timer > 2)
  
  {
    pushMatrix();
    translate(width/2, height/2); 
    scale(random(scaleSize)); 
    rotate(random(angle)); 
    rect(random(-50, 100), random(20, 50), random(100, 200),random(0, 30));
    
    popMatrix(); 
  }

  if (timer > 5)
  {
    imageMode(CENTER);
    image(Abe, width/2, height/2, width, height); 
    Abe.filter(INVERT); 
   
   // fill(random(0, 10), random(60, 100),random(70, 86));
   // ellipse(random(10, 15), random(9, 20), random(50, 100), random(60, 70));
    
   // fill(random(0, 100), random(100, 150), random(200, 250));
   // ellipse(random(100, 150), random(90, 200), random(70, 170), random(120, 140));
    
    //fill(random(0, 50), random(70, 90), random(160, 230));
   // ellipse(random(200, 150), random(300, 200), random(400, 350), random(275,300));
    
    
    
  }
  
  
  
  
  if(scaleSize > 7 || scaleSize < 3)
  {
    scaleSpeed = -scaleSpeed; 
  
  }
  


}


