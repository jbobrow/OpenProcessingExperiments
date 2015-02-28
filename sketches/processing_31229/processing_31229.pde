
            void setup(){
  size (500,500);
  
  background(255);
  fill (255);
  
  
  //Face Outline
  strokeWeight(6);
  fill(225,200,0);
  smooth();
  ellipse(250,250,400,400);
  
  //Eyes
  int yEnd = 175;
  strokeWeight(8);
  smooth();
  line(100,140,200,yEnd);
  line(100,210,200,yEnd);
  line(350,140,250,yEnd);
  line(350,210,250,yEnd);
  
  //Mouth
  line(110,275,375,275);
  fill(139,58,58);
  arc(250,280,250,280,PI*2, PI*3);
  fill(255,193,193);
  strokeWeight(0);
  arc(275,414,110,110,PI*2.975,PI*3.875);
  noFill();
  strokeWeight(8);
  arc(250,280,250,280,PI*2, PI*3);
  strokeWeight(2);
  
             
  
  
 
}

void rotate(){

}
  

void draw(){
 
 
 


 
  
}

void keyPressed()
//Takes PNG screenshots when you push S
//Careful - doesn't prompt when overwriting files!
{
  if(key == 's' || key == 'S')
  {
    String filePath = selectInput("Saving PNG - Select or Type File Name");  // Opens file chooser
    if(filePath != null)
    {
      save(filePath + ".png");
    }
  }
}
                
