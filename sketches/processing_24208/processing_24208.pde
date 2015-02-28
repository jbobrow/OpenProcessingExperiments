

int patternSeperationX = 200;
int patternSeperationY = 231;
 

void setup(){
  size(600,693);
//  size(1200,1386);
  background(2,124,175);
  smooth();
  fill(2,124,175);
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);
   
  for(int i = 0; i < width/patternSeperationX; i++){
      for(int j = 0; j < height/patternSeperationY; j++){
        pushMatrix();
        translate(i*patternSeperationX, j*patternSeperationY);
        yourFunction();
        popMatrix();
      }
  }
   
}
 
 
void draw()
{

}
 

 
void yourFunction(){
   

  
//main design
//black
fill(255,255,255,80);
ellipse(100,116,110,120);
noFill();

bezier(80,231,120,190,175,185,148,84);
bezier(121,231,160,200,180,180,148,84);

bezier(-80,-231,-120,-190,-175,-185,-148,-84);
bezier(-121,-231,-160,-200,-180,-180,-148,-84);






//white
fill(255,255,255,40);
arc(0,0,110,120,0,PI/2);
arc(200,0,110,120,PI/2,PI);
arc(0,231,110,120,PI+(PI/2),2*PI);
arc(200,231,110,120,PI,PI*3/2);

noFill();
bezier(144,0,130,110,180,120,200,132);
bezier(144,0,145,50,170,80,200,99);

bezier(-144,0,-130,-110,-180,-120,-200,-132);
bezier(-144,0,-145,-50,-170,-80,-200,-99);
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


