
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;


void setup(){
  size(500,500);
  
  //the white box simply shows you the space your pattern gets drawn in
  fill(255);
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);
  background(0);
  
  for(int i = 0; i <= width/patternSeperationX; i++){
      for(int j = 0; j <= height/patternSeperationY; j++){
        pushMatrix();
        translate(i*patternSeperationX, j*patternSeperationY);
        yourFunction();
        popMatrix();
      }
  }
  
}


void draw()
{
  //This is here so the program keeps running and the screengrab will work
}


void yourFunction(){
  int xpos = 0;
  int ypos = 0;
  int sizex = 20;
  int sizey = 20;
  int randColour = 4; 
  int grid = 10;
 
  //-------------------------------------YOUR PATTERN GOES IN HERE-------------------------------
  //try making pleasant designs :-)


  for (int i = 0; i < 10; i++){
    for(int j = 0; j < 10; j++){
     // rect (xpos,ypos, 12,12);
       if (round(random(randColour)) == 1) { 
         fill(255, 139, 253, random(0, 255));
         stroke(0, 0);
         ellipse(xpos, ypos, sizex,sizey);
         ypos += 10;
       }else if (round(random(randColour)) == 2){
         fill(191, 0, 6, random(0, 255));
         stroke(0, 0);
         ellipse(xpos, ypos, sizex,sizey);
         ypos += 10;
       }else {
         fill(145, 216,252, random(0, 255));
         stroke(0, 0);
         ellipse(xpos, ypos,sizex,sizey);
         ypos += 10;
       }
    }
   xpos += 10;
   ypos = 0;
  }
  
  
loadPixels();
  
  for(int i = 0; i < pixels.length; i++){
   pixels[i] = red(pixels[i]) <= 100 ? pixels[i] : color(255);  
  }
  
  updatePixels();  
  
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

