
///////////////////////////////////////////////
/// Written by Levi Berge, 7th March 2011   ///
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
  smooth();
   
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
  //This is here so the program keeps running and the screengrab will work
}
 
 
void yourFunction(){
   
  //-------------------------------------YOUR PATTERN GOES IN HERE-------------------------------
  //try making pleasant designs :-)

noStroke();
fill(30,130,30);
quad(0,0,0,100,100,100,100,0);




//corner flower petals
fill(19, 4, 196);
//ellipse(10, 10, 45, 25);
arc(0, 0, 65, 25, 0, PI/2);
//ellipse(90, 90, 45, 25);
arc(100, 100, 65, 25, PI, TWO_PI-PI/2);
//ellipse(10, 10, 25, 45);
arc(0, 0, 25, 65,  0, PI/2);
//ellipse(90, 90, 25, 45);
arc(100, 100, 25, 65, PI, TWO_PI-PI/2);
//ellipse(10, 90, 45, 25);
arc(0, 100, 65, 25, TWO_PI-PI/2, TWO_PI);
//ellipse(90, 10, 45, 25);
arc(0, 100, 25, 65, TWO_PI-PI/2, TWO_PI);
//ellipse(10, 90, 25, 45);
arc(100, 0, 65, 25, PI/2, PI);
//ellipse(90, 10, 25, 45);
arc(100, 0, 25, 65, PI/2, PI);


//corner flower centre
//fill(189,195,0);
//arc(100, 100, 30, 30, PI, TWO_PI-PI/2);
//arc(0, 100, 30, 30, TWO_PI-PI/2, TWO_PI);
//arc(100, 0, 30, 30, PI/2, PI);
//arc(0, 0, 30, 30, 0, PI/2);

//flower petals

fill(112, 34, 178);
//stroke(122, 37, 188);
ellipse(30, 50, 45, 25);
ellipse(70, 50, 45, 25);
ellipse(50, 70, 25, 45);
ellipse(50, 30, 25, 45);

   
    //flower centre
    fill(189,195,0);
    ellipse(50, 50, 30, 30);
    
fill(234,172,0);
ellipse(0,0,25,25);
ellipse(100,100,25,25);
ellipse(0,100,25,25);
ellipse(100,0,25,25);
//ellipse(10, 10, 20, 20);
//ellipse(90, 90, 20, 20);
//ellipse(10, 90, 20, 20);
//ellipse(90, 10, 20, 20);


   
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

