
PFont font_lisa;
void setup()
{
  size (500, 500);
  smooth();
  
  font_lisa = createFont("FiraSans-Regular.ttf", 100, true);
}
 
void draw()
{
  background(255);
  translate(250, 250);
  

  for (int i=0; i<360; i+=30)
  
 
  {
    pushMatrix();
    noFill();
    stroke(random(0), random(0) ,random(255));
    rotate(radians(i));
    ellipse(100+ random(mouseX), 0, 100, 100);
    popMatrix();
     
    pushMatrix();
    noFill();
    stroke(random(0), random(0) ,random(255),80);
    rotate(radians(i));
    ellipse(120+ random(mouseX), 0, 100, 100);
    popMatrix();
    
    pushMatrix();
    float sekunde_3 = map(millis()*3, 0, 60, 0, 2*PI);
    textFont(font_lisa);
    textSize(45);
    textAlign(CENTER,CENTER);
    fill(#908D8D,70);
    rotate(sekunde_3);
    text("Yummie",50,50);
    popMatrix();
  }
}



