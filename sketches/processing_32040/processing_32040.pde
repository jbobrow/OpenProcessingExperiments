
void setup(){
   

  size(600, 600);
  background(255);
  translate(300,300);
  smooth();
   
  float well = 2.0;
  float um = 20.0;
   
  noFill(); 
  stroke(0, 100);
 
  for(int ya = 2; ya < um*9; ya++){
    ellipse(0, 0, 75, 200);
    rotate(PI/90);

    ellipse(0, 0, 75, 200);
    rotate(PI/90);
      if(ya == um*3){
        scale(well);
      }
      if(ya == um*6){
        scale(well);
      }
      if(ya == um*9){
        scale(well);
      }
      if(ya == um*12){
        scale(well);
      }
      if(ya == um*15){
        scale(well);
      } 
         if(ya == um*18){
        scale(well);
      }
      if(ya == um*21){
        scale(well);
      }
      if(ya == um*24){
        scale(well);
      }
      if(ya == um*27){
        scale(well);
      }
      if(ya == um*30){
        scale(well);
      }
      if(ya == um*33){
        scale(well);
      }
      if(ya == um*36){
        scale(well);
      }
      if(ya == um*39){
        scale(well);
      }
      if(ya == um*42){
        scale(well);
      }
    
  }
}
  
void keyPressed()
//Takes PNG screenshots when you push S
//Careful - doesn't prompt when overwriting files!
{
  if(key == 's' || key == 'S')
  {
    String sketch_jul31b = selectInput("Saving PNG - Select or Type File Name");  // Opens file chooser
    if(sketch_jul31b != null)
    {
      save(sketch_jul31b + ".png");
    }
  }
}






