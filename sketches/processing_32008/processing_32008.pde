
void setup(){
   

  size(600, 600);
  background(255);
  translate(300,300);
  smooth();
   
  float well = 2.0;
  float um = 10.0;
   
  noFill(); 
  stroke(0, 85);
 
  for(int ya = 2; ya < um*9; ya++){
    rect(0, 0, 30, 200);
    rotate(PI/30);

   stroke(0, 100);
  
   rect(0, 0, 75, 200);
    rotate(PI/120);
      if(ya == um*3){
        scale(well);
      }
      if(ya == um*6){
        scale(well);
      }
      if(ya == um*9){
        scale(well);
      }
  }
}

void draw(){
}
  
void keyPressed()
//Takes PNG screenshots when you push S
//Careful - doesn't prompt when overwriting files!
{
  if(key == 's' || key == 'S')
  {
    String sketch_BOOM1 = selectInput("Saving PNG - Select or Type File Name");  // Opens file chooser
    if(sketch_BOOM1 != null)
    {
      save(sketch_BOOM1 + ".png");
    }
  }
}






