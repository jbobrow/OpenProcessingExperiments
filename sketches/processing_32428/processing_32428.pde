
void setup(){
   

  size(800, 400);
  background(255);
  translate(750,0);
  smooth();
   
  float well = 2.0;
  float um = 10.0;
   
  noFill(); 
  stroke(0,90);
 
  for(int ya = 2; ya <= um*48; ya++){
   pushMatrix();
translate(50, 50, well); 
popMatrix();

    rotate(PI/360);
    
   
   triangle(300, 300, 68, 20,20,20);
    rotate(PI/360);
      
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
      if(ya == um*45){
        scale(well);
      }
        if(ya == um*48){
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
    String sketch_Steps = selectInput("Saving PDF - Select or Type File Name");  // Opens file chooser
    if(sketch_Steps != null)
    {
      save(sketch_Steps + ".pdf");
    }
  }
}




