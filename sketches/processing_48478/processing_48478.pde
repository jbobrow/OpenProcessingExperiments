

void setup()
{
 frameRate(2) ;
  size(600,1000) ;
 background(255,255,255) ;
 smooth();
 textAlign( CENTER) ;
}

void draw()
{
ellipse(300,500, 500,500) ;
fill(135,100,255);
  textSize(36);
text("Mr. Stapert gives this an A+", mouseX, mouseY) ; 
  
}
 
 void mousePressed()
{
 rect(mouseX, mouseY, 35,35) ;
  fill(random(255),random(255),random(255)) ;  
  
}
  



