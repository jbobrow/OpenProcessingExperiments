

void setup()
{
  smooth();
  background(0);
  size(450, 450);
  noCursor();
}
 
int innen = 10;
int aussen = 300;
int distanz = 5;
float stroke_weight = 0.5;
boolean stroke = false;
 
void draw(){
  if(mousePressed){
   
  noStroke();
  for (int A = 0; A < aussen; A+=distanz)
  {
    fill(2,224,18, A/innen);
    strokeWeight(stroke_weight);
    stroke(0);
    if (stroke == false)
    {
      noStroke();
    }
    ellipse(mouseX, mouseY, aussen - A, aussen - A);
    
    noFill();
    stroke(0,95,7,50);
    ellipse(mouseX+10, mouseY, aussen-10, aussen-A);
  }
  
  
  
  
  
    
  }else{
     background(0);
  noStroke();
  for (int A = 0; A < aussen; A+=distanz)
  {
    fill(255,2,2, A/innen);
    strokeWeight(stroke_weight);
    stroke(0);
    if (stroke == false)
    {
      noStroke();
    }
    ellipse(mouseX, mouseY, aussen - A, aussen - A);
    
    noFill();
    stroke(0,50);
    ellipse(mouseX+10, mouseY, aussen-10, aussen-A);
   
   
   
   
   }}}

